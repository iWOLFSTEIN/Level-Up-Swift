import Foundation

class UpdatePasswordViewModel {
    private var authenticationRespository: AuthenticationRepository!
    var bind: (() -> Void) = {}
    var updatePasswordResponse: UpdatePasswordResponse = UpdatePasswordResponse(message: "") {
        didSet {
            self.bind()
        }
    }
    
    init(updationData: UpdatePasswordData) {
        let alamofireAPIManager = AlamofireAPIManager(authProvider: UserDefaultAuth())
        self.authenticationRespository = AuthenticationRepository(apiManagaer: alamofireAPIManager)
        getUpdatePasswordResponse(updationData: updationData)
    }
    
    func getUpdatePasswordResponse(updationData: UpdatePasswordData) {
        authenticationRespository.firstTimeChangePassword(updationData: updationData, completion: { [weak self]
            (result: Result<UpdatePasswordResponse, Error>) in
            switch result {
            case .success(let updatePasswordResponse):
                self?.updatePasswordResponse = updatePasswordResponse
            case .failure(let error):
                print("Error Updating Password (First Time): \(error)")
                showErrorAlert(title: "Error", message: "An error occurred while updating password")
            }
        })
    }
}
