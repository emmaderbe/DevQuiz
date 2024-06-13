import UIKit

class SelectionTestViewController: UIViewController {
    private let selectionTestView = SelectionTestView()
    private let dataSource = SelectionTestDataSource()
    private var presenter: SelectionTestPresenter
    
    init(presenter: SelectionTestPresenter) {
        self.presenter = presenter
        super.init(nibName: nil, bundle: nil)
    }
    
    @available(*, unavailable)
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func loadView() {
        view = selectionTestView
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        presenter.viewDidLoad(view: self)
        setupView()
    }
}

private extension SelectionTestViewController {
    func setupView() {
        setupDataSource()
        //        setupDelegate()
    }
    
    func setupDataSource() {
        selectionTestView.setDataSource(dataSource)
    }
    
    //    func setupDelegate() {
    //        delegate.delegate = self
    //        mainView.setDelegates(delegate)
    //    }
}

extension SelectionTestViewController: SelectionTestProtocol {
    func displayTopicks(topic: [Topic]) {
        dataSource.updateTopics(topic)
        DispatchQueue.main.async {
            self.selectionTestView.reloadData()
        }
    }
}
