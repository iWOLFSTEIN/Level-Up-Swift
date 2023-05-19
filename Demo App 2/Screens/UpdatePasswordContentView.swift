//
//  UpdatePasswordView.swift
//  Demo App 2
//
//  Created by BrainX Technologies on 18/05/2023.
//

import UIKit

class UpdatePasswordContentView: UIView {
    
    @IBOutlet weak var passwordTextFieldView: UIView!
    @IBOutlet weak var confirmPasswordTextFieldView: UIView!
    @IBOutlet weak var passwordTextField: UITextField!
    @IBOutlet weak var confirmPasswordTextField: UITextField!
    @IBOutlet weak var updateButton: UIButton!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        passwordTextFieldView.layer.cornerRadius = 10
        passwordTextFieldView.layer.borderWidth = 1
        passwordTextFieldView.layer.borderColor = UIColor(named: "textFieldBorder")?.cgColor
        
        confirmPasswordTextFieldView.layer.cornerRadius = 10
        confirmPasswordTextFieldView.layer.borderWidth = 1
        confirmPasswordTextFieldView.layer.borderColor = UIColor(named: "textFieldBorder")?.cgColor
        
        passwordTextField.borderStyle = .none
        confirmPasswordTextField.borderStyle = .none
        
        updateButton.layer.cornerRadius = 10
        let currentFont = updateButton.titleLabel?.font
        let boldFont = UIFont.boldSystemFont(ofSize: currentFont?.pointSize ?? 16)
        updateButton.titleLabel?.font = boldFont
    }
}
