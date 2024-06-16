import UIKit

final class HistoryCollectionViewCell: UICollectionViewCell {
    private let customBackgroundView = BackgroundViewFactory.createBackroundView()
    
    private let languageTitleLabel = LabelFactory.createBoldSmallOrdinaryLabel(aligment: .left)
    private let languageLabel = LabelFactory.createSmallOrdinaryLabel()
    
    private let themeTitleLabel = LabelFactory.createBoldSmallOrdinaryLabel(aligment: .left)
    private let themeLabel = LabelFactory.createSmallOrdinaryLabel()
    
    private let resultTitleLabel = LabelFactory.createBoldSmallOrdinaryLabel(aligment: .left)
    private let resultLabel = LabelFactory.createSmallOrdinaryLabel()
    
    private let languageVerticStack = StackFactory.createSmallVerticalStack()
    private let themeVerticStack = StackFactory.createSmallVerticalStack()
    private let resultVerticStack = StackFactory.createSmallVerticalStack()
    
    private let horizStack = StackFactory.createSmallHorizontalStack()
    
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

private extension HistoryCollectionViewCell {
    func setupCell() {
        backgroundColor = .clear
        addSubview(customBackgroundView)
        
        customBackgroundView.addSubview(horizStack)
        
        horizStack.addArrangedSubview(languageVerticStack)
        horizStack.addArrangedSubview(themeVerticStack)
        horizStack.addArrangedSubview(resultVerticStack)
        
        languageVerticStack.addArrangedSubview(languageTitleLabel)
        languageVerticStack.addArrangedSubview(languageLabel)
        
        themeVerticStack.addArrangedSubview(themeTitleLabel)
        themeVerticStack.addArrangedSubview(themeLabel)
        
        resultVerticStack.addArrangedSubview(resultTitleLabel)
        resultVerticStack.addArrangedSubview(resultLabel)
    }
    
    func setupConstraints() {
        NSLayoutConstraint.activate([
            customBackgroundView.topAnchor.constraint(equalTo: topAnchor),
            customBackgroundView.leadingAnchor.constraint(equalTo: leadingAnchor),
            customBackgroundView.trailingAnchor.constraint(equalTo: trailingAnchor),
            customBackgroundView.bottomAnchor.constraint(equalTo: bottomAnchor),
            
            horizStack.topAnchor.constraint(equalTo: customBackgroundView.topAnchor, constant: 16),
            horizStack.leadingAnchor.constraint(equalTo: customBackgroundView.leadingAnchor, constant: 16),
            horizStack.trailingAnchor.constraint(equalTo: customBackgroundView.trailingAnchor, constant: -16),
            horizStack.bottomAnchor.constraint(equalTo: customBackgroundView.bottomAnchor, constant: -16),
        ])
    }
}

//MARK: - configure cell
extension HistoryCollectionViewCell {
    func setupTitle(language: String, theme: String, result: String) {
        languageTitleLabel.text = language
        themeTitleLabel.text = theme
        resultTitleLabel.text = result
    }
    
    func configure(with data: String) {
        languageLabel.text = data
        themeLabel.text = data
        resultLabel.text = data
    }
}

//MARK: - sidentifier of cell
extension HistoryCollectionViewCell {
    static var identifier: String {
        String(describing: HistoryCollectionViewCell.self)
    }
}

