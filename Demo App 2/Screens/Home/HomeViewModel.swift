import Foundation

class HomeViewModel {
    private var levelUpAPI: LevelUpAPI!
    var bind: (() -> Void) = {}
    var quote: Quote? {
        didSet {
            self.bind()
        }
    }
    
    init() {
        self.levelUpAPI = LevelUpAPI()
        getQuoteResponse()
    }
    
    func getQuoteResponse() {
        levelUpAPI.getQuote(completion: { [weak self] result in
            switch result {
            case .success(let quote):
                self?.quote = quote
            case .failure(let error):
                print("Error Getting Quote: \(error)")       }
        })
    }
}
