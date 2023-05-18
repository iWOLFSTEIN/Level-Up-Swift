import UIKit

class ActivityIndicator {
    static let shared = ActivityIndicator()
    
    private var activityIndicatorView: UIView?
    
    func showActivityIndicator(on view: UIView) {
        activityIndicatorView = UIView(frame: view.bounds)
        activityIndicatorView?.backgroundColor = UIColor(white: 1.0, alpha: 0.5)
        
        let activityIndicator = UIActivityIndicatorView(style: .large)
        activityIndicator.center = activityIndicatorView!.center
        activityIndicator.startAnimating()
        
        activityIndicatorView?.addSubview(activityIndicator)
        view.addSubview(activityIndicatorView!)
    }
    
    func hideActivityIndicator() {
        activityIndicatorView?.removeFromSuperview()
        activityIndicatorView = nil
    }
}
