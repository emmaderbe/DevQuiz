import Foundation

protocol SettingsPresenterProtocol: AnyObject {
    func updateAppearanceMode(_ mode: AppearanceModeEnum)
}

final class SettingsPresenter {
    weak var view: SettingsPresenterProtocol?
}

extension SettingsPresenter {
    func viewDidLoad(view: SettingsPresenterProtocol) {
        self.view = view
    }
    
    func updateAppearanceMode(_ mode: AppearanceModeEnum) {
        AppearanceUserDefaults.shared.appearance = mode
        view?.updateAppearanceMode(mode)
    }
}
