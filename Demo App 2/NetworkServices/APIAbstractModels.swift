import Alamofire
import Foundation

let baseUrl: String = "https://staging.cblevelup.com/"

//enum RequestName {
//    case Login, Quote, UpdatePassword
//}

protocol APIRequest {
    var url: URL? { get }
    var method: HTTPMethod { get }
    var parameters: Parameters? { get }
    
    // add a property requiresAuth
}

protocol AuthProvider {
    func authenticationHeaders() -> HTTPHeaders
}

protocol APIManager {
    var authProvider: AuthProvider? { get set }
    func performRequest<T: Decodable>(_ request: APIRequest, completion: @escaping (Result<(T, NSDictionary), Error>) -> Void)
}

