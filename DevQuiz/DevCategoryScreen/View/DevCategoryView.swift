import UIKit

class DevCategoryView: UIView {
    private let titleLabel = LabelFactory.createTitleLabel()
    
    private lazy var collectionView: UICollectionView = {
        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: createCompositionalLayout())
        collectionView.autoresizingMask = [.flexibleWidth, .flexibleHeight]
        collectionView.register(DevCategoryCollectionViewCell.self, forCellWithReuseIdentifier: DevCategoryCollectionViewCell.identifier)
        collectionView.register(HeaderView.self, forSupplementaryViewOfKind: UICollectionView.elementKindSectionHeader, withReuseIdentifier: HeaderView.identifiear)
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
private extension DevCategoryView {
    func setupView() {
        backgroundColor = UIColor(named: StringEnum.backgroundColor)
        addSubview(titleLabel)
        addSubview(collectionView)
    }
    
    func setupConstraints() {
        NSLayoutConstraint.activate([
            titleLabel.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor, constant: DevEnums.DevView.top),
            titleLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: DevEnums.DevView.leading),
            titleLabel.trailingAnchor.constraint(equalTo: trailingAnchor, constant: DevEnums.DevView.trailing),
            
            collectionView.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: DevEnums.DevView.spacing),
            collectionView.leadingAnchor.constraint(equalTo: leadingAnchor),
            collectionView.trailingAnchor.constraint(equalTo: trailingAnchor),
            collectionView.bottomAnchor.constraint(equalTo:
                    bottomAnchor),
        ])
    }
}

//MARK: - create Layout
private extension DevCategoryView {
    func createCompositionalLayout() -> UICollectionViewLayout {
        let layout = UICollectionViewCompositionalLayout { sectionIndex, layoutEnvironment -> NSCollectionLayoutSection? in
            let itemSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1.0),
                                                  heightDimension: .fractionalHeight(1.0))
            let item = NSCollectionLayoutItem(layoutSize: itemSize)
            item.contentInsets = NSDirectionalEdgeInsets(top: 8, leading: 0, bottom: 8, trailing: 0)

            let groupSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(0.6),
                                                   heightDimension: .fractionalWidth(0.3))
            let group = NSCollectionLayoutGroup.horizontal(layoutSize: groupSize, subitems: [item])
            

            let section = NSCollectionLayoutSection(group: group)
            section.orthogonalScrollingBehavior = .groupPaging
            section.interGroupSpacing = DevEnums.DevView.spacing
            section.contentInsets = NSDirectionalEdgeInsets(top: 0, leading: 16, bottom: 0, trailing: 16)
            
            let headerSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1.0), heightDimension: .fractionalHeight(0.05))
            let sectionHeader = NSCollectionLayoutBoundarySupplementaryItem(
                layoutSize: headerSize,
                elementKind: UICollectionView.elementKindSectionHeader,
                alignment: .topLeading
            )
            section.boundarySupplementaryItems = [sectionHeader]
            
            return section
        }
        
        return layout
    }
}

extension DevCategoryView {
    func configureText(with text: String) {
        titleLabel.text = text
    }
}


//MARK: - set dataSource and delegate
extension DevCategoryView {
    func setDataSource(_ dataSource: DevCategoryCollectionDataSource) {
        collectionView.dataSource = dataSource
    }
    
    func setDelegates(_ delegate: DevCategoryCollectionDelegate) {
        collectionView.delegate = delegate
    }
    
    func reloadData() {
        collectionView.reloadData()
    }
}
