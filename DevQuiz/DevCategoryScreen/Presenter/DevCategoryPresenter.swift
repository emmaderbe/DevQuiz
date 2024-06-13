import Foundation

protocol DevCategoryProtocol: AnyObject {
    func displayCategories()
    func navigateToView(with language: ProgrammingLanguage)
}

final class DevCategoryPresenter {
    weak var view: DevCategoryProtocol?
    private let networkService = MockDataService()
    
    var categories: [Category] {
        return networkService.getMockCategories()
    }
}

extension DevCategoryPresenter {
    func viewDidLoad(view: DevCategoryProtocol) {
        self.view = view
        view.displayCategories()
    }
    
    func languageSelected(_ language: ProgrammingLanguage) {
        view?.navigateToView(with: language)
    }
}
