import UIKit

enum AppearanceModeEnum: Int {
    case device
    case light
    case dark
    
    func gerUserInterfaceStyle() -> UIUserInterfaceStyle {
        switch self {
        case .device:
                .unspecified
        case .light:
                .light
        case .dark:
                .dark
        }
    }
}
