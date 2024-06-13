import Foundation

protocol SelectionTestProtocol: AnyObject {
    func displayTopicks(topic: [Topic])
}

final class SelectionTestPresenter {
    weak var view: SelectionTestProtocol?
    private let networkService = MockDataService()
}

extension SelectionTestPresenter {
    func viewDidLoad(view: SelectionTestProtocol) {
        self.view = view
        fetchCategories()
    }
}

private extension SelectionTestPresenter {
    func fetchCategories() {
        let topics = networkService.getMockCategories()
//        view?.displayTopicks(topic: topics)
    }
}
