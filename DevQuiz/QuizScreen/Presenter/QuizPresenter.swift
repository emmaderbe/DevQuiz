import Foundation

protocol QuizViewProtocol: AnyObject {
    func displayQuestion(_ question: Question, current: Int, total: Int)
    func highlightOptionButton(isCorrect: Bool, buttonIndex: Int)
    func resetOptionButtons()
}

final class QuizPresenter {
    weak var view: QuizViewProtocol?
    private var questions: [Question]?
    private var currentQuestionIndex = 0
}

extension QuizPresenter {
    func viewDidLoad(view: QuizViewProtocol) {
        self.view = view
        showCurrentQuestion()
    }
    
    func setSelectedQuiz(_ questions: [Question]) {
        self.questions = questions
    }
    
    func answerSelected(_ answer: String, buttonIndex: Int) {
        guard let questions = questions, currentQuestionIndex < questions.count else { return }
        let correctAnswer = questions[currentQuestionIndex].correctAnswer
        let isCorrect = answer == correctAnswer
        view?.highlightOptionButton(isCorrect: isCorrect, buttonIndex: buttonIndex)
        
        DispatchQueue.main.asyncAfter(deadline: .now() + 1.0) { [weak self] in
            self?.currentQuestionIndex += 1
            self?.view?.resetOptionButtons()
            self?.showCurrentQuestion()
        }
    }
}

private extension QuizPresenter {
    func showCurrentQuestion() {
        guard let questions = questions, currentQuestionIndex < questions.count else { return }
        let question = questions[currentQuestionIndex]
        view?.displayQuestion(question, current: currentQuestionIndex + 1, total: questions.count)
    }
}
