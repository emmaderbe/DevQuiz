import UIKit

final class StackFactory {
    static func createVerticalStack(with spacing: CGFloat) -> UIStackView {
       let stack = UIStackView()
        stack.axis = .vertical
        stack.spacing = spacing
        stack.distribution = .fillProportionally
        stack.translatesAutoresizingMaskIntoConstraints = false
        return stack
    }
}
