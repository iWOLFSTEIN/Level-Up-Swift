import Combine
import Foundation

class QuoteRepository {
    var apiManager: APIManager
    
    init(apiManager: APIManager) {
        self.apiManager = apiManager
    }
    
    func getQuote() -> AnyPublisher<Quote, Error> {
        let request = AuthenticationRequest.quote
        return apiManager.performRequest(request)
            .tryMap { (value: Quote, _) -> Quote in
                return value
            }
            .mapError { error -> Error in
                return error
            }
            .eraseToAnyPublisher()
    }
}
