import Foundation

protocol ResultViewProtocol: AnyObject {
    func navigateToView()
}

final class ResultPresenter {
    weak var view: ResultViewProtocol?
    
}

extension ResultPresenter {
    func viewDidLoad(view: ResultViewProtocol) {
        self.view = view
    }
    
    func endQuizSession() {
        view?.navigateToView()
    }
}
