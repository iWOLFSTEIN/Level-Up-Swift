import Alamofire
import Foundation
import Combine

protocol APIManager {
    var authProvider: AuthProvider? { get set }
    func performRequest<T: Decodable>(_ request: APIRequest) -> AnyPublisher<(T, NSDictionary), Error>
}

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
    
    func performRequest<T: Decodable>(_ request: APIRequest) -> AnyPublisher<(T, NSDictionary), Error> {
        guard let url = request.url else {
            return Fail(error: APIError.dataNotFound).eraseToAnyPublisher()
        }
        
        let headers = authProvider?.authenticationHeaders()
        let encoding: ParameterEncoding = request.method == .get ? URLEncoding() : JSONEncoding()
        
        let alamofireRequest = request.requiresAuth ? AF.request(
            url,
            method: request.method,
            parameters: request.parameters,
            encoding: encoding,
            headers: headers
        ) : AF.request(
            url,
            method: request.method,
            parameters: request.parameters,
            encoding: encoding
        )
        
        return alamofireRequest
            .validate()
            .publishDecodable(type: T.self)
            .tryMap { response in
                guard let value = response.value else {
                    throw response.error ?? APIError.dataNotFound
                }
                
                let headers = response.response?.allHeaderFields as? NSDictionary ?? NSDictionary()
                return (value, headers)
            }
            .mapError { error in
                if let apiError = error as? APIError {
                    return apiError
                } else {
                    return error
                }
            }
            .eraseToAnyPublisher()
    }
}
