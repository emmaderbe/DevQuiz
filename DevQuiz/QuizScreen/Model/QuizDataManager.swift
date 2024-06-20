import CoreData
import UIKit

protocol QuizDataManagerProtocol {
    func saveQuizResult(topic: TopicDTO, language: LanguageDTO, correctAnswers: Int32, totalQuestions: Int32)
}

final class QuizDataManager: QuizDataManagerProtocol {
    func saveQuizResult(topic: TopicDTO, language: LanguageDTO, correctAnswers: Int32, totalQuestions: Int32) {
        let context = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
        let quizResult = QuizResult(context: context)
        quizResult.topic = topic.name
        quizResult.language = language.name
        quizResult.correctAnswers = correctAnswers
        quizResult.totalQuestions = totalQuestions
        do {
            try context.save()
        } catch {
            print("Failed to save quiz result: \(error)")
        }
    }
}
