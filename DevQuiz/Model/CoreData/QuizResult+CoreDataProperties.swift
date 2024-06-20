import Foundation
import CoreData


extension QuizResult {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<QuizResult> {
        return NSFetchRequest<QuizResult>(entityName: "QuizResult")
    }

    @NSManaged public var topic: String?
    @NSManaged public var language: String?
    @NSManaged public var correctAnswers: Int32
    @NSManaged public var totalQuestions: Int32

}

extension QuizResult : Identifiable {

}
