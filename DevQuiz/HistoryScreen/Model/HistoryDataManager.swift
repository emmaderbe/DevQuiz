import CoreData
import UIKit

protocol HistoryDataManagerProtocol {
    func fetchQuizResults() -> [QuizResult]
}

final class HistoryDataManager: HistoryDataManagerProtocol {
    func fetchQuizResults() -> [QuizResult] {
        let context = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
        let fetchRequest: NSFetchRequest<QuizResult> = QuizResult.fetchRequest()
        
        do {
            let results = try context.fetch(fetchRequest)
            return results
        } catch {
            print("Failed to fetch quiz results: \(error)")
            return []
        }
    }
}
