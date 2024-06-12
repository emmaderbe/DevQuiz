import Foundation

struct DevCategoriesResponse: Codable {
    let categories: [DevCategory]
}

struct DevCategory: Codable {
    let title: String
    let icon: String
    let items: [DevItem]
}

struct DevItem: Codable {
    let name: String
    let description: String
    let icon: String
}
