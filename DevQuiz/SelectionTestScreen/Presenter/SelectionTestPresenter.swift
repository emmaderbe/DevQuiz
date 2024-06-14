import Foundation

protocol SelectionTestProtocol: AnyObject {
    func displayTopics(topics: [Topic])
    func navigateToView(with questions: [Question])
}

final class SelectionTestPresenter {
    weak var view: SelectionTestProtocol?
    private var selectedLanguage: ProgrammingLanguage?
}

extension SelectionTestPresenter {
    func setSelectedLanguage(_ language: ProgrammingLanguage) {
        self.selectedLanguage = language
    }
    
    func viewDidLoad(view: SelectionTestProtocol) {
        self.view = view
        fetchTopics()
    }
}

extension SelectionTestPresenter {
    func topicSelected(_ questions: [Question]) {
        view?.navigateToView(with: questions)
    }
}

private extension SelectionTestPresenter {
    func fetchTopics() {
        guard let selectedLanguage = selectedLanguage else { return }
        let topics = selectedLanguage.topics
        view?.displayTopics(topics: topics)
    }
}
