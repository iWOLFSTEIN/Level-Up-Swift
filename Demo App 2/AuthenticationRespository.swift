import Foundation

class AuthenticationRepository {
    
    var apiManagaer: APIManager
    
    init(apiManagaer: APIManager) {
        self.apiManagaer = apiManagaer
    }
    
    func login(withEmail email: String, andPassword password: String, completion: @escaping (Result<AuthenticatedUser, Error>) -> Void) {
        let request = AuthenticationRequest.login(email: email, password: password)
        apiManagaer.performRequest(request, completion: completion)
    }
}
