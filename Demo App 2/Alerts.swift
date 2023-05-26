import Foundation
import UIKit

func showErrorAlert(title: String, message: String) {
    let alertController = UIAlertController(title: title, message: message, preferredStyle: .alert)
    let okAction = UIAlertAction(title: "OK", style: .default, handler: nil)
    alertController.addAction(okAction)
    
    if let rootViewController = UIApplication.shared.keyWindow?.rootViewController {
        rootViewController.present(alertController, animated: true, completion: nil)
    }
}


