import UIKit

class TabBarViewController: UITabBarController {
    
    let blueBarView = UIView()
    var responseHeaders: ResponseHeaders!
    
    override func viewDidLoad() {
        super.viewDidLoad()
                        
        blueBarView.backgroundColor = UIColor(named: "tabBarIndicator")
        blueBarView.translatesAutoresizingMaskIntoConstraints = false
        tabBar.addSubview(blueBarView)
        
        blueBarView.heightAnchor.constraint(equalToConstant: 2).isActive = true
        blueBarView.widthAnchor.constraint(
            equalTo: tabBar.widthAnchor,
            multiplier: 1/CGFloat(tabBar.items!.count)
        ).isActive = true
        blueBarView.centerXAnchor.constraint(equalTo: tabBar.leadingAnchor, constant: tabBar.frame.width/CGFloat(tabBar.items!.count*2)).isActive = true
        blueBarView.bottomAnchor.constraint(equalTo: tabBar.topAnchor).isActive = true
    }
    
    override func tabBar(_ tabBar: UITabBar, didSelect item: UITabBarItem) {
        let index = tabBar.items!.firstIndex(of: item)!
        let constant = CGFloat(index) * tabBar.frame.width / CGFloat(tabBar.items!.count)
        UIView.animate(withDuration: 0.3) {
            self.blueBarView.frame.origin.x = constant
        }
    }
}
