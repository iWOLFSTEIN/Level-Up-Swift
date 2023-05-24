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
    
    func performRequest<T: Decodable>(_ request: APIRequest, completion: @escaping (Result<T, Error>) -> Void) {
        guard let url = request.url else {
            return
        }
        
        let encoding: ParameterEncoding = request.method == .get ? URLEncoding() : JSONEncoding()
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
                completion(.success(value))
                if let responseHeaders = response.response?.allHeaderFields as? [String: String] {
                    DataContainer.shared.responseHeaders = ResponseHeaders(
                        contentType: responseHeaders["Content-Type"]!,
                        accessToken: responseHeaders["access-token"]!,
                        client: responseHeaders["client"]!,
                        uid: responseHeaders["uid"]!)
                }
            case .failure(let error):
                completion(.failure(error))
            }
        }
    }
}
