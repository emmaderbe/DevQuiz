import Foundation

struct TopicResponse: Codable {
    let total: Int
    let result: [Topic]
}

struct Topic: Codable {
    let name: String
    let description: String
    let icon: String
    let questions: [Question]
}

struct Question: Codable {
    let text: String
    let options: [String]
    let correctAnswer: String

    enum CodingKeys: String, CodingKey {
        case text
        case options
        case correctAnswer = "correct_answer"
    }
}

