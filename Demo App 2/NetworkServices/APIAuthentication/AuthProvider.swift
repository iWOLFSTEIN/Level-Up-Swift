import Alamofire
import Foundation

protocol AuthProvider {
    func authenticationHeaders() -> HTTPHeaders
}

class UserDefaultAuth : AuthProvider {
    func authenticationHeaders() -> Alamofire.HTTPHeaders {
        guard let responseHeaders: ResponseHeaders = DataContainer.shared.responseHeaders else {
            return HTTPHeaders.default
        }
        
        let headers: HTTPHeaders = [
            "Content-Type": "application/json",
            "access-token": responseHeaders.accessToken,
            "uid": responseHeaders.uid,
            "client": responseHeaders.client
        ]
        
        return headers
    }
}
