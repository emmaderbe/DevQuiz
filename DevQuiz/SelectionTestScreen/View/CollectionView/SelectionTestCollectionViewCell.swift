import UIKit

final class SelectionTestCollectionViewCell: UICollectionViewCell {
    private let customBackgroundView = BackgroundViewFactory.createBackroundView()
    private let testThemeLabel = LabelFactory.createSubTitleLabel()
    private let testCountLabel = LabelFactory.createOrdinaryLabel()
    
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

private extension SelectionTestCollectionViewCell {
    func setupCell() {
        backgroundColor = .clear
        addSubview(customBackgroundView)
        customBackgroundView.addSubview(testThemeLabel)
        customBackgroundView.addSubview(testCountLabel)
    }
    
    func setupConstraints() {
        NSLayoutConstraint.activate([
            customBackgroundView.topAnchor.constraint(equalTo: topAnchor),
            customBackgroundView.leadingAnchor.constraint(equalTo: leadingAnchor),
            customBackgroundView.trailingAnchor.constraint(equalTo: trailingAnchor),
            customBackgroundView.bottomAnchor.constraint(equalTo: bottomAnchor),
            
            testThemeLabel.topAnchor.constraint(equalTo: customBackgroundView.topAnchor, constant: SelectionTestEnums.CellConstr.top),
            testThemeLabel.leadingAnchor.constraint(equalTo: customBackgroundView.leadingAnchor, constant: SelectionTestEnums.CellConstr.leading),
            testThemeLabel.trailingAnchor.constraint(equalTo: customBackgroundView.trailingAnchor, constant: SelectionTestEnums.CellConstr.trailing),
            
            testCountLabel.topAnchor.constraint(equalTo: testThemeLabel.bottomAnchor, constant: SelectionTestEnums.CellConstr.spacing),
            testCountLabel.leadingAnchor.constraint(equalTo: customBackgroundView.leadingAnchor, constant: SelectionTestEnums.CellConstr.leading),
            testCountLabel.trailingAnchor.constraint(equalTo: customBackgroundView.trailingAnchor, constant: SelectionTestEnums.CellConstr.trailing),
        ])
    }
}

//MARK: - configure cell
extension SelectionTestCollectionViewCell {
    func configure(with data: Topic) {
        testThemeLabel.text = data.name
        testCountLabel.text = String(data.questions.count)
    }
}

//MARK: - sidentifier of cell
extension SelectionTestCollectionViewCell {
    static var identifier: String {
        String(describing: SelectionTestCollectionViewCell.self)
    }
}
