import Foundation

final class MockDataService {
    func getMockCategories() -> [Category] {
        return [
            Category(
                title: "Mobile",
                icon: "mobile_icon_url",
                topics: [
                    Topic(
                        name: "React Native",
                        description: "Develop iOS and Android apps with JavaScript",
                        icon: "react_native_icon_url",
                        questions: [
                            Question(text: "What is React Native?", options: ["Library", "Framework", "Language"], correctAnswer: "Framework"),
                            Question(text: "Who developed React Native?", options: ["Facebook", "Google", "Microsoft"], correctAnswer: "Facebook")
                        ]
                    ),
                    Topic(
                        name: "Swift",
                        description: "Programming language for iOS, macOS, watchOS, and tvOS",
                        icon: "swift_icon_url",
                        questions: [
                            Question(text: "What is Swift?", options: ["Language", "Framework", "Library"], correctAnswer: "Language"),
                            Question(text: "Who developed Swift?", options: ["Apple", "Google", "Microsoft"], correctAnswer: "Apple")
                        ]
                    )
                ]
            ),
            Category(
                title: "Front-end",
                icon: "frontend_icon_url",
                topics: [
                    Topic(
                        name: "React JS",
                        description: "JavaScript library for building user interfaces",
                        icon: "react_js_icon_url",
                        questions: [
                            Question(text: "What is React JS?", options: ["Library", "Framework", "Language"], correctAnswer: "Library"),
                            Question(text: "Who developed React JS?", options: ["Facebook", "Google", "Microsoft"], correctAnswer: "Facebook")
                        ]
                    ),
                    Topic(
                        name: "Vue JS",
                        description: "Progressive JavaScript framework for building user interfaces",
                        icon: "vue_js_icon_url",
                        questions: [
                            Question(text: "What is Vue JS?", options: ["Library", "Framework", "Language"], correctAnswer: "Framework"),
                            Question(text: "Who developed Vue JS?", options: ["Evan You", "Facebook", "Google"], correctAnswer: "Evan You")
                        ]
                    )
                ]
            )
        ]
    }
}
