import UIKit

protocol CategorySelectionDelegateProtocol: AnyObject {
    func languageSelected(_ language: ProgrammingLanguage)
}

final class DevCategoryCollectionDelegate: NSObject, UICollectionViewDelegate {
    private var categories: [Category] = []
    weak var delegate: CategorySelectionDelegateProtocol?
}

extension DevCategoryCollectionDelegate {
    func updateCategories(_ categories: [Category]) {
        self.categories = categories
    }
}

extension DevCategoryCollectionDelegate {
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        guard indexPath.section < categories.count, indexPath.row < categories[indexPath.section].languages.count else {
            print("Index out of range")
            return
        }
        let selectedLanguage = categories[indexPath.section].languages[indexPath.row]
        delegate?.languageSelected(selectedLanguage)
    }
}
