import UIKit

final class TabBarController: UITabBarController {
    override func viewDidLoad() {
        super.viewDidLoad()
        generateTabBar()
        setTabBarAppearance()
    }
}

private extension TabBarController {
    func generateTabBar() {
        let devPresenter = DevCategoryPresenter()
        viewControllers = [
        generateVC(viewController: DevCategoryViewController(presenter: devPresenter), image: "flag.2.crossed.fill"),
        ]
    }
}

private extension TabBarController {
    func generateVC(viewController: UIViewController, image: String) -> UINavigationController {
        
        viewController.tabBarItem.image = UIImage(systemName: image)
        
        let navigationViewController = UINavigationController(rootViewController: viewController)
        navigationViewController.navigationBar.tintColor = .systemBlue
        return navigationViewController
    }
}

private extension TabBarController {
    private func setTabBarAppearance() {
        tabBar.backgroundColor = .clear
        tabBar.tintColor = .systemBlue
        tabBar.unselectedItemTintColor = .systemGray

        tabBar.itemPositioning = .centered
        tabBar.barStyle = .default
    }
}


