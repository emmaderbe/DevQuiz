import UIKit

//MARK: - Property
final class DevCategoryCollectionDataSource: NSObject, UICollectionViewDataSource {
    private var categories: [DevCategory] = []
}

extension DevCategoryCollectionDataSource {
    func updateCategories(_ categories: [DevCategory]) {
        self.categories = categories
    }
}

//MARK: - numberOfItemsInSection
extension DevCategoryCollectionDataSource {
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return categories.count
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return categories[section].items.count
    }
}

//MARK: - cellForItemAt
extension DevCategoryCollectionDataSource {
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: DevCategoryCollectionViewCell.identifier, for: indexPath) as?  DevCategoryCollectionViewCell else {return UICollectionViewCell() }
        let data = categories[indexPath.section].items[indexPath.row]
        cell.configure(with: data)
        return cell
    }
}

extension DevCategoryCollectionDataSource {
    func collectionView(_ collectionView: UICollectionView, viewForSupplementaryElementOfKind kind: String, at indexPath: IndexPath) -> UICollectionReusableView {
            if kind == UICollectionView.elementKindSectionHeader {
                let header = collectionView.dequeueReusableSupplementaryView(ofKind: kind, withReuseIdentifier: HeaderView.identifiear, for: indexPath) as! HeaderView
                let category = categories[indexPath.section]
                header.configure(with: category.title)
                return header
            }
            return UICollectionReusableView()
        }
}
