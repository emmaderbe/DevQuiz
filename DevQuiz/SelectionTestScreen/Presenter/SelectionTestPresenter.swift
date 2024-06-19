import Foundation

protocol SelectionTestProtocol: AnyObject {
    func displayTopics(topics: [QuizTopic])
    func navigateToView(with questions: [QuizQuestion])
}

final class SelectionTestPresenter {
    weak var view: SelectionTestProtocol?
    private let topicDataManager: TopicDataManagerProtocol
    private var selectedLanguage: ProgrammingLanguage?
    
    init(topicDataManager: TopicDataManagerProtocol = TopicDataManager()) {
        self.topicDataManager = topicDataManager
    }
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
    func topicSelected(_ questions: [QuizQuestion]) {
        view?.navigateToView(with: questions)
    }
}

private extension SelectionTestPresenter {
    func fetchTopics() {
        guard let selectedLanguage = selectedLanguage else { return }
        let language = Language(name: selectedLanguage.name, description: selectedLanguage.description, icon: selectedLanguage.icon)
        topicDataManager.getTopics(for: language) { [weak self] result in
            switch result {
            case .success(let topics):
                self?.view?.displayTopics(topics: topics)
            case .failure(let error):
                print(error.localizedDescription)
            }
        }
    }
}
