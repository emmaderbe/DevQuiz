import UIKit

final class BackgroundViewFactory {
    static func createBackroundView() -> UIView {
        let view = UIView()
        view.backgroundColor = UIColor(named: StringEnum.customBackgroundColor)
        view.layer.cornerRadius = 16
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }
}
