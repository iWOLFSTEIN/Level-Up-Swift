import Alamofire
import Foundation

enum User {
    case NewUser, ExistingUser, InvalidUser
}

class LevelUpAPI {
    let baseUrl: String = "https://staging.cblevelup.com/"
    
    func login(email: String, password: String, completion: @escaping (User) -> Void) {
        let loginUrl = "\(baseUrl)/api/v1/users/sign_in.json"
        
        let parameters: [String: Any] = [
            "email": email,
            "password": password
        ]
        
        AF.request(loginUrl, method: .post, parameters: parameters, encoding: URLEncoding.default).responseJSON { response in
            var user: User = .ExistingUser
            switch response.result {
            case .success(let value):
                if let json = value as? [String: Any] {
                    let first_login = json["first_login?"] as! Bool
                    if first_login {
                        user = .NewUser
                    }
                }
                completion(user)
            case .failure(let error):
                completion(User.InvalidUser)
                print("Error: \(error)")
            }
        }
    }
}
