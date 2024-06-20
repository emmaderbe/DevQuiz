import Foundation

protocol TopicDataManagerProtocol {
    func getTopics(for language: LanguageDTO, completion: @escaping (Result<[TopicDTO], Error>) -> Void)
}

class TopicDataManager: TopicDataManagerProtocol {
    private let networkService: NetworkServiceProtocol
    private var topics: [TopicDTO]?

    init(networkService: NetworkServiceProtocol = NetworkService()) {
        self.networkService = networkService
    }
}

extension TopicDataManager {
    func getTopics(for language: LanguageDTO, completion: @escaping (Result<[TopicDTO], Error>) -> Void) {
        networkService.fetchTopics(for: language.name) { result in
            switch result {
            case .success(let topicResponse):
                let quizTopics = topicResponse.result.map { topic in
                    TopicDTO(name: topic.name, description: topic.description, icon: topic.icon, questions: topic.questions.map { question in
                        QuestionDTO(text: question.text, options: question.options, correctAnswer: question.correctAnswer)
                    })
                }
                self.topics = quizTopics
                completion(.success(quizTopics))
            case .failure(let error):
                completion(.failure(error))
            }
        }
    }
}
