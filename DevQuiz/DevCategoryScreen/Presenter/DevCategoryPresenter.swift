import Foundation

protocol DevCategoryProtocol: AnyObject {
    func displayCategories(categories: [Category])
}

final class DevCategoryPresenter {
    weak var view: DevCategoryProtocol?
    private let networkService = MockDataService()
}

extension DevCategoryPresenter {
    func viewDidLoad(view: DevCategoryProtocol) {
        self.view = view
        fetchCategories()
    }
}

private extension DevCategoryPresenter {
    func fetchCategories() {
        let categories = networkService.getMockCategories()
        view?.displayCategories(categories: categories)
    }
}
