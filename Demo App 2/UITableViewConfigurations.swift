import UIKit

extension UITableView {
    func dequeue<T: UITableViewCell>(for indexPath: IndexPath) -> T {
        let identifier = T.reusableCellIdentifier
        let cell = dequeueReusableCell(withIdentifier: identifier, for: indexPath)
        return cell as! T
    }
}

extension UITableViewCell {
    static var nibName: String {
        return String(describing: self)
    }
    static var reusableCellIdentifier: String {
        return String(describing: self)
    }
}
