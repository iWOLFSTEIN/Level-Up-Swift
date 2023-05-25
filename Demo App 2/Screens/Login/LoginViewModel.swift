import Foundation

class LoginViewModel {
    private var authenticationRepository: AuthenticationRepository!
    var bind: (() -> Void) = {}
    var user: User = .InvalidUser {
        didSet {
            self.bind()
        }
    }

    var authenticatedUser: AuthenticatedUser?

    init(email: String, password: String) {
        let alamofireAPIManager: AlamofireAPIManager = AlamofireAPIManager()
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
                    self.user = .NewUser
                } else {
                    self.user = .ExistingUser
                }
            case .failure(let error):
                print("Throwing this error \(error)")
                self.user = .InvalidUser
            }
            
            let alamofireAPIManager = AlamofireAPIManager(authProvider: UserDefaultAuth())
            let generalRepository = GeneralRepository(apiManagaer: alamofireAPIManager)
            generalRepository.getQuote { [weak self] (result: Result<Quote, Error>) in
                switch result {
                case .success(let quote):
                    print(quote)
                case .failure(let error):
                    print("Error Getting Quote: \(error)")
                }
            }
            
        })
    }
}
