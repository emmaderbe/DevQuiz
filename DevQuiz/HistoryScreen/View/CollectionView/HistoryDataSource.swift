import UIKit

//MARK: - Property
final class HistoryDataSource: NSObject, UICollectionViewDataSource {
    private var results: [QuizResult] = []
}

extension HistoryDataSource {
    func updateResults(_ results: [QuizResult]) {
            self.results = results
        }
}

//MARK: - numberOfItemsInSection
extension HistoryDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return results.count
    }
}

//MARK: - cellForItemAt
extension HistoryDataSource {
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: HistoryCollectionViewCell.identifier, for: indexPath) as?  HistoryCollectionViewCell else {return UICollectionViewCell() }
        let result = results[indexPath.row]
        cell.setupTitle(language: HistoryEnum.StringEnum.titleLanguage,
                        theme: HistoryEnum.StringEnum.titleTopic,
                        result: HistoryEnum.StringEnum.titleResult,
                        date: HistoryEnum.StringEnum.titleDate)
        cell.configure(with: result)
        return cell
    }
}
