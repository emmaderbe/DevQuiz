import Foundation

protocol ResultViewProtocol: AnyObject {
    func navigateToView()
    func setupResultText(result: String, category: String, technology: String)
    func setupTitleAndImage(title: String, description: String, image: String)
}

final class ResultPresenter {
    weak var view: ResultViewProtocol?
    
    private var result: String?
    private var category: String?
    private var technology: String?
    
    private var correctAnswers: Double = 0
    private var totalQuestions: Double = 0
}

extension ResultPresenter {
    func viewDidLoad(view: ResultViewProtocol) {
        self.view = view
        setupResultText()
        setupTitleAndImage()
    }
    
    func setQuizResult(result: String, category: String, technology: String) {
        self.result = result
        self.category = category
        self.technology = technology
        parseResult(result)
    }
    
    func endQuizSession() {
        view?.navigateToView()
    }
}

private extension ResultPresenter {
    func setupResultText() {
        guard let result = result, let category = category, let technology = technology else {
            return
        }
        view?.setupResultText(result: result, category: category, technology: technology)
    }
}

private extension ResultPresenter {
    func parseResult(_ result: String) {
        if let correctAnswers = Int(result.split(separator: "/").first ?? ""),
           let totalQuestions = Int(result.split(separator: "/").last ?? "") {
            self.correctAnswers = Double(correctAnswers)
            self.totalQuestions = Double(totalQuestions)
        }
    }
    
    func setupTitleAndImage() {
        guard totalQuestions > 0 else { return }
        let successRate = correctAnswers / totalQuestions
        
        let title: String
        let description: String
        let image: String
        
        switch successRate {
        case ..<0.5:
            title = ResultEnum.ResultString.lowResultTitle
            description = ResultEnum.ResultString.lowResultDescription
            image = ResultEnum.ResultImage.lowResultTitleImage
        case 0.5..<0.75:
            title = ResultEnum.ResultString.mediumResultTitle
            description = ResultEnum.ResultString.mediumResultDescription
            image = ResultEnum.ResultImage.mediumResultTitleImage
        default:
            title = ResultEnum.ResultString.highResultTitle
            description = ResultEnum.ResultString.highResultDescription
            if #available(iOS 17, *) {
                image = ResultEnum.ResultImage.highResultTitleImage
            } else {
                image = ResultEnum.ResultImage.highResultTitleImageOldVersion
            }
        }
        
        view?.setupTitleAndImage(title: title, description: description, image: image)
    }
}
