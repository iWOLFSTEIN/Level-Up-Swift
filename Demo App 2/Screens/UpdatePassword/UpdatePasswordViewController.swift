import UIKit

class UpdatePasswordViewController: UIViewController {
    
    @IBOutlet var contentView: UpdatePasswordContentView!
    
    var viewModel: UpdatePasswordViewModel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        contentView.passwordTextField.text = "123456"
        contentView.passwordTextField.isSecureTextEntry = true
        contentView.confirmPasswordTextField.text = "123456"
        contentView.confirmPasswordTextField.isSecureTextEntry = true
    }
    
    @IBAction func updatePassword( _ sender: UIButton) {
        
        if let password = contentView.passwordTextField.text,
           let passwordConfirmation = contentView.confirmPasswordTextField.text {
            
            let currentPassword = "123456"
            let password = password.isEmpty ? "123456" : password
            let passwordConfirmation = passwordConfirmation.isEmpty ? "123456" : passwordConfirmation
            
            if password != passwordConfirmation {
                showErrorAlert(title: "Error", message: "Passwords don't match")
                return
            }
            
            ActivityIndicator.shared.showActivityIndicator(on: self.view, withAlpha: 0.5)
            
            let updatePasswordData = UpdatePasswordData(password: password, passwordConfirmation: passwordConfirmation, currentPassword: currentPassword)
            viewModel = UpdatePasswordViewModel(updationData: updatePasswordData)
            viewModel.$updatePasswordResponse.sink {
                updatePasswordResponse in
                
                if !updatePasswordResponse.message.isEmpty {
                    pushViewController(TabBarViewController.self, fromStoryboard: "Main", navigationController: self.navigationController)
                }
            }
            .store(in: &viewModel.cancellables)
        }
    }
}
