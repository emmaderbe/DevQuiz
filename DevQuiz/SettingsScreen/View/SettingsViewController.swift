import UIKit

final class SettingsViewController: UIViewController {
    private let settingsView = SettingsView()
    private let presenter: SettingsPresenter
    
    init(presenter: SettingsPresenter) {
        self.presenter = presenter
        super.init(nibName: nil, bundle: nil)
    }
    
    @available(*, unavailable)
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func loadView() {
        view = settingsView
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        presenter.viewDidLoad(view: self)
        setupView()
    }
}

private extension SettingsViewController {
    func setupView() {
        setupTitle()
        setupSegmentControlAction()
    }
    
    func setupTitle() {
        settingsView.setupTitle(with: "Выбери свою сторону:")
    }
    
    func setupSegmentControlAction() {
        settingsView.onSegmentedControlTapped = { [weak self] selectedIndex in
            guard let mode = AppearanceModeEnum(rawValue: selectedIndex) else { return }
            self?.presenter.updateAppearanceMode(mode)
        }
    }
}

extension SettingsViewController: SettingsPresenterProtocol {
    func updateAppearanceMode(_ mode: AppearanceModeEnum) {
        settingsView.updateAppearanceMode(mode)
        view.window?.overrideUserInterfaceStyle = mode.gerUserInterfaceStyle()
    }
}
