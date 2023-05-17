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

extension UIView {
    func applyCornerRadius(cornerRadius: CGFloat, corners: UIRectCorner) {
        let maskPath = UIBezierPath(roundedRect: bounds,
                                    byRoundingCorners: corners,
                                    cornerRadii: CGSize(width: cornerRadius, height: cornerRadius))
        
        let shape = CAShapeLayer()
        shape.path = maskPath.cgPath
        layer.mask = shape
    }
    
    func applyGradient(colors: [String], startPoint: CGPoint, endPoint: CGPoint) {
        let gradientLayer = CAGradientLayer()
        gradientLayer.frame = bounds
        gradientLayer.colors = colors.compactMap { UIColor(named: $0)?.cgColor }
        gradientLayer.startPoint = startPoint
        gradientLayer.endPoint = endPoint
        
        layer.insertSublayer(gradientLayer, at: 0)
    }
}
