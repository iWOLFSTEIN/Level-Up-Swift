import Alamofire
import Foundation

let baseUrl: String = "https://staging.cblevelup.com/"

protocol RequestParameters {
    
}

protocol APIRequest {
    var url: URL? { get }
    var method: HTTPMethod { get }
    var parameters: Parameters? { get }
}

enum RequestName {
    case Login, Quote, UpdatePassword
}

protocol AuthProvider {
    func authenticationHeaders() -> HTTPHeaders
}

protocol APIManager {
    var authProvider: AuthProvider? { get set }
    func performRequest<T: Decodable>(_ request: APIRequest, withName requestName: RequestName, completion: @escaping (Result<T, Error>) -> Void)
}

class LevelUpAPI {
    let baseUrl: String = "https://staging.cblevelup.com/"
    
//    func login(email: String, password: String, completion: @escaping (User, [String: String]) -> Void) {
//        let loginUrl = "\(baseUrl)/api/v1/users/sign_in.json"
//
//        let parameters: [String: Any] = [
//            "email": email,
//            "password": password
//        ]
//
//        AF.request(loginUrl, method: .post, parameters: parameters, encoding: URLEncoding.default).responseJSON { response in
//
//            var user: User = .ExistingUser
//            var responseHeaders: [String: String] = [:]
//
//            switch response.result {
//            case .success(let value):
//                if let json = value as? [String: Any] {
//                    let first_login = json["first_login?"] as! Bool
//                    if first_login {
//                        user = .NewUser
//                    }
//                }
//                responseHeaders = response.response?.allHeaderFields as? [String: String] ?? [:]
//                completion(user, responseHeaders)
//            case .failure(let error):
//                completion(User.InvalidUser, responseHeaders)
//                print("Error: \(error)")
//            }
//        }
//    }
    
    func getQuote(completion: @escaping (Result<Quote, Error>) -> Void) {
        let quoteUrl = "\(baseUrl)/api/v1/quotes/random.json"
        guard let responseHeaders: ResponseHeaders = DataContainer.shared.responseHeaders else {
            return
        }
        
        let headers: HTTPHeaders = [
            "Content-Type": "application/json",
            "access-token": responseHeaders.accessToken,
            "uid": responseHeaders.uid,
            "client": responseHeaders.client
        ]
        
        AF.request(quoteUrl, headers: headers).validate().responseDecodable(of: Quote.self) { response in
            switch response.result {
            case .success(let quote):
                completion(.success(quote))
            case .failure(let error):
                completion(.failure(error))
            }
        }
    }
    
    func firstTimeChangePassword(updationData: UpdatePasswordData, completion: @escaping (Result<UpdatePasswordResponse, Error>) -> Void) {
        let updatePasswordUrl = "\(baseUrl)/api/v1/user/change_password.json"
        
        guard let responseHeaders: ResponseHeaders = DataContainer.shared.responseHeaders else {
            return
        }
        
        let headers: HTTPHeaders = [
            "Content-Type": "application/json",
            "access-token": responseHeaders.accessToken,
            "uid": responseHeaders.uid,
            "client": responseHeaders.client
        ]
        
        let parameters: [String: String] = [
            "password": updationData.password,
            "password_confirmation": updationData.passwordConfirmation,
            "current_password": updationData.currentPassword
        ]
        
        AF.request(updatePasswordUrl, method: .post, parameters: parameters, encoder: JSONParameterEncoder.default, headers: headers).validate().responseDecodable(of: UpdatePasswordResponse.self) { response in
            switch response.result {
            case .success(let updatePasswordResponse):
                completion(.success(updatePasswordResponse))
            case .failure(let error):
                completion(.failure(error))
            }
        }
    }
}
