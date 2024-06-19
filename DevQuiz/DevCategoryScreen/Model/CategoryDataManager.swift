import Foundation

protocol CategoryDataManagerProtocol {
    func getCategories(completion: @escaping (Result<[Category], Error>) -> Void)
    func getLanguages(for category: Category) -> [Language]
}

class CategoryDataManager: CategoryDataManagerProtocol {
    private let networkService: NetworkServiceProtocol
    private var categories: [Category] = []
    
    init(networkService: NetworkServiceProtocol = NetworkService()) {
        self.networkService = networkService
    }
}

extension CategoryDataManager {
    func getCategories(completion: @escaping (Result<[Category], Error>) -> Void) {
        networkService.fetchCategories { [weak self] result in
            switch result {
            case .success(let categoryResponse):
                self?.categories = categoryResponse.result
                completion(.success(categoryResponse.result))
            case .failure(let error):
                completion(.failure(error))
            }
        }
    }
    
    func getLanguages(for category: Category) -> [Language] {
        return category.languages.map { Language(name: $0.name, description: $0.description, icon: $0.icon) }
    }
}
