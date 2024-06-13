import Foundation

final class MockDataService {
    func getMockCategories() -> [Category] {
        return [
            Category(
                title: "Mobile",
                icon: "mobile_icon_url",
                languages: [
                    ProgrammingLanguage(
                        name: "React Native",
                        description: "Develop iOS and Android apps with JavaScript",
                        icon: "react_native_icon_url",
                        topics: [
                            Topic(
                                name: "Fundamentals",
                                description: "Basic concepts of React Native",
                                icon: "fundamentals_icon_url",
                                questions: [
                                    Question(text: "What is React Native?", options: ["Library", "Framework", "Language"], correctAnswer: "Framework"),
                                    Question(text: "Who developed React Native?", options: ["Facebook", "Google", "Microsoft"], correctAnswer: "Facebook")
                                ]
                            ),
                            Topic(
                                name: "Classes",
                                description: "Working with classes in React Native",
                                icon: "classes_icon_url",
                                questions: [
                                    Question(text: "What is a class?", options: ["Function", "Object", "Template"], correctAnswer: "Template"),
                                    Question(text: "How do you define a class in React Native?", options: ["class MyClass {}", "def MyClass {}", "function MyClass() {}"], correctAnswer: "class MyClass {}")
                                ]
                            )
                        ]
                    ),
                    ProgrammingLanguage(
                        name: "Swift",
                        description: "Programming language for iOS, macOS, watchOS, and tvOS",
                        icon: "swift_icon_url",
                        topics: [
                            Topic(
                                name: "Fundamentals",
                                description: "Basic concepts of Swift",
                                icon: "fundamentals_icon_url",
                                questions: [
                                    Question(text: "What is Swift?", options: ["Language", "Framework", "Library"], correctAnswer: "Language"),
                                    Question(text: "Who developed Swift?", options: ["Apple", "Google", "Microsoft"], correctAnswer: "Apple")
                                ]
                            ),
                            Topic(
                                name: "Protocols",
                                description: "Working with protocols in Swift",
                                icon: "protocols_icon_url",
                                questions: [
                                    Question(text: "What is a protocol?", options: ["Blueprint", "Class", "Struct"], correctAnswer: "Blueprint"),
                                    Question(text: "How do you define a protocol in Swift?", options: ["protocol MyProtocol {}", "interface MyProtocol {}", "defprotocol MyProtocol"], correctAnswer: "protocol MyProtocol {}")
                                ]
                            )
                        ]
                    )
                ]
            ),
            Category(
                title: "Front-end",
                icon: "frontend_icon_url",
                languages: [
                    ProgrammingLanguage(
                        name: "React JS",
                        description: "JavaScript library for building user interfaces",
                        icon: "react_js_icon_url",
                        topics: [
                            Topic(
                                name: "Fundamentals",
                                description: "Basic concepts of React JS",
                                icon: "fundamentals_icon_url",
                                questions: [
                                    Question(text: "What is React JS?", options: ["Library", "Framework", "Language"], correctAnswer: "Library"),
                                    Question(text: "Who developed React JS?", options: ["Facebook", "Google", "Microsoft"], correctAnswer: "Facebook")
                                ]
                            ),
                            Topic(
                                name: "Components",
                                description: "Working with components in React JS",
                                icon: "components_icon_url",
                                questions: [
                                    Question(text: "What is a component?", options: ["Function", "Class", "Template"], correctAnswer: "Class"),
                                    Question(text: "How do you define a functional component in React JS?", options: ["function MyComponent() {}", "def MyComponent() {}", "class MyComponent {}"], correctAnswer: "function MyComponent() {}")
                                ]
                            )
                        ]
                    ),
                    ProgrammingLanguage(
                        name: "Vue JS",
                        description: "Progressive JavaScript framework for building user interfaces",
                        icon: "vue_js_icon_url",
                        topics: [
                            Topic(
                                name: "Fundamentals",
                                description: "Basic concepts of Vue JS",
                                icon: "fundamentals_icon_url",
                                questions: [
                                    Question(text: "What is Vue JS?", options: ["Library", "Framework", "Language"], correctAnswer: "Framework"),
                                    Question(text: "Who developed Vue JS?", options: ["Evan You", "Facebook", "Google"], correctAnswer: "Evan You")
                                ]
                            ),
                            Topic(
                                name: "Directives",
                                description: "Working with directives in Vue JS",
                                icon: "directives_icon_url",
                                questions: [
                                    Question(text: "What is a directive?", options: ["HTML attribute", "JavaScript function", "CSS style"], correctAnswer: "HTML attribute"),
                                    Question(text: "How do you use v-if directive in Vue JS?", options: ["<div v-if='condition'>", "<div if='condition'>", "<div directive-if='condition'>"], correctAnswer: "<div v-if='condition'>")
                                ]
                            )
                        ]
                    )
                ]
            )
        ]
    }
}
