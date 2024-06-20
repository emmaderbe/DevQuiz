import Foundation

protocol NetworkServiceProtocol {
    func fetchCategories(completion: @escaping (Result<CategoryResponse, Error>) -> Void)
    func fetchTopics(for language: String, completion: @escaping (Result<TopicResponse, Error>) -> Void)
}

enum NetworkError: Error {
    case invalidURL
    case clientError
    case serverError
    case noResults
    case unknown
}

final class NetworkService: NetworkServiceProtocol {
    private let urlSession = URLSession.shared
    
    func fetchCategories(completion: @escaping (Result<CategoryResponse, Error>) -> Void) {
        guard let request = makeCategoriesRequest() else {
            DispatchQueue.main.async {
                completion(.failure(NetworkError.invalidURL))
            }
            return
        }
        
        let task = urlSession.dataTask(with: request) { data, response, error in
            self.handleResponse(data: data, response: response, error: error, completion: completion)
        }
        task.resume()
    }
    
    func fetchTopics(for language: String, completion: @escaping (Result<TopicResponse, Error>) -> Void) {
        guard let request = makeTopicsRequest(for: language) else {
            DispatchQueue.main.async {
                completion(.failure(NetworkError.invalidURL))
            }
            return
        }
        
        let task = urlSession.dataTask(with: request) { data, response, error in
            self.handleResponse(data: data, response: response, error: error, completion: completion)
        }
        task.resume()
    }
}

private extension NetworkService {
    func makeCategoriesRequest() -> URLRequest? {
        guard let url = URL(string: "https://ios.quiz.jampad.cc/api/v1/quiz/categories") else {
            return nil
        }
        return URLRequest(url: url)
    }
    
    private func makeTopicsRequest(for language: String) -> URLRequest? {
        let urlString = "https://ios.quiz.jampad.cc/api/v1/quiz/topics/\(language.lowercased())"
        guard let url = URL(string: urlString) else {
            return nil
        }
        return URLRequest(url: url)
    }

    
    func handleResponse<T: Decodable>(data: Data?, response: URLResponse?, error: Error?, completion: @escaping (Result<T, Error>) -> Void) {
        guard let httpResponse = response as? HTTPURLResponse else {
            DispatchQueue.main.async {
                completion(.failure(NetworkError.unknown))
            }
            return
        }
        
        switch httpResponse.statusCode {
        case 200...299:
            if let data = data {
                do {
                    let decodedResponse = try JSONDecoder().decode(T.self, from: data)
                    DispatchQueue.main.async {
                        completion(.success(decodedResponse))
                    }
                } catch {
                    DispatchQueue.main.async {
                        completion(.failure(error))
                    }
                }
            } else {
                DispatchQueue.main.async {
                    completion(.failure(NetworkError.unknown))
                }
            }
        case 400...499:
            DispatchQueue.main.async {
                completion(.failure(NetworkError.clientError))
            }
        case 500...599:
            DispatchQueue.main.async {
                completion(.failure(NetworkError.serverError))
            }
        default:
            DispatchQueue.main.async {
                completion(.failure(NetworkError.unknown))
            }
        }
    }
}
