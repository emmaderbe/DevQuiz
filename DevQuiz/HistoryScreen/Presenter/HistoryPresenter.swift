import Foundation
import CoreData

protocol HistoryPresenterProtocol: AnyObject {
    func displayResults(_ results: [QuizResult])
}

final class HistoryPresenter {
    weak var view: HistoryPresenterProtocol?
    private let coreDataManager: CoreDataManagerProtocol
    
    init(coreDataManager: CoreDataManagerProtocol = CoreDataManager()) {
        self.coreDataManager = coreDataManager
        NotificationCenter.default.addObserver(self, selector: #selector(dataDidChange), name: .dataDidChange, object: nil)
    }
}

private extension HistoryPresenter {
    func fetchResults() {
        let results = coreDataManager.fetchQuizResults()
        view?.displayResults(results)
    }
    
    @objc func dataDidChange() {
        fetchResults()
    }
}

extension HistoryPresenter {
    func viewDidLoad(view: HistoryPresenterProtocol) {
        self.view = view
        fetchResults()
    }
}
