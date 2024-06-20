import UIKit

final class HistoryCollectionViewCell: UICollectionViewCell {
    private let customBackgroundView = BackgroundViewFactory.createBackroundView()
    
    private let languageTitleLabel = LabelFactory.createBoldSmallOrdinaryLabel(aligment: .left)
    private let languageLabel = LabelFactory.createSmallOrdinaryLabel()
    
    private let themeTitleLabel = LabelFactory.createBoldSmallOrdinaryLabel(aligment: .left)
    private let themeLabel = LabelFactory.createSmallOrdinaryLabel()
    
    private let resultTitleLabel = LabelFactory.createBoldSmallOrdinaryLabel(aligment: .left)
    private let resultLabel = LabelFactory.createSmallOrdinaryLabel()
    
    private let dateTitleLabel = LabelFactory.createBoldSmallOrdinaryLabel(aligment: .left)
    private let dateLabel = LabelFactory.createSmallOrdinaryLabel()
    
    private let languageVerticStack = StackFactory.createSmallVerticalStack()
    private let themeVerticStack = StackFactory.createSmallVerticalStack()
    private let resultVerticStack = StackFactory.createSmallVerticalStack()
    private let dateVerticStack = StackFactory.createSmallVerticalStack()
    
    private let firstVerticalStack = StackFactory.createVerticalStack(with: 4)
    private let secondVerticalStack = StackFactory.createVerticalStack(with: 4)
    
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
        
        horizStack.addArrangedSubview(firstVerticalStack)
        horizStack.addArrangedSubview(secondVerticalStack)

        firstVerticalStack.addArrangedSubview(languageVerticStack)
        firstVerticalStack.addArrangedSubview(themeVerticStack)
        secondVerticalStack.addArrangedSubview(resultVerticStack)
        secondVerticalStack.addArrangedSubview(dateVerticStack)
        
        languageVerticStack.addArrangedSubview(languageTitleLabel)
        languageVerticStack.addArrangedSubview(languageLabel)
        
        themeVerticStack.addArrangedSubview(themeTitleLabel)
        themeVerticStack.addArrangedSubview(themeLabel)
        
        resultVerticStack.addArrangedSubview(resultTitleLabel)
        resultVerticStack.addArrangedSubview(resultLabel)
        
        dateVerticStack.addArrangedSubview(dateTitleLabel)
        dateVerticStack.addArrangedSubview(dateLabel)
    }
    
    func setupConstraints() {
        NSLayoutConstraint.activate([
            customBackgroundView.topAnchor.constraint(equalTo: topAnchor),
            customBackgroundView.leadingAnchor.constraint(equalTo: leadingAnchor),
            customBackgroundView.trailingAnchor.constraint(equalTo: trailingAnchor),
            customBackgroundView.bottomAnchor.constraint(equalTo: bottomAnchor),
            
            horizStack.topAnchor.constraint(equalTo: customBackgroundView.topAnchor, constant: HistoryEnum.HistoryCell.top),
            horizStack.leadingAnchor.constraint(equalTo: customBackgroundView.leadingAnchor, constant: HistoryEnum.HistoryCell.leading),
            horizStack.trailingAnchor.constraint(equalTo: customBackgroundView.trailingAnchor, constant: HistoryEnum.HistoryCell.trailing),
            horizStack.bottomAnchor.constraint(equalTo: customBackgroundView.bottomAnchor, constant: HistoryEnum.HistoryCell.bottom),
        ])
    }
}

//MARK: - configure cell
extension HistoryCollectionViewCell {
    func setupTitle(language: String, theme: String, result: String, date: String) {
        languageTitleLabel.text = language
        themeTitleLabel.text = theme
        resultTitleLabel.text = result
        dateTitleLabel.text = date
    }
    
    func configure(with data: QuizResult) {
        languageLabel.text = data.language
        themeLabel.text = data.topic
        resultLabel.text = data.resultText
        dateLabel.text = data.formattedDate
    }
}

//MARK: - sidentifier of cell
extension HistoryCollectionViewCell {
    static var identifier: String {
        String(describing: HistoryCollectionViewCell.self)
    }
}

