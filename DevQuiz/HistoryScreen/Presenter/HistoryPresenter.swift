import Foundation
import CoreData

protocol HistoryPresenterProtocol: AnyObject {
    func displayResults(_ results: [QuizResult])
}

final class HistoryPresenter {
    weak var view: HistoryPresenterProtocol?
    private let historyDataManager: HistoryDataManagerProtocol
    
    init(historyDataManager: HistoryDataManagerProtocol = HistoryDataManager()) {
        self.historyDataManager = historyDataManager
    }
    
    func viewDidLoad(view: HistoryPresenterProtocol) {
        self.view = view
        fetchResults()
    }
    
    private func fetchResults() {
        let results = historyDataManager.fetchQuizResults()
        view?.displayResults(results)
    }
}
