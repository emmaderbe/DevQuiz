import Foundation

final class NetworkService {
    func fetchData(completion: @escaping (Result<[DevCategory], Error>) -> Void) {
        let jsonData = """
        {
            "categories": [
                {
                    "title": "Mobile",
                    "icon": "mobile_icon_url",
                    "items": [
                        {
                            "name": "React Native",
                            "description": "Develop iOS and Android apps with JavaScript",
                            "icon": "react_native_icon_url"
                        },
                                {
                                    "name": "React Native",
                                    "description": "Develop iOS and Android apps with JavaScript",
                                    "icon": "react_native_icon_url"
                                },
                        {
                            "name": "Swift",
                            "description": "Programming language for iOS, macOS, watchOS, and tvOS",
                            "icon": "swift_icon_url"
                        }
                    ]
                },
                {
                    "title": "Front-end",
                    "icon": "frontend_icon_url",
                    "items": [
                        {
                            "name": "React JS",
                            "description": "JavaScript library for building user interfaces",
                            "icon": "react_js_icon_url"
                        },
                                {
                                    "name": "React JS",
                                    "description": "JavaScript library for building user interfaces",
                                    "icon": "react_js_icon_url"
                                },
                        {
                            "name": "Vue JS",
                            "description": "Progressive JavaScript framework for building user interfaces",
                            "icon": "vue_js_icon_url"
                        }
                    ]
                },
                {
                    "title": "Back-end",
                    "icon": "backend_icon_url",
                    "items": [
                        {
                            "name": "Node JS",
                            "description": "Asynchronous JavaScript runtime environment",
                            "icon": "node_js_icon_url"
                        },
                                {
                                    "name": "Node JS",
                                    "description": "Asynchronous JavaScript runtime environment",
                                    "icon": "node_js_icon_url"
                                },
                        {
                            "name": "Spring",
                            "description": "Framework for Java application development",
                            "icon": "spring_icon_url"
                        }
                    ]
                }
            ]
        }
        """.data(using: .utf8)!
        
        do {
            let response = try JSONDecoder().decode(DevCategoriesResponse.self, from: jsonData)
            completion(.success(response.categories))
        } catch {
            completion(.failure(error))
        }
    }
}
