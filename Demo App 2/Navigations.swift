import Foundation
import UIKit

func pushViewController<T: UIViewController>(_ viewController: T.Type, fromStoryboard storyboardName: String, navigationController: UINavigationController?) {
    let storyboard = UIStoryboard(name: storyboardName, bundle: nil)
    let destinationVC = storyboard.instantiateViewController(withIdentifier: String(describing: T.self)) as! T
    navigationController?.pushViewController(destinationVC, animated: true)
}
