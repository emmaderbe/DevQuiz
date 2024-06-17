import UIKit

class ResultView: UIView {
    private let titleImage = ImageFactory.createLargeIconImage()
    private let titleLabel = LabelFactory.createTitleLabel()
    private let subtitleLabel = LabelFactory.createSubTitleLabel()
    
    private let customBackgroundView = BackgroundViewFactory.createBackroundView()
    
    private let resultImage = ImageFactory.createMediumIconImage()
    private let resultTitleLabel = LabelFactory.createBoldOrdinaryLabel(aligment: .left)
    private let resultLabel = LabelFactory.createOrdinaryLabel()
    
    private let categoryImage = ImageFactory.createMediumIconImage()
    private let categoryTitleLabel = LabelFactory.createBoldOrdinaryLabel(aligment: .left)
    private let categoryLabel = LabelFactory.createOrdinaryLabel()
    
    private let technologyImage = ImageFactory.createMediumIconImage()
    private let technologyTitleLabel = LabelFactory.createBoldOrdinaryLabel(aligment: .left)
    private let technologyLabel = LabelFactory.createOrdinaryLabel()
    
    private let resultVerticStack = StackFactory.createSmallVerticalStack()
    private let categoryVerticStack = StackFactory.createSmallVerticalStack()
    private let technologyVerticStack = StackFactory.createSmallVerticalStack()
    
    private let firstHorizStack = StackFactory.createHorizontalStack(with: ResultEnum.ResultView.spacing)
    private let secondHorizStack = StackFactory.createHorizontalStack(with: ResultEnum.ResultView.spacing)
    private let thirdHorizStack = StackFactory.createHorizontalStack(with: ResultEnum.ResultView.spacing)
    private let verticStack = StackFactory.createVerticalStack(with: ResultEnum.ResultView.spacing)
    
    private let endQuizButton: UIButton = {
        let button = UIButton(type: .system)
        button.setTitle("Закончить", for: .normal)
        button.backgroundColor = UIColor(named: StringEnum.accentColor)
        button.setTitleColor(.white, for: .normal)
        button.layer.cornerRadius = ResultEnum.ResultView.cornerRadius
        button.addTarget(self, action: #selector(endQuizButtonTapped), for: .touchUpInside)
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    var onEndQuizButtonTapped: (() -> Void)?
    
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

private extension ResultView {
    func setupView() {
        backgroundColor = UIColor(named: StringEnum.backgroundColor)
        
        addSubview(titleImage)
        addSubview(titleLabel)
        addSubview(subtitleLabel)
        addSubview(customBackgroundView)
        addSubview(endQuizButton)
        
        customBackgroundView.addSubview(verticStack)
        
        verticStack.addArrangedSubview(firstHorizStack)
        verticStack.addArrangedSubview(secondHorizStack)
        verticStack.addArrangedSubview(thirdHorizStack)
        
        firstHorizStack.addArrangedSubview(resultImage)
        firstHorizStack.addArrangedSubview(resultVerticStack)
        
        resultVerticStack.addArrangedSubview(resultTitleLabel)
        resultVerticStack.addArrangedSubview(resultLabel)
        
        secondHorizStack.addArrangedSubview(categoryImage)
        secondHorizStack.addArrangedSubview(categoryVerticStack)
        
        categoryVerticStack.addArrangedSubview(categoryTitleLabel)
        categoryVerticStack.addArrangedSubview(categoryLabel)
        
        thirdHorizStack.addArrangedSubview(technologyImage)
        thirdHorizStack.addArrangedSubview(technologyVerticStack)
        
        technologyVerticStack.addArrangedSubview(technologyTitleLabel)
        technologyVerticStack.addArrangedSubview(technologyLabel)
    }
    
    func setupConstraints() {
        NSLayoutConstraint.activate([
            titleImage.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor, constant: ResultEnum.ResultView.top),
            titleImage.leadingAnchor.constraint(equalTo: leadingAnchor, constant: ResultEnum.ResultView.leading),
            
            titleLabel.topAnchor.constraint(equalTo: titleImage.bottomAnchor, constant: ResultEnum.ResultView.spacing),
            titleLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: ResultEnum.ResultView.leading),
            titleLabel.trailingAnchor.constraint(equalTo: trailingAnchor, constant: ResultEnum.ResultView.trailing),
            
            subtitleLabel.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: ResultEnum.ResultView.spacing),
            subtitleLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: ResultEnum.ResultView.leading),
            subtitleLabel.trailingAnchor.constraint(equalTo: trailingAnchor, constant: ResultEnum.ResultView.trailing),
            
            customBackgroundView.topAnchor.constraint(equalTo: subtitleLabel.bottomAnchor, constant: ResultEnum.ResultView.mediumSpacing),
            customBackgroundView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: ResultEnum.ResultView.leading),
            customBackgroundView.trailingAnchor.constraint(equalTo: trailingAnchor, constant: ResultEnum.ResultView.trailing),
            customBackgroundView.heightAnchor.constraint(equalTo: heightAnchor, multiplier: ResultEnum.ResultView.backgroundHeight),
            
            verticStack.topAnchor.constraint(equalTo: customBackgroundView.topAnchor, constant: ResultEnum.ResultView.spacing),
            verticStack.leadingAnchor.constraint(equalTo: customBackgroundView.leadingAnchor, constant: ResultEnum.ResultView.leading),
            verticStack.trailingAnchor.constraint(equalTo: customBackgroundView.trailingAnchor, constant: ResultEnum.ResultView.trailing),
            verticStack.bottomAnchor.constraint(equalTo: customBackgroundView.bottomAnchor, constant: ResultEnum.ResultView.bottom),
            
            endQuizButton.topAnchor.constraint(equalTo: customBackgroundView.bottomAnchor, constant: ResultEnum.ResultView.largeSpacing),
            endQuizButton.leadingAnchor.constraint(equalTo: leadingAnchor, constant: ResultEnum.ResultView.leading),
            endQuizButton.trailingAnchor.constraint(equalTo: trailingAnchor, constant: ResultEnum.ResultView.trailing),
            endQuizButton.heightAnchor.constraint(equalTo: heightAnchor, multiplier: ResultEnum.ResultView.buttonHeight),
        ])
    }
}

private extension ResultView {
    @objc func endQuizButtonTapped() {
        onEndQuizButtonTapped?()
    }
}

extension ResultView {
    func setupTitle(with icon: String, and title: String, and subtitle: String) {
        titleImage.image = UIImage(systemName: icon)
        titleLabel.text = title
        subtitleLabel.text = subtitle
    }
}

extension ResultView {
    func setupResultTitle(result: String, category: String, technology: String) {
        resultTitleLabel.text =  result
        categoryTitleLabel.text = category
        technologyTitleLabel.text = technology
    }
    
    func setupResultImage(result: String, category: String, technology: String) {
        resultImage.image = UIImage(systemName: result)
        categoryImage.image = UIImage(systemName: category)
        technologyImage.image = UIImage(systemName: technology)
    }
}

extension ResultView {
    func setupResultText(result: String, category: String, technology: String) {
        resultLabel.text = result
        categoryLabel.text = category
        technologyLabel.text = technology
    }
}
