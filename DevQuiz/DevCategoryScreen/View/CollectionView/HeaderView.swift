import UIKit

class HeaderView: UICollectionReusableView {
    private let categoryLabel = LabelFactory.createSubTitleLabel()

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
            categoryLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 8),
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
