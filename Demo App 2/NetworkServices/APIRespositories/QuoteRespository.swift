import Foundation

class QuoteRespository {
    var apiManagaer: APIManager
    
    init(apiManagaer: APIManager) {
        self.apiManagaer = apiManagaer
    }
    
    func getQuote(completion: @escaping (Result<Quote, Error>) -> Void) {
        let request = AuthenticationRequest.quote
        apiManagaer.performRequest(request, completion: {
            (result: Result<(Quote, NSDictionary), Error>) in
            switch result {
            case .success((let quote, _)):
                completion(.success(quote))
            case .failure(let error):
                completion(.failure(error))
            }
        })
    }
}
