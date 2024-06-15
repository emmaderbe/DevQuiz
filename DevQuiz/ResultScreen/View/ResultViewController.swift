import UIKit

class ResultViewController: UIViewController {
    private let resultView = ResultView()
    private let presenter: ResultPresenter
    
    init(presenter: ResultPresenter) {
        self.presenter = presenter
        super.init(nibName: nil, bundle: nil)
    }
    
    @available(*, unavailable)
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func loadView() {
        view = resultView
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        presenter.viewDidLoad(view: self)
        setupView()
    }
}

private extension ResultViewController {
    func setupView() {
        navigationItem.hidesBackButton = true
        setupTitle()
        setupResultTitle()
        setupButton()
    }
    
    func setupTitle() {
        resultView.setupTitle(with: "exclamationmark.circle.fill",
                              and: "Неплохо",
                              and: "Следует подучить, но сейчас ты хорошо справился")
    }
    
    func setupResultTitle() {
        resultView.setupResultTitle(result: "Правильных ответов:",
                                    category: "Тема квиза:",
                                    technology: "Язык:")
        resultView.setupResultImage(result: "questionmark.circle",
                                    category: "book",
                                    technology: "chevron.left.slash.chevron.right")
    }
}

private extension ResultViewController {
    func setupButton() {
        resultView.onEndQuizButtonTapped = { [weak self] in
            self?.presenter.endQuizSession()
        }
    }
}

extension ResultViewController: ResultViewProtocol {
    func navigateToView() {
        navigationController?.popToRootViewController(animated: true)
    }
}

