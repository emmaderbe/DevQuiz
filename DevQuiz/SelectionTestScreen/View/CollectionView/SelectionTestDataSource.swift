import UIKit

//MARK: - Property
final class SelectionTestDataSource: NSObject, UICollectionViewDataSource {
    private var topics: [Topic] = []
}

extension SelectionTestDataSource {
    func updateTopics(_ topics: [Topic]) {
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
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: DevCategoryCollectionViewCell.identifier, for: indexPath) as?  DevCategoryCollectionViewCell else {return UICollectionViewCell() }
        let data = topics[indexPath.row]
        cell.configure(with: data)
        return cell
    }
}
