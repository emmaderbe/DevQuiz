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
        let historyPresenter = HistoryPresenter()
        let settingsPresenter = SettingsPresenter()
        viewControllers = [
        generateVC(viewController: DevCategoryViewController(presenter: devPresenter), image: "flag.2.crossed.fill"),
        generateVC(viewController: HistoryViewController(presenter: historyPresenter), image: "clock.fill"),
        generateVC(viewController: SettingsViewController(presenter: settingsPresenter), image: "gearshape.fill")
        ]
    }
}

private extension TabBarController {
    func generateVC(viewController: UIViewController, image: String) -> UINavigationController {
        
        viewController.tabBarItem.image = UIImage(systemName: image)
        
        let navigationViewController = UINavigationController(rootViewController: viewController)
        navigationViewController.navigationBar.tintColor = UIColor(named: StringEnum.accentColor)
        navigationViewController.navigationBar.topItem?.title = ""
        return navigationViewController
    }
}

private extension TabBarController {
    private func setTabBarAppearance() {
        tabBar.backgroundColor = .clear
        tabBar.tintColor = UIColor(named: StringEnum.accentColor) 
        tabBar.unselectedItemTintColor = .systemGray

        tabBar.itemPositioning = .centered
        tabBar.barStyle = .default
    }
}


