import Foundation

struct CategoryResponse: Codable {
    let total: Int
    let result: [Category]
}

struct Category: Codable {
    let title: String
    let icon: String
    let languages: [ProgrammingLanguage]
}

struct ProgrammingLanguage: Codable {
    let name: String
    let description: String
    let icon: String
}
