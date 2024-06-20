import Foundation
import CoreData

protocol QuizViewProtocol: AnyObject {
    func displayQuestion(_ question: QuestionDTO, current: Int, total: Int)
    func highlightOptionButton(isCorrect: Bool, buttonIndex: Int)
    func resetOptionButtons()
    func navigateToResultView(result: String, category: String, technology: String)
}

final class QuizPresenter {
    weak var view: QuizViewProtocol?
    private var questions: [QuestionDTO]?
    private var currentQuestionIndex = 0
    private var correctAnswersCount = 0
    private let coreDataManager: CoreDataManagerProtocol
    private var selectedTopic: TopicDTO
    private var selectedLanguage: LanguageDTO
    
    init(coreDataManager: CoreDataManagerProtocol = CoreDataManager(), topic: TopicDTO, language: LanguageDTO) {
        self.coreDataManager = coreDataManager
        self.selectedTopic = topic
        self.selectedLanguage = language
    }
}

extension QuizPresenter {
    func viewDidLoad(view: QuizViewProtocol) {
        self.view = view
        showCurrentQuestion()
    }
    
    func setSelectedQuiz(_ questions: [QuestionDTO]) {
        self.questions = questions
    }
    
    func answerSelected(_ answer: String, buttonIndex: Int) {
        guard let questions = questions, currentQuestionIndex < questions.count else { return }
        
        let isCorrect = checkAnswer(answer, for: questions[currentQuestionIndex])
        if isCorrect {
            correctAnswersCount += 1
        }
        view?.highlightOptionButton(isCorrect: isCorrect, buttonIndex: buttonIndex)
        
        DispatchQueue.main.asyncAfter(deadline: .now() + 1.0) { [weak self] in
            self?.proceedToNextQuestionOrEndQuiz()
        }
    }
}

private extension QuizPresenter {
    func checkAnswer(_ answer: String, for question: QuestionDTO) -> Bool {
        return answer == question.correctAnswer
    }
    
    func showCurrentQuestion() {
        guard let questions = questions, currentQuestionIndex < questions.count else { return }
        let question = questions[currentQuestionIndex]
        view?.displayQuestion(question,
                              current: currentQuestionIndex + 1,
                              total: questions.count)
    }
    
    func proceedToNextQuestionOrEndQuiz() {
        guard let questions = questions else { return }
        currentQuestionIndex += 1
        
        if currentQuestionIndex < questions.count {
            view?.resetOptionButtons()
            showCurrentQuestion()
        } else {
            endQuiz()
        }
    }
}

private extension QuizPresenter {
    func saveQuizResult() {
        coreDataManager.saveQuizResult(topic: selectedTopic,
                                             language: selectedLanguage,
                                             correctAnswers: Int32(correctAnswersCount),
                                             totalQuestions: Int32(questions?.count ?? 0))
    }
    
    func endQuiz() {
        guard let questions = questions else { return }
        saveQuizResult()
        view?.navigateToResultView(result: "\(correctAnswersCount)/\(questions.count)",
                                   category: selectedTopic.name,
                                   technology: selectedLanguage.name)
    }
}
