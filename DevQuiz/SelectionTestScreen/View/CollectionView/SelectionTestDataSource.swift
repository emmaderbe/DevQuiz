import UIKit

//MARK: - Property
final class SelectionTestDataSource: NSObject, UICollectionViewDataSource {
    private var topics: [TopicDTO] = []
}

extension SelectionTestDataSource {
    func updateTopics(_ topics: [TopicDTO]) {
        self.topics = topics
    }
}

//MARK: - numberOfItemsInSection
extension SelectionTestDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return topics.count
    }
}

//MARK: - cellForItemAt
extension SelectionTestDataSource {
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: SelectionTestCollectionViewCell.identifier, for: indexPath) as?  SelectionTestCollectionViewCell else {return UICollectionViewCell() }
        let data = topics[indexPath.row]
        cell.configure(with: data)
        return cell
    }
}
