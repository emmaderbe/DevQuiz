import Foundation

protocol DevCategoryProtocol: AnyObject {
    func displayCategories()
    func navigateToView(with language: ProgrammingLanguage)
}

final class DevCategoryPresenter {
    weak var view: DevCategoryProtocol?
    private let categoryDataManager: CategoryDataManagerProtocol
    
    var categories: [Category] = []
    
    init(categoryDataManager: CategoryDataManagerProtocol = CategoryDataManager()) {
        self.categoryDataManager = categoryDataManager
    }
}

extension DevCategoryPresenter {
    func viewDidLoad(view: DevCategoryProtocol) {
        self.view = view
        fetchCategories()
    }
    
    func languageSelected(_ language: ProgrammingLanguage) {
        view?.navigateToView(with: language)
    }
}

private extension DevCategoryPresenter {
    func fetchCategories() {
        categoryDataManager.getCategories { [weak self] result in
            switch result {
            case .success(let categories):
                self?.categories = categories
                self?.view?.displayCategories()
            case .failure(let error):
                print(error.localizedDescription)
            }
        }
    }
}
