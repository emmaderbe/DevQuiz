import UIKit

class SettingsView: UIView {
    private let titleLabel = LabelFactory.createTitleLabel()
    
    private let segmentedControl: UISegmentedControl = {
        let segmentedControl = UISegmentedControl(items: [SettingsEnum.StringEnum.deviceSegmentedControl, SettingsEnum.StringEnum.lightSegmentedControl, SettingsEnum.StringEnum.darkSegmentedControl])
        segmentedControl.backgroundColor = .systemGray4
        segmentedControl.selectedSegmentTintColor = UIColor(named: StringEnum.accentColor)
        segmentedControl.selectedSegmentIndex = 0
        segmentedControl.tintColor = UIColor(named: StringEnum.textColor)
        segmentedControl.addTarget(self, action: #selector(segmentedChanged), for: .valueChanged)
        segmentedControl.translatesAutoresizingMaskIntoConstraints = false
        return segmentedControl
    }()
    
    var onSegmentedControlTapped: ((Int) -> Void)?
    
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

private extension SettingsView {
    func setupView() {
        backgroundColor = UIColor(named: StringEnum.backgroundColor)
        
        addSubview(titleLabel)
        addSubview(segmentedControl)
        
        segmentedControl.selectedSegmentIndex = AppearanceUserDefaults.shared.appearance.rawValue
    }
    
    func setupConstraints() {
        NSLayoutConstraint.activate([
            
            titleLabel.bottomAnchor.constraint(equalTo: segmentedControl.topAnchor, constant: SettingsEnum.SettingsView.spacing),
            titleLabel.centerXAnchor.constraint(equalTo: centerXAnchor),
            
            segmentedControl.centerXAnchor.constraint(equalTo: centerXAnchor),
            segmentedControl.centerYAnchor.constraint(equalTo: centerYAnchor),
        ])
    }
}

private extension SettingsView {
    @objc func segmentedChanged() {
        onSegmentedControlTapped?(segmentedControl.selectedSegmentIndex)
    }
}

extension SettingsView {
    func setupTitle(with title: String) {
        titleLabel.text = title
    }
    
    func updateAppearanceMode(_ mode: AppearanceModeEnum) {
        segmentedControl.selectedSegmentIndex = mode.rawValue
    }
}
