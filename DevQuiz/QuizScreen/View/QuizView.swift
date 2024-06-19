import UIKit

class QuizView: UIView {
    private let progressLabel = LabelFactory.createOrdinaryLabel()
    private let progressBar: UIProgressView = {
        let progressView = UIProgressView(progressViewStyle: .default)
        progressView.progressTintColor = UIColor(named: StringEnum.accentColor)
        progressView.trackTintColor = .systemGray4
        progressView.translatesAutoresizingMaskIntoConstraints = false
        return progressView
    }()
    
    private let questionLabel = LabelFactory.createBoldOrdinaryLabel(aligment: .center)
    
    private var optionButtons: [UIButton] = []
    
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

private extension QuizView {
    func setupView() {
        backgroundColor = UIColor(named: StringEnum.backgroundColor)
        addSubview(progressLabel)
        addSubview(progressBar)
        addSubview(questionLabel)
    }
    
    func setupConstraints() {
        NSLayoutConstraint.activate([
            progressLabel.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor, constant: QuizEnums.QuizView.top),
            progressLabel.centerXAnchor.constraint(equalTo: centerXAnchor),
            
            progressBar.topAnchor.constraint(equalTo: progressLabel.bottomAnchor, constant: QuizEnums.QuizView.top),
            progressBar.leadingAnchor.constraint(equalTo: leadingAnchor, constant: QuizEnums.QuizView.leading),
            progressBar.trailingAnchor.constraint(equalTo: trailingAnchor, constant: QuizEnums.QuizView.trailing),
            
            questionLabel.topAnchor.constraint(equalTo: progressBar.bottomAnchor, constant: QuizEnums.QuizView.spacing),
            questionLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: QuizEnums.QuizView.leading),
            questionLabel.trailingAnchor.constraint(equalTo: trailingAnchor, constant: QuizEnums.QuizView.trailing),
            questionLabel.heightAnchor.constraint(greaterThanOrEqualToConstant: QuizEnums.QuizView.labelHeight)
        ])
    }
}

private extension QuizView {
    func createOptionButton(title: String, tag: Int, target: Any, action: Selector) -> UIButton {
        let button = UIButton(type: .system)
        button.tag = tag
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setTitle(title, for: .normal)
        button.addTarget(target, action: action, for: .touchUpInside)
        button.layer.cornerRadius = QuizEnums.QuizView.cornerRadius
        button.backgroundColor = UIColor(named: StringEnum.customBackgroundColor)
        button.titleLabel?.numberOfLines = 0
        button.contentEdgeInsets = UIEdgeInsets(top: 8, left: 16, bottom: 8, right: 16)
        button.titleLabel?.textAlignment = .center
        button.setTitleColor(UIColor(named: StringEnum.textColor), for: .normal)
        return button
    }
    
    func addButtonsToView(_ buttons: [UIButton]) {
        optionButtons.forEach { $0.removeFromSuperview() }
        optionButtons = buttons
        optionButtons.forEach { addSubview($0) }
    }
    
    func setButtonConstraints() {
        var previousButton: UIButton?
        for button in optionButtons {
            NSLayoutConstraint.activate([
                button.leadingAnchor.constraint(equalTo: leadingAnchor, constant: QuizEnums.QuizView.leading),
                button.trailingAnchor.constraint(equalTo: trailingAnchor, constant: QuizEnums.QuizView.trailing),
                button.heightAnchor.constraint(equalToConstant: button.intrinsicContentSize.height + 16),
                
            ])
            
            if let previousButton = previousButton {
                button.topAnchor.constraint(equalTo: previousButton.bottomAnchor, constant: QuizEnums.QuizView.top).isActive = true
            } else {
                button.topAnchor.constraint(equalTo: questionLabel.bottomAnchor, constant: QuizEnums.QuizView.spacing).isActive = true
            }
            previousButton = button
        }
    }
}

extension QuizView {
    func updateProgress(current: Int, total: Int) {
        progressLabel.text = "\(current)/\(total)"
        progressBar.progress = Float(current) / Float(total)
    }
    
    func updateQuestion(_ question: String) {
        questionLabel.text = question
    }
}

extension QuizView {
    func updateOptions(_ options: [String], target: Any, action: Selector) {
        let buttons = options.enumerated().map { createOptionButton(title: $1, tag: $0, target: target, action: action) }
        addButtonsToView(buttons)
        setButtonConstraints()
    }
    
    func highlightButton(at index: Int, isCorrect: Bool) {
        guard index < optionButtons.count else { return }
        let button = optionButtons[index]
        button.backgroundColor = isCorrect ? .systemGreen : .systemRed
    }
    
    func resetButtonColors() {
        optionButtons.forEach { $0.backgroundColor = .systemGray5 }
    }
}
