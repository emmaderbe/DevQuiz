import Foundation

protocol HistoryPresenterProtocol: AnyObject {

}

final class HistoryPresenter {
    weak var view: HistoryPresenterProtocol?
}

extension HistoryPresenter {
    func viewDidLoad(view: HistoryPresenterProtocol) {
        self.view = view
    }
}
