import Foundation

struct Category: Codable {
    let title: String
    let icon: String
    let topics: [Topic]
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
}
