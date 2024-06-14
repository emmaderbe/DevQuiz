import UIKit

class QuizViewController: UIViewController {
    private let quizView = QuizView()
    private let presenter: QuizPresenter
    
    init(presenter: QuizPresenter) {
        self.presenter = presenter
        super.init(nibName: nil, bundle: nil)
    }
    
    @available(*, unavailable)
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func loadView() {
        view = quizView
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        presenter.viewDidLoad(view: self)
    }
    
    @objc private func optionButtonTapped(_ sender: UIButton) {
        guard let answer = sender.title(for: .normal) else { return }
        presenter.answerSelected(answer)
    }
}

extension QuizViewController: QuizViewProtocol {
    func displayQuestion(_ question: Question, current: Int, total: Int) {
        quizView.updateProgress(current: current, total: total)
        quizView.updateQuestion(question.text)
        quizView.updateOptions(question.options, target: self, action: #selector(optionButtonTapped(_:)))
    }
}

