import UIKit

final class DevCategoryCollectionViewCell: UICollectionViewCell {
    private let customBackgroundView = BackgroundViewFactory.createBackroundView()
    private let devNameLabel = LabelFactory.createBoldOrdinaryLabel(aligment: .left)
    private let descriptionLabel = LabelFactory.createOrdinaryLabel()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupCell()
        setupConstraints()
    }
    
    @available(*, unavailable)
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

private extension DevCategoryCollectionViewCell {
    func setupCell() {
        backgroundColor = .clear
        addSubview(customBackgroundView)
        customBackgroundView.addSubview(devNameLabel)
        customBackgroundView.addSubview(descriptionLabel)
    }
    
    func setupConstraints() {
        NSLayoutConstraint.activate([
            customBackgroundView.topAnchor.constraint(equalTo: topAnchor),
            customBackgroundView.leadingAnchor.constraint(equalTo: leadingAnchor),
            customBackgroundView.trailingAnchor.constraint(equalTo: trailingAnchor),
            customBackgroundView.bottomAnchor.constraint(equalTo: bottomAnchor),
            
            devNameLabel.topAnchor.constraint(equalTo: customBackgroundView.topAnchor, constant: DevEnums.CellConstr.top),
            devNameLabel.leadingAnchor.constraint(equalTo: customBackgroundView.leadingAnchor, constant: DevEnums.CellConstr.leading),
            devNameLabel.trailingAnchor.constraint(equalTo: customBackgroundView.trailingAnchor, constant: DevEnums.CellConstr.trailing),
            
            descriptionLabel.topAnchor.constraint(equalTo: devNameLabel.bottomAnchor, constant: DevEnums.CellConstr.spacing),
            descriptionLabel.leadingAnchor.constraint(equalTo: customBackgroundView.leadingAnchor, constant: DevEnums.CellConstr.leading),
            descriptionLabel.trailingAnchor.constraint(equalTo: customBackgroundView.trailingAnchor, constant: DevEnums.CellConstr.trailing),
        ])
    }
}

//MARK: - configure cell
extension DevCategoryCollectionViewCell {
    func configure(with data: ProgrammingLanguage) {
        devNameLabel.text = data.name
        descriptionLabel.text = data.description
    }
}

//MARK: - sidentifier of cell
extension DevCategoryCollectionViewCell {
    static var identifier: String {
        String(describing: DevCategoryCollectionViewCell.self)
    }
}
