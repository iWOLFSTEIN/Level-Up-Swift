import Alamofire
import Foundation

class LevelUpAPI {
    let baseUrl: String = "https://staging.cblevelup.com/"
    
    func login(email: String, password: String, completion: @escaping (User, [String: String]) -> Void) {
        let loginUrl = "\(baseUrl)/api/v1/users/sign_in.json"
        
        let parameters: [String: Any] = [
            "email": email,
            "password": password
        ]
        
        AF.request(loginUrl, method: .post, parameters: parameters, encoding: URLEncoding.default).responseJSON { response in
            
            var user: User = .ExistingUser
            var responseHeaders: [String: String] = [:]
            
            switch response.result {
            case .success(let value):
                if let json = value as? [String: Any] {
                    let first_login = json["first_login?"] as! Bool
                    if first_login {
                        user = .NewUser
                    }
                }
                responseHeaders = response.response?.allHeaderFields as? [String: String] ?? [:]
                completion(user, responseHeaders)
            case .failure(let error):
                completion(User.InvalidUser, responseHeaders)
                print("Error: \(error)")
            }
        }
    }
    
    func getQuote(completion: @escaping (Result<Quote, Error>) -> Void) {
        let quoteUrl = "\(baseUrl)/api/v1/quotes/random.json"
        
        let headers: HTTPHeaders = [
            "Content-Type": "application/json",
            "access-token": "8xw-gYrSDQiiGhE_agd3iQ",
            "uid": "agent_0@mailinator.com",
            "client": "ZKTBuuhMJlf33Kjw8o6prg"
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
}
