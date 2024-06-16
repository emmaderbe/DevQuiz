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
        resultView.setupTitle(with: ResultEnum.ResultImage.mediumResultTitleImage,
                              and: ResultEnum.ResultString.mediumResultTitle,
                              and:ResultEnum.ResultString.mediumResultDescription)
    }
    
    func setupResultTitle() {
        resultView.setupResultTitle(result: ResultEnum.ResultString.resultTitle,
                                    category: ResultEnum.ResultString.categoryTitle,
                                    technology: ResultEnum.ResultString.technologyTitle)
        resultView.setupResultImage(result: ResultEnum.ResultImage.resultTitleImage,
                                    category: ResultEnum.ResultImage.categoryTitleImage,
                                    technology: ResultEnum.ResultImage.technologyTitleImage)
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

