import Foundation

struct LanguageCategoryDTO {
    let title: String
    let languages: [LanguageDTO]
}

struct LanguageDTO {
    let name: String
    let description: String
    let icon: String
}
