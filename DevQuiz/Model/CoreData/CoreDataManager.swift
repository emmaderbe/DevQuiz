import CoreData
import UIKit

protocol CoreDataManagerProtocol {
    func saveQuizResult(topic: TopicDTO, language: LanguageDTO, correctAnswers: Int32, totalQuestions: Int32)
    func fetchQuizResults() -> [QuizResult]
}

final class CoreDataManager: CoreDataManagerProtocol {
    func saveQuizResult(topic: TopicDTO, language: LanguageDTO, correctAnswers: Int32, totalQuestions: Int32) {
        let context = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
        let quizResult = QuizResult(context: context)
        quizResult.topic = topic.name
        quizResult.language = language.name
        quizResult.correctAnswers = correctAnswers
        quizResult.totalQuestions = totalQuestions
        quizResult.date = Date()
        
        do {
            try context.save()
            NotificationCenter.default.post(name: .dataDidChange, object: nil)
        } catch {
            print("Failed to save quiz result: \(error)")
        }
    }

    func fetchQuizResults() -> [QuizResult] {
        let context = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
        let fetchRequest: NSFetchRequest<QuizResult> = QuizResult.fetchRequest()
        fetchRequest.sortDescriptors = [NSSortDescriptor(key: "date", ascending: false)]
        
        do {
            let results = try context.fetch(fetchRequest)
            return results
        } catch {
            print("Failed to fetch quiz results: \(error)")
            return []
        }
    }
}

extension Notification.Name {
    static let dataDidChange = Notification.Name("dataDidChange")
}
