import Foundation

protocol DevCategoryProtocol: AnyObject {
    func displayCategories(categories: [DevCategory])
}

final class DevCategoryPresenter {
    weak var view: DevCategoryProtocol?
    private let networkService = NetworkService()
}

extension DevCategoryPresenter {
    func viewDidLoad(view: DevCategoryProtocol) {
        self.view = view
        fetchCategories()
    }
}

private extension DevCategoryPresenter {
    func fetchCategories() {
        networkService.fetchData { [weak self] result in
            switch result {
            case .success(let categories):
                self?.view?.displayCategories(categories: categories)
            case .failure(let error):
                print("Error fetching categories: \(error)")
            }
        }
    }
}
