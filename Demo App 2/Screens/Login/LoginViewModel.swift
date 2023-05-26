import Combine
import Foundation

class LoginViewModel {
    private var authenticationRepository: AuthenticationRepository!
    var bind: (() -> Void) = {}
    var user: User = .invalidUser {
        didSet {
            self.bind()
        }
    }

    var authenticatedUser: AuthenticatedUser?

    init(email: String, password: String) {
        let alamofireAPIManager: AlamofireAPIManager = AlamofireAPIManager(authProvider: UserDefaultAuth())
        self.authenticationRepository = AuthenticationRepository(apiManagaer: alamofireAPIManager)
        getLoginResponse(email: email, password: password)
    }

    func getLoginResponse(email: String, password: String) {
        authenticationRepository.login(withEmail: email, andPassword: password, completion: {
            (result: Result<AuthenticatedUser, Error>) in
            switch result {
            case .success(let authenticatedUser):
                self.authenticatedUser = authenticatedUser
                if self.authenticatedUser!.isFirstLogin {
                    self.user = .newUser
                } else {
                    self.user = .existingUser
                }
            case .failure(let error):
                print("Throwing this error \(error)")
                self.user = .invalidUser
            }
        })
    }
}

