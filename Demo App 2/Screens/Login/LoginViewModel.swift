import Foundation

class LoginViewModel {
    private var levelUpAPI: LevelUpAPI!
    var bind: (() -> Void) = {}
    var user: User = .InvalidUser
    var headers: ResponseHeaders = ResponseHeaders(contentType: "", accessToken: "", client: "", uid: "") {
        didSet {
            self.bind()
        }
    }
    
    init(email: String, password: String) {
        self.levelUpAPI = LevelUpAPI()
        getLoginResponse(email: email, password: password)
    }
    
    func getLoginResponse(email: String, password: String) {
        levelUpAPI.login(email: email, password: password, completion: { [weak self] currentUser, responseHeaders in
            
            self?.user = currentUser
            self?.headers = ResponseHeaders(
                contentType: responseHeaders["Content-Type"]!,
                accessToken: responseHeaders["access-token"]!,
                client: responseHeaders["client"]!,
                uid: responseHeaders["uid"]!)
        })
    }
}
