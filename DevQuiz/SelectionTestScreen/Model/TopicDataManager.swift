import Foundation

protocol TopicDataManagerProtocol {
    func getTopics(for language: Language, completion: @escaping (Result<[QuizTopic], Error>) -> Void)
    func getQuestions(for topic: QuizTopic) -> [QuizQuestion]
}

class TopicDataManager: TopicDataManagerProtocol {
    private let networkService: NetworkServiceProtocol
    private var topics: [QuizTopic]?

    init(networkService: NetworkServiceProtocol = NetworkService()) {
        self.networkService = networkService
    }
}

extension TopicDataManager {
    func getTopics(for language: Language, completion: @escaping (Result<[QuizTopic], Error>) -> Void) {
        networkService.fetchTopics(for: language.name) { result in
            switch result {
            case .success(let topicResponse):
                let quizTopics = topicResponse.result.map { topic in
                    QuizTopic(name: topic.name, description: topic.description, icon: topic.icon, questions: topic.questions.map { question in
                        QuizQuestion(text: question.text, options: question.options, correctAnswer: question.correctAnswer)
                    })
                }
                self.topics = quizTopics
                completion(.success(quizTopics))
            case .failure(let error):
                completion(.failure(error))
            }
        }
    }

    func getQuestions(for topic: QuizTopic) -> [QuizQuestion] {
        return topic.questions
    }
}
