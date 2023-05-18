import Alamofire
import Foundation

class LevelUpAPI {
    let baseUrl: String = "https://staging.cblevelup.com/"
    
    func login(email: String, password: String, completion: @escaping (Bool) -> Void) {
        let loginUrl = "\(baseUrl)/api/v1/users/sign_in.json"
        
        let parameters: [String: Any] = [
            "email": email,
            "password": password
        ]
        
        AF.request(loginUrl, method: .post, parameters: parameters, encoding: URLEncoding.default).responseJSON { response in
            switch response.result {
            case .success(let value):
                var first_login: Bool = false
                if let json = value as? [String: Any] {
                    first_login = json["first_login?"] as! Bool
                }
                completion(first_login)
            case .failure(let error):
                print("Error: \(error)")
            }
        }
    }
}
