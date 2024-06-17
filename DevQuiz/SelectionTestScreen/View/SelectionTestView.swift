import UIKit

class SelectionTestView: UIView {
    private lazy var collectionView: UICollectionView = {
        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: createCompositionalLayout())
        collectionView.autoresizingMask = [.flexibleWidth, .flexibleHeight]
        collectionView.register(SelectionTestCollectionViewCell.self, forCellWithReuseIdentifier: SelectionTestCollectionViewCell.identifier)
        collectionView.backgroundColor = .clear
        collectionView.translatesAutoresizingMaskIntoConstraints = false
        return collectionView
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupView()
        setupConstraints()
    }
    
    @available(*, unavailable)
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

//MARK: - setup UI
private extension SelectionTestView {
    func setupView() {
        backgroundColor = UIColor(named: StringEnum.backgroundColor)
        addSubview(collectionView)
    }
    
    func setupConstraints() {
        NSLayoutConstraint.activate([
            collectionView.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor, constant: SelectionTestEnums.SelectionView.top),
            collectionView.leadingAnchor.constraint(equalTo: leadingAnchor),
            collectionView.trailingAnchor.constraint(equalTo: trailingAnchor),
            collectionView.bottomAnchor.constraint(equalTo:
                    bottomAnchor),
        ])
    }
}

//MARK: - create Layout
private extension SelectionTestView {
    func createCompositionalLayout() -> UICollectionViewLayout {
            let layout = UICollectionViewCompositionalLayout { sectionIndex, layoutEnvironment -> NSCollectionLayoutSection? in
                let itemSize = NSCollectionLayoutSize(
                    widthDimension: .fractionalWidth(1.0),
                    heightDimension: .fractionalHeight(1.0)
                )
                let item = NSCollectionLayoutItem(layoutSize: itemSize)
                item.contentInsets = NSDirectionalEdgeInsets(top: 8, leading: 0, bottom: 8, trailing: 0)

                let groupSize = NSCollectionLayoutSize(
                    widthDimension: .fractionalWidth(1.0),
                    heightDimension: .absolute(100)
                )
                let group = NSCollectionLayoutGroup.vertical(layoutSize: groupSize, subitems: [item])

                let section = NSCollectionLayoutSection(group: group)
                section.interGroupSpacing = SelectionTestEnums.SelectionView.spacing
                section.contentInsets = NSDirectionalEdgeInsets(top: 0, leading: 16, bottom: 0, trailing: 16)
                
                return section
            }

            return layout
        }}


//MARK: - set dataSource and delegate
extension SelectionTestView {
    func setDataSource(_ dataSource: SelectionTestDataSource) {
        collectionView.dataSource = dataSource
    }

    func setDelegates(_ delegate: SelectionTestDelegate) {
        collectionView.delegate = delegate
    }
    
    func reloadData() {
        collectionView.reloadData()
    }
}
