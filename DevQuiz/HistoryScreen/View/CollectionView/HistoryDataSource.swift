import UIKit

//MARK: - Property
final class HistoryDataSource: NSObject, UICollectionViewDataSource {
//    private var results: [] = []
}

extension HistoryDataSource {
//    func updateResults(_ result: []) {
//        self.result = result
//    }
}

//MARK: - numberOfItemsInSection
extension HistoryDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
//        return results.count
        return 1
    }
}

//MARK: - cellForItemAt
extension HistoryDataSource {
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: HistoryCollectionViewCell.identifier, for: indexPath) as?  HistoryCollectionViewCell else {return UICollectionViewCell() }
        cell.configure(with: "text")
        cell.setupTitle(language: "Язык:",
                        theme: "Тема:",
                        result: "Результаты:")
        return cell
    }
}
