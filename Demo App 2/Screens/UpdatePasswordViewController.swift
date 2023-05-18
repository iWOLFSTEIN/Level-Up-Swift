import UIKit

class UpdatePasswordViewController: UIViewController {

    @IBOutlet var contentView: UpdatePasswordView!
    override func viewDidLoad() {
        super.viewDidLoad()

    }
    
    @IBAction func updatePassword( _ sender: UIButton) {
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        let destinationVC = storyboard.instantiateViewController(withIdentifier: "TabBarViewController") as! UITabBarController
        navigationController?.pushViewController(destinationVC, animated: true)
    }
}
