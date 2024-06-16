import UIKit

class HeaderView: UICollectionReusableView {
    private let categoryLabel = LabelFactory.createBoldOrdinaryLabel(aligment: .left)

    override init(frame: CGRect) {
        super.init(frame: frame)
        setupView()
        setupConstrains()
    }

    @available(*, unavailable)
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

private extension HeaderView {
    func setupView() {
        backgroundColor = .clear
        addSubview(categoryLabel)
    }
    
    func setupConstrains() {
        NSLayoutConstraint.activate([
            categoryLabel.centerYAnchor.constraint(equalTo: centerYAnchor),
            categoryLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: DevEnums.HeaderConstr.leading),
        ])
    }
}

extension HeaderView {
    func configure(with title: String) {
        categoryLabel.text = title
    }
    
    static var identifiear: String {
        String(describing: HeaderView.self)
    }
}
