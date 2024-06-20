import UIKit

protocol SelectionTestDelegateProtocol: AnyObject {
    func questionsSelected(_ questions: [QuestionDTO], _ topic: TopicDTO)
}

final class SelectionTestDelegate: NSObject, UICollectionViewDelegate {
    private var topics: [TopicDTO] = []
    weak var delegate: SelectionTestDelegateProtocol?
}

extension SelectionTestDelegate {
    func updateTopics(_ topics: [TopicDTO]) {
        self.topics = topics
    }
}

extension SelectionTestDelegate {
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        guard indexPath.row < topics[indexPath.section].questions.count else {
            print("Index out of range")
            return
        }
        let selectedQuestions = topics[indexPath.row].questions
        delegate?.questionsSelected(selectedQuestions, topics[indexPath.row])
    }
}

