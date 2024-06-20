import Foundation

protocol ResultViewProtocol: AnyObject {
    func navigateToView()
    func setupResultText(result: String, category: String, technology: String)
}

final class ResultPresenter {
    weak var view: ResultViewProtocol?
    private var result: String?
    private var category: String?
    private var technology: String?
}

extension ResultPresenter {
    func viewDidLoad(view: ResultViewProtocol) {
        self.view = view
        setupResultText()
    }
    
    func setQuizResult(result: String, category: String, technology: String) {
        self.result = result
        self.category = category
        self.technology = technology
    }
    
    func endQuizSession() {
        view?.navigateToView()
    }
}

private extension ResultPresenter {
    func setupResultText() {
        guard let result = result, let category = category, let technology = technology else {
            return
        }
        view?.setupResultText(result: result, category: category, technology: technology)
    }
}
