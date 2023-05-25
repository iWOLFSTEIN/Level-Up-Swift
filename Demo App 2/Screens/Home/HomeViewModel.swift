import Foundation

class HomeViewModel {
//    private var levelUpAPI: LevelUpAPI!
    var generalRepository: GeneralRepository!
    var bind: (() -> Void) = {}
    var quote: Quote? {
        didSet {
            self.bind()
        }
    }
    
    init() {
//        self.levelUpAPI = LevelUpAPI()
        let alamofireAPIManager = AlamofireAPIManager(authProvider: UserDefaultAuth())
        self.generalRepository = GeneralRepository(apiManagaer: alamofireAPIManager)
        getQuoteResponse()
    }
    
    func getQuoteResponse() {
//        levelUpAPI.getQuote(completion: { [weak self] result in
//            switch result {
//            case .success(let quote):
//                self?.quote = quote
//            case .failure(let error):
//                print("Error Getting Quote: \(error)")       }
//        })
        generalRepository.getQuote { [weak self] (result: Result<Quote, Error>) in
            switch result {
            case .success(let quote):
                self?.quote = quote
            case .failure(let error):
                print("Error Getting Quote: \(error)")
            }
        }
    }
}
