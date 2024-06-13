import Foundation

protocol SelectionTestProtocol: AnyObject {
    func displayTopics(topics: [Topic])
}

final class SelectionTestPresenter {
    weak var view: SelectionTestProtocol?
    private var selectedLanguage: ProgrammingLanguage?
}

extension SelectionTestPresenter {
    func viewDidLoad(view: SelectionTestProtocol) {
        self.view = view
        fetchTopics()
    }
    
    func setSelectedLanguage(_ language: ProgrammingLanguage) {
        self.selectedLanguage = language
    }
}

private extension SelectionTestPresenter {
    func fetchTopics() {
        guard let selectedLanguage = selectedLanguage else { return }
        let topics = selectedLanguage.topics
        view?.displayTopics(topics: topics)
    }
}
