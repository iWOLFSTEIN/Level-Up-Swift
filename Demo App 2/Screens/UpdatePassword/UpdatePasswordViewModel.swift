import Foundation

class UpdatePasswordViewModel {
    private var levelUpAPI: LevelUpAPI!
    var bind: (() -> Void) = {}
    var updatePasswordResponse: UpdatePasswordResponse = UpdatePasswordResponse(message: "") {
        didSet {
            self.bind()
        }
    }
    
    init(updationData: UpdatePasswordData) {
        self.levelUpAPI = LevelUpAPI()
        getUpdatePasswordResponse(updationData: updationData)
    }
    
    func getUpdatePasswordResponse(updationData: UpdatePasswordData) {
        levelUpAPI.firstTimeChangePassword(updationData: updationData, completion: { [weak self] result in
            switch result {
            case .success(let updatePasswordResponse):
                self?.updatePasswordResponse = updatePasswordResponse
            case .failure(let error):
                print("Error Updating Password (First Time): \(error)")       }
        })
    }
}
