import UIKit

class SelectionTestViewController: UIViewController {
    private let selectionTestView = SelectionTestView()
    private let dataSource = SelectionTestDataSource()
    private let delegate = SelectionTestDelegate()
    private var presenter: SelectionTestPresenter
    
    init(presenter: SelectionTestPresenter) {
        self.presenter = presenter
        super.init(nibName: nil, bundle: nil)
    }
    
    @available(*, unavailable)
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func loadView() {
        view = selectionTestView
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        presenter.viewDidLoad(view: self)
        setupView()
    }
}

private extension SelectionTestViewController {
    func setupView() {
        setupDataSource()
        setupDelegate()
    }
    
    func setupDataSource() {
        selectionTestView.setDataSource(dataSource)
    }
    
    func setupDelegate() {
        delegate.delegate = self
        selectionTestView.setDelegates(delegate)
    }
}

extension SelectionTestViewController: SelectionTestProtocol {
    func displayTopics(topics: [TopicDTO]) {
        dataSource.updateTopics(topics)
        delegate.updateTopics(topics)
        DispatchQueue.main.async {
            self.selectionTestView.reloadData()
        }
    }
    
    func navigateToView(with questions: [QuestionDTO], language: LanguageDTO, topic: TopicDTO) {
        let presenter = QuizPresenter(topic: topic, language: language)
        presenter.setSelectedQuiz(questions)
        let viewController = QuizViewController(presenter: presenter)
        navigationController?.pushViewController(viewController, animated: true)
    }
}

extension SelectionTestViewController: SelectionTestDelegateProtocol {
    func questionsSelected(_ questions: [QuestionDTO], _ topic: TopicDTO) {
        presenter.setSelectedTopic(topic)
        presenter.topicSelected(questions)
    }
}
