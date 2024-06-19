import Foundation

struct QuizTopic {
    let name: String
    let description: String
    let icon: String
    let questions: [QuizQuestion]
}

struct QuizQuestion {
    let text: String
    let options: [String]
    let correctAnswer: String
}
