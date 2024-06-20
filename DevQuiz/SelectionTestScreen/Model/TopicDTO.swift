import Foundation

struct TopicDTO {
    let name: String
    let description: String
    let icon: String
    let questions: [QuestionDTO]
}

struct QuestionDTO {
    let text: String
    let options: [String]
    let correctAnswer: String
}
