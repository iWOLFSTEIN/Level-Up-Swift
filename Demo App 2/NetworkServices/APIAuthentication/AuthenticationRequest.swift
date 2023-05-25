import Alamofire
import Foundation

enum AuthenticationRequest: APIRequest {
    case login (email: String, password: String)
    case quote
    case updatePassord (updationData: UpdatePasswordData)
    
    var parameters: Parameters? {
        switch self {
        case .login(let email, let password) :
            let parameters: [String: Any] = [
                "email": email,
                "password": password
            ]
            return parameters
        case .quote:
            return [:]
        case .updatePassord(let updationData):
            let parameters: [String: String] = [
                "password": updationData.password,
                "password_confirmation": updationData.passwordConfirmation,
                "current_password": updationData.currentPassword
            ]
            return parameters
        }
    }
    
    var method: HTTPMethod {
        switch self {
        case .login :
            return .post
        case .quote:
            return .get
        case .updatePassord:
            return .post
        }
    }
    
    var url: URL? {
        switch self {
        case .login :
            return URL(string: "\(baseUrl)/api/v1/users/sign_in.json")
        case .quote:
            return URL(string: "\(baseUrl)/api/v1/quotes/random.json")
        case .updatePassord:
            return URL(string: "\(baseUrl)/api/v1/user/change_password.json")
        }
    }
}
