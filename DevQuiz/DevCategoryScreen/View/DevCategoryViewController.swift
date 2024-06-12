import UIKit

class DevCategoryViewController: UIViewController {
    private let mainView = DevCategoryView()
    private let dataSource = DevCategoryCollectionDataSource()
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
        //        setupDelegate()
        setupText()
    }
    
    func setupText() {
        mainView.configureText(with: "Привет! \nЧто хочешь выучить сегодня?")
    }
    
    func setupDataSource() {
        mainView.setDataSource(dataSource)
    }
    
    //    func setupDelegate() {
    //        delegate.delegate = self
    //        mainView.setDelegates(delegate)
    //    }
}

extension DevCategoryViewController: DevCategoryProtocol {
    func displayCategories(categories: [DevCategory]) {
        dataSource.updateCategories(categories)
        DispatchQueue.main.async {
            self.mainView.reloadData()
        }
    }
}
