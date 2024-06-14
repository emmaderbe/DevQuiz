import UIKit

class QuizView: UIView {
    private let progressLabel = LabelFactory.createOrdinaryLabel()
    
    private let progressBar: UIProgressView = {
        let progressView = UIProgressView(progressViewStyle: .default)
        progressView.translatesAutoresizingMaskIntoConstraints = false
        return progressView
    }()
    
    private let questionLabel = LabelFactory.createSubTitleLabel(aligment: .center)
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
    
    private func setupView() {
        backgroundColor = .white
        addSubview(progressLabel)
        addSubview(progressBar)
        addSubview(questionLabel)
    }
    
    private func setupConstraints() {
        NSLayoutConstraint.activate([
            progressLabel.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor, constant: 16),
            progressLabel.centerXAnchor.constraint(equalTo: centerXAnchor),
            
            progressBar.topAnchor.constraint(equalTo: progressLabel.bottomAnchor, constant: 16),
            progressBar.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 16),
            progressBar.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -16),
            
            questionLabel.topAnchor.constraint(equalTo: progressBar.bottomAnchor, constant: 32),
            questionLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 16),
            questionLabel.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -16),
            questionLabel.heightAnchor.constraint(greaterThanOrEqualToConstant: 80)
        ])
    }
    
    func updateProgress(current: Int, total: Int) {
        progressLabel.text = "\(current)/\(total)"
        progressBar.progress = Float(current) / Float(total)
    }
    
    func updateQuestion(_ question: String) {
        questionLabel.text = question
    }
    
    func updateOptions(_ options: [String], target: Any, action: Selector) {
        optionButtons.forEach { $0.removeFromSuperview() }
        optionButtons = options.map { option in
            let button = UIButton(type: .system)
            button.translatesAutoresizingMaskIntoConstraints = false
            button.setTitle(option, for: .normal)
            button.addTarget(target, action: action, for: .touchUpInside)
            button.layer.cornerRadius = 8
            button.backgroundColor = .systemGray5
            button.setTitleColor(.black, for: .normal)
            return button
        }
        
        var previousButton: UIButton?
        for button in optionButtons {
            addSubview(button)
            NSLayoutConstraint.activate([
                button.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 16),
                button.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -16),
                button.heightAnchor.constraint(equalToConstant: 44)
            ])
            
            if let previousButton = previousButton {
                button.topAnchor.constraint(equalTo: previousButton.bottomAnchor, constant: 16).isActive = true
            } else {
                button.topAnchor.constraint(equalTo: questionLabel.bottomAnchor, constant: 40).isActive = true
            }
            previousButton = button
        }
    }
}
