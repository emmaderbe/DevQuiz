import Foundation

protocol SelectionTestProtocol: AnyObject {
    func displayTopics(topics: [TopicDTO])
    func navigateToView(with questions: [QuestionDTO], language: LanguageDTO, topic: TopicDTO)
}

final class SelectionTestPresenter {
    weak var view: SelectionTestProtocol?
    private let topicDataManager: TopicDataManagerProtocol
    private var selectedLanguage: LanguageDTO?
    private var selectedTopic: TopicDTO?
    
    init(topicDataManager: TopicDataManagerProtocol = TopicDataManager()) {
        self.topicDataManager = topicDataManager
    }
}

extension SelectionTestPresenter {
    func setSelectedLanguage(_ language: LanguageDTO) {
        self.selectedLanguage = language
    }
    
    func setSelectedTopic(_ topic: TopicDTO) {
        self.selectedTopic = topic
    }
    
    func viewDidLoad(view: SelectionTestProtocol) {
        self.view = view
        fetchTopics()
    }
}

extension SelectionTestPresenter {
    func topicSelected(_ questions: [QuestionDTO]) {
        view?.navigateToView(with: questions, language: selectedLanguage!, topic: selectedTopic!)
    }
}

private extension SelectionTestPresenter {
    func fetchTopics() {
        guard let selectedLanguage = selectedLanguage else { return }
        let language = LanguageDTO(name: selectedLanguage.name, description: selectedLanguage.description, icon: selectedLanguage.icon)
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
