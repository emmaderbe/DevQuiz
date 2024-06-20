import Foundation

enum ResultEnum {
    enum ResultView {
        static let top: CGFloat = 8
        static let leading: CGFloat = 16
        static let trailing: CGFloat = -16
        static let bottom: CGFloat = -16
        
        static let spacing: CGFloat = 16
        static let mediumSpacing: CGFloat = 24
        static let largeSpacing: CGFloat = 32
        
        static let backgroundHeight: CGFloat = 0.3
        static let buttonHeight: CGFloat = 0.06
        static let cornerRadius: CGFloat = 8
    }
    
    enum ResultString {
        static let resultTitle = "Правильных ответов:"
        static let categoryTitle = "Тема квиза:"
        static let technologyTitle = "Язык:"
        
        static let lowResultTitle = "Нужно больше практики"
        static let lowResultDescription = "Продолжайте учиться и пытаться снова. Вы обязательно справитесь!"
        
        static let mediumResultTitle = "Неплохо"
        static let mediumResultDescription = "Следует подучить, но и сейчас вы хорошо справились"
        
        static let highResultTitle = "Отличный результат!"
        static let highResultDescription = "Вы отлично справились с квизом. Продолжайте в том же духе!"
    }
    
    enum ResultImage {
        static let resultTitleImage = "questionmark.circle"
        static let categoryTitleImage = "book"
        static let technologyTitleImage = "chevron.left.slash.chevron.right"
        
        static let lowResultTitleImage = "hand.thumbsdown.fill"
        static let mediumResultTitleImage = "hand.thumbsup.fill"
        static let highResultTitleImage = "hands.and.sparkles.fill"
        static let highResultTitleImageOldVersion = "hands.clap.fill"
    }
}
