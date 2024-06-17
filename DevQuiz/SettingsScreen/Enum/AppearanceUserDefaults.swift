import Foundation

struct AppearanceUserDefaults {
    static var shared = AppearanceUserDefaults()
    
    var appearance: AppearanceModeEnum {
        get {
            AppearanceModeEnum(rawValue: UserDefaults.standard.integer(forKey: StringEnum.userDefaultsKey)) ?? .device
        }
        set {
            UserDefaults.standard.set(newValue.rawValue, forKey: StringEnum.userDefaultsKey)
        }
    }
}
