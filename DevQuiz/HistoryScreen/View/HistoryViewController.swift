import UIKit

class HistoryViewController: UIViewController {
    private let historyView = HistoryView()
    private let dataSource = HistoryDataSource()
    private var presenter: HistoryPresenter
    
    init(presenter: HistoryPresenter) {
        self.presenter = presenter
        super.init(nibName: nil, bundle: nil)
    }
    
    @available(*, unavailable)
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func loadView() {
        view = historyView
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        presenter.viewDidLoad(view: self)
        setupView()
    }
}

private extension HistoryViewController {
    func setupView() {
        setupDataSource()
    }
    
    func setupDataSource() {
        historyView.setDataSource(dataSource)
    }
}

extension HistoryViewController: HistoryPresenterProtocol {
    func displayResults(_ results: [QuizResult]) {
        dataSource.updateResults(results)
        historyView.reloadData()
    }
}
