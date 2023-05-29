import Combine
import Foundation

class UpdatePasswordViewModel {
    private var authenticationRepository: AuthenticationRepository!
    
    @Published var updatePasswordResponse: UpdatePasswordResponse = UpdatePasswordResponse(message: "")
    var cancellables = Set<AnyCancellable>()
    
    init(updationData: UpdatePasswordData) {
        let alamofireAPIManager = AlamofireAPIManager(authProvider: UserDefaultAuth())
        self.authenticationRepository = AuthenticationRepository(apiManagaer: alamofireAPIManager)
        getUpdatePasswordResponse(updationData: updationData)
    }
    
    func getUpdatePasswordResponse(updationData: UpdatePasswordData) {
        authenticationRepository.firstTimeChangePassword(updationData: updationData)
            .receive(on: DispatchQueue.main)
            .sink { completion in
                switch completion {
                case .finished:
                    break
                case .failure(let error):
                    print("Error Updating Password (First Time): \(error)")
                    showErrorAlert(title: "Error", message: "An error occurred while updating password")
                }
            } receiveValue: { [weak self] updatePasswordResponse in
                self?.updatePasswordResponse = updatePasswordResponse
            }
            .store(in: &cancellables)
    }
}
