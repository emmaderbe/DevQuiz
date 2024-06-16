import UIKit

final class StackFactory {
    static func createVerticalStack(with spacing: CGFloat) -> UIStackView {
       let stack = UIStackView()
        stack.axis = .vertical
        stack.spacing = spacing
        stack.distribution = .equalSpacing
        stack.translatesAutoresizingMaskIntoConstraints = false
        return stack
    }
    
    static func createSmallVerticalStack() -> UIStackView {
       let stack = UIStackView()
        stack.axis = .vertical
        stack.spacing = 1
        stack.alignment = .center
        stack.distribution = .fill
        stack.translatesAutoresizingMaskIntoConstraints = false
        return stack
    }
    
    static func createHorizontalStack(with spacing: CGFloat) -> UIStackView {
       let stack = UIStackView()
        stack.axis = .horizontal
        stack.spacing = spacing
        stack.distribution = .fill
        stack.translatesAutoresizingMaskIntoConstraints = false
        return stack
    }
    
    static func createSmallHorizontalStack() -> UIStackView {
       let stack = UIStackView()
        stack.axis = .horizontal
        stack.spacing = 8
        stack.distribution = .equalSpacing
        stack.translatesAutoresizingMaskIntoConstraints = false
        return stack
    }
}
