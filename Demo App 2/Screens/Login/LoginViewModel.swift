import Combine
import Foundation

class LoginViewModel: ObservableObject {
    private var authenticationRepository: AuthenticationRepository!
    
    @Published var user: User?
    @Published var authenticatedUser: AuthenticatedUser?
    var cancellables = Set<AnyCancellable>()
    
    init(email: String, password: String) {
        let alamofireAPIManager: AlamofireAPIManager = AlamofireAPIManager(authProvider: UserDefaultAuth())
        self.authenticationRepository = AuthenticationRepository(apiManagaer: alamofireAPIManager)
        getLoginResponse(email: email, password: password)
    }
    
    func getLoginResponse(email: String, password: String) {
           authenticationRepository.login(withEmail: email, andPassword: password)
               .sink(receiveCompletion: { [weak self] completion in
                   if case let .failure(error) = completion {
                       print("Throwing this error on authentication \(error)")
                       self?.user = .invalidUser
                   }
               }, receiveValue: { [weak self] authenticatedUser in
                   self?.authenticatedUser = authenticatedUser
                   if authenticatedUser.isFirstLogin {
                       self?.user = .newUser
                   } else {
                       self?.user = .existingUser
                   }
               })
               .store(in: &cancellables)
       }
}

