import UIKit
import SafariServices

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
        setupPrivacyPolicyButtonAction()
    }
    
    func setupTitle() {
        settingsView.setupTitle(with: SettingsEnum.StringEnum.title)
    }
    
    func setupSegmentControlAction() {
        settingsView.onSegmentedControlTapped = { [weak self] selectedIndex in
            guard let mode = AppearanceModeEnum(rawValue: selectedIndex) else { return }
            self?.presenter.updateAppearanceMode(mode)
        }
    }
    
    func setupPrivacyPolicyButtonAction() {
        settingsView.onPrivacyPolicyButtonTapped = { [weak self] in
            self?.openPrivacyPolicy()
        }
    }
    
    func openPrivacyPolicy() {
        guard let url = URL(string: "https://petdiet.tilda.ws/devquiz") else { return }
        let safariVC = SFSafariViewController(url: url)
        present(safariVC, animated: true, completion: nil)
    }

}

extension SettingsViewController: SettingsPresenterProtocol {
    func updateAppearanceMode(_ mode: AppearanceModeEnum) {
        settingsView.updateAppearanceMode(mode)
        view.window?.overrideUserInterfaceStyle = mode.gerUserInterfaceStyle()
    }
}
