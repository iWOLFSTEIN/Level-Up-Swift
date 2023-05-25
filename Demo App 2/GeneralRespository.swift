import Foundation

class GeneralRepository {
    var apiManagaer: APIManager
    
    init(apiManagaer: APIManager) {
        self.apiManagaer = apiManagaer
    }
    
    func getQuote(completion: @escaping (Result<Quote, Error>) -> Void) {
        let request = AuthenticationRequest.quote
        apiManagaer.performRequest(request, withName: .Quote, completion: completion)
    }
}
