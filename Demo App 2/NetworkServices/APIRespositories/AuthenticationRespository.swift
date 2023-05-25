import Foundation

class AuthenticationRepository {
    
    var apiManagaer: APIManager
    
    init(apiManagaer: APIManager) {
        self.apiManagaer = apiManagaer
    }
    
    func login(withEmail email: String, andPassword password: String, completion: @escaping (Result<AuthenticatedUser, Error>) -> Void) {
        let request = AuthenticationRequest.login(email: email, password: password)
        apiManagaer.performRequest(request, completion: {
            (result: Result<(AuthenticatedUser, NSDictionary), Error>) in
            switch result {
            case .success((let authenticatedUser, let responseHeaders)):
                DataContainer.shared.responseHeaders = ResponseHeaders(
                    contentType: responseHeaders["Content-Type"] as! String,
                    accessToken: responseHeaders["access-token"]! as! String,
                    client: responseHeaders["client"]! as! String,
                    uid: responseHeaders["uid"]! as! String)
                completion(.success(authenticatedUser))
            case .failure(let error):
                completion(.failure(error))
            }
        })
    }
    
    func firstTimeChangePassword(updationData: UpdatePasswordData, completion: @escaping (Result<UpdatePasswordResponse, Error>) -> Void) {
        let request = AuthenticationRequest.updatePassord(updationData: updationData)
        apiManagaer.performRequest(request, completion: {
            (result: Result<(UpdatePasswordResponse, NSDictionary), Error>) in
            switch result {
            case .success((let updatePasswordResponse, _)):
                completion(.success(updatePasswordResponse))
            case .failure(let error):
                completion(.failure(error))
            }
        })
    }
}
