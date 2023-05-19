import SVGKit
import UIKit

class LoginViewController: UIViewController {
    
    @IBOutlet weak var appLogo: UIImageView!
    @IBOutlet weak var usernameTextFieldView: UIView!
    @IBOutlet weak var passwordTextFieldView: UIView!
    @IBOutlet weak var companyLogo: UIImageView!
    @IBOutlet weak var loginButton: UIButton!
    @IBOutlet weak var usernameTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!
        
    override func viewDidLoad() {
        super.viewDidLoad()
        
        usernameTextFieldView.layer.cornerRadius = 10
        usernameTextFieldView.layer.borderWidth = 1
        usernameTextFieldView.layer.borderColor = UIColor(named: "textFieldBorder")?.cgColor
        
        passwordTextFieldView.layer.cornerRadius = 10
        passwordTextFieldView.layer.borderWidth = 1
        passwordTextFieldView.layer.borderColor = UIColor(named: "textFieldBorder")?.cgColor
        
        usernameTextField.borderStyle = .none
        passwordTextField.borderStyle = .none
        
        let passwordTextFieldTrailingIcon = UIImageView(image: UIImage(named: "eye"))
        passwordTextField.rightView = passwordTextFieldTrailingIcon
        passwordTextField.rightViewMode = .always
        passwordTextField.isSecureTextEntry = true
        let trailingIconTapGesture = UITapGestureRecognizer(target: self, action: #selector(togglePasswordVisibility))
        passwordTextFieldTrailingIcon.isUserInteractionEnabled = true
        passwordTextFieldTrailingIcon.addGestureRecognizer(trailingIconTapGesture)
        
        loginButton.layer.cornerRadius = 10
        let currentFont = loginButton.titleLabel?.font
        let boldFont = UIFont.boldSystemFont(ofSize: currentFont?.pointSize ?? 16)
        loginButton.titleLabel?.font = boldFont
        navigationController?.navigationBar.isHidden = true
        
    }
    
    @IBAction func login( _ sender: UIButton) {
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        
        if let username = usernameTextField.text, let password = passwordTextField.text {
            
            ActivityIndicator.shared.showActivityIndicator(on: self.view, withAlpha: 0.5)
            
            let email = username.isEmpty ? "agent_0@mailinator.com" : username
            let password = password.isEmpty ? "123456" : password
            let loginViewModel = LoginViewModel(email: email, password: password)
            
            loginViewModel.bind = {
                let user = loginViewModel.user
                let responseHeaders = loginViewModel.headers
                print(user)
                print(responseHeaders)
                
                if user == .NewUser {
                    let destinationVC = storyboard.instantiateViewController(withIdentifier: "UpdatePasswordViewController") as! UpdatePasswordViewController
                    self.navigationController?.pushViewController(destinationVC, animated: true)
                }
                else if user == .ExistingUser {
                    let destinationVC  = storyboard.instantiateViewController(withIdentifier: "TabBarViewController") as! TabBarViewController
                    print("Printing content type in login screen \(responseHeaders.contentType)")
                    destinationVC.responseHeaders = responseHeaders
                    self.navigationController?.pushViewController(destinationVC, animated: true)
                }
                
                DispatchQueue.main.async {
                    ActivityIndicator.shared.hideActivityIndicator()
                }
            }
        }
    }
    
    @objc func togglePasswordVisibility() {
        passwordTextField.isSecureTextEntry.toggle()
    }
    
}



