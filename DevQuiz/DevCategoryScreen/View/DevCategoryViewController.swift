import UIKit

class DevCategoryViewController: UIViewController {
    private let mainView = DevCategoryView()
    private let dataSource = DevCategoryCollectionDataSource()
    private let delegate = DevCategoryCollectionDelegate()
    private var presenter: DevCategoryPresenter
    
    init(presenter: DevCategoryPresenter) {
        self.presenter = presenter
        super.init(nibName: nil, bundle: nil)
    }
    
    @available(*, unavailable)
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func loadView() {
        view = mainView
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        presenter.viewDidLoad(view: self)
        setupView()
    }
}

private extension DevCategoryViewController {
    func setupView() {
        setupDataSource()
        setupDelegate()
        setupText()
    }
    
    func setupText() {
        mainView.configureText(with: DevEnums.DevString.mainTitle)
    }
    
    func setupDataSource() {
        mainView.setDataSource(dataSource)
    }
    
    func setupDelegate() {
        delegate.delegate = self
        mainView.setDelegates(delegate)
    }
}

extension DevCategoryViewController: CategorySelectionDelegateProtocol {
    func languageSelected(_ language: LanguageDTO) {
        presenter.languageSelected(language)
    }
}

extension DevCategoryViewController: DevCategoryProtocol {
    func displayCategories() {
        let categories = presenter.categories
        dataSource.updateCategories(categories)
        delegate.updateCategories(categories)
        DispatchQueue.main.async {
            self.mainView.reloadData()
        }
    }
    
    func navigateToView(with language: LanguageDTO) {
        let presenter = SelectionTestPresenter()
        presenter.setSelectedLanguage(language)
        let viewController = SelectionTestViewController(presenter: presenter)
        viewController.title = language.name
        viewController.hidesBottomBarWhenPushed = true
        navigationController?.pushViewController(viewController, animated: true)
    }
}

