import Foundation

protocol QuizViewProtocol: AnyObject {
    func displayQuestion(_ question: Question, current: Int, total: Int)
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
}

extension QuizPresenter {
    func answerSelected(_ answer: String) {
        guard currentQuestionIndex < questions!.count else { return }
        let correctAnswer = questions![currentQuestionIndex].correctAnswer
        if answer == correctAnswer {
            print("Correct!")
        } else {
            print("Incorrect!")
        }
        currentQuestionIndex += 1
        showCurrentQuestion()
    }
}

private extension QuizPresenter {
    private func showCurrentQuestion() {
        guard currentQuestionIndex < questions!.count else { return }
        let question = questions![currentQuestionIndex]
        view?.displayQuestion(question, current: currentQuestionIndex + 1, total: questions!.count)
    }
}
