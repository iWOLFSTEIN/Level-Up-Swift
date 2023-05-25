import UIKit

class UpdatePasswordViewController: UIViewController {
    
    @IBOutlet var contentView: UpdatePasswordContentView!
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
            ActivityIndicator.shared.showActivityIndicator(on: self.view, withAlpha: 0.5)
            
            let currentPassword = "123456"
            let password = password.isEmpty ? "123456" : password
            let passwordConfirmation = passwordConfirmation.isEmpty ? "123456" : passwordConfirmation
            let updatePasswordData = UpdatePasswordData(password: password, passwordConfirmation: passwordConfirmation, currentPassword: currentPassword)
            let updatePasswordViewModel = UpdatePasswordViewModel(updationData: updatePasswordData)
            
            updatePasswordViewModel.bind = {
                let updatePasswordResponse = updatePasswordViewModel.updatePasswordResponse
                
                if !updatePasswordResponse.message.isEmpty {
                    let storyboard = UIStoryboard(name: "Main", bundle: nil)
                    let destinationVC = storyboard.instantiateViewController(withIdentifier: "TabBarViewController") as! UITabBarController
                    self.navigationController?.pushViewController(destinationVC, animated: true)
                }
            }
        }
    }
}
