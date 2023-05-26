import Foundation

class HomeViewModel {
    var generalRepository: QuoteRespository!
    var bind: (() -> Void) = {}
    var username: String? = nil
    var quote: Quote? {
        didSet {
            self.bind()
        }
    }
    
    init() {
        let alamofireAPIManager = AlamofireAPIManager(authProvider: UserDefaultAuth())
        self.generalRepository = QuoteRespository(apiManagaer: alamofireAPIManager)
        getQuoteResponse()
    }
    
    func getQuoteResponse() {
        generalRepository.getQuote { [weak self] (result: Result<Quote, Error>) in
            switch result {
            case .success(let quote):
                self?.quote = quote
            case .failure(let error):
                print("Error Getting Quote: \(error)")
                showErrorAlert(title: "Error", message: "An error occurred while fetching quote")
            }
        }
    }
}
