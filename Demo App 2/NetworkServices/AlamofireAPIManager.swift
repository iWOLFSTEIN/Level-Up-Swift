import Alamofire
import Foundation

class AlamofireAPIManager: APIManager {
    
    var authProvider: AuthProvider?
    
    init(authProvider: AuthProvider? = nil) {
        self.authProvider = authProvider
    }
    
    enum APIError: LocalizedError {
        case dataNotFound
        
        var errorDescription: String? {
            switch self {
            case .dataNotFound: return "Unabled to unwrap data"
            }
        }
    }
    
    func performRequest<T: Decodable>(_ request: APIRequest, completion: @escaping (Result<(T, NSDictionary), Error>) -> Void) {
        guard let url = request.url else {
            return
        }
        
        let encoding: ParameterEncoding = request.method == .get ? URLEncoding() : JSONEncoding()
        
        // add check. Only add headers if the request requires authentication
        let headers = authProvider?.authenticationHeaders()
        
        AF.request(
            url,
            method: request.method,
            parameters: request.parameters,
            encoding: encoding,
            headers: headers
        ).validate().responseDecodable(of: T.self) { response in
            switch response.result {
            case .success(let value):
                if let headers = response.response?.allHeaderFields as? NSDictionary {
                    completion(.success((value, headers)))
                } else {
                    completion(.success((value, [:])))
                }
            case .failure(let error):
                completion(.failure(error))
            }
        }
    }
}
