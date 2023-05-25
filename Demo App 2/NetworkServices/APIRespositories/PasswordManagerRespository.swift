import Foundation

class PasswordManagerRepository {
    var apiManagaer: APIManager
    
    init(apiManagaer: APIManager) {
        self.apiManagaer = apiManagaer
    }
    
    func firstTimeChangePassword(updationData: UpdatePasswordData, completion: @escaping (Result<UpdatePasswordResponse, Error>) -> Void) {
        let request = AuthenticationRequest.updatePassord(updationData: updationData)
        apiManagaer.performRequest(request, withName: .UpdatePassword, completion: completion)
    }
}
