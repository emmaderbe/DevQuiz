import Foundation

protocol CategoryDataManagerProtocol {
    func getCategories(completion: @escaping (Result<[LanguageCategoryDTO], Error>) -> Void)
}

class CategoryDataManager: CategoryDataManagerProtocol {
    private let networkService: NetworkServiceProtocol
    private var categories: [Category] = []
    
    init(networkService: NetworkServiceProtocol = NetworkService()) {
        self.networkService = networkService
    }
}

extension CategoryDataManager {
    func getCategories(completion: @escaping (Result<[LanguageCategoryDTO], Error>) -> Void) {
        networkService.fetchCategories { [weak self] result in
            switch result {
            case .success(let categoryResponse):
                let languageCategories = categoryResponse.result.map { category in
                    LanguageCategoryDTO(title: category.title,
                                     languages: category.languages.map { LanguageDTO(name: $0.name,
                                                                                  description: $0.description,
                                                                                  icon: $0.icon) })
                }
                completion(.success(languageCategories))
            case .failure(let error):
                completion(.failure(error))
            }
        }
    }
}
