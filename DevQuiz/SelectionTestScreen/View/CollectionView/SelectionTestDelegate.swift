import UIKit

protocol SelectionTestDelegateProtocol: AnyObject {
    func questionsSelected(_ questions: [Question])
}

final class SelectionTestDelegate: NSObject, UICollectionViewDelegate {
    private var topics: [Topic] = []
    weak var delegate: SelectionTestDelegateProtocol?
}

extension SelectionTestDelegate {
    func updateTopics(_ topics: [Topic]) {
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
        delegate?.questionsSelected(selectedQuestions)
    }
}

