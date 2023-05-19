import Foundation

class LoginViewModel {
    private var levelUpAPI: LevelUpAPI!
    var bind: (() -> Void) = {}
    var user: User = .InvalidUser {
        didSet {
            self.bind()
        }
    }
    
    init(email: String, password: String) {
        self.levelUpAPI = LevelUpAPI()
        getLoginResponse(email: email, password: password)
    }
    
    func getLoginResponse(email: String, password: String) {
        levelUpAPI.login(email: email, password: password, completion: { [weak self] currentUser in
            self?.user = currentUser
        })
    }
}
