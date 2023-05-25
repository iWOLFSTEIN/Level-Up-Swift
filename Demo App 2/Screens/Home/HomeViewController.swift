import UIKit

class HomeViewController: UIViewController {
    
    @IBOutlet weak var doTodayView: UIView!
    @IBOutlet weak var activitiesAndTipsView: UIView!
    @IBOutlet weak var trackItView: UIView!
    @IBOutlet weak var eventsView: UIView!
    @IBOutlet weak var trainingView: UIView!
    @IBOutlet weak var sayAndShareView: UIView!
    @IBOutlet weak var quoteView: UIView!
    @IBOutlet weak var quoteAutherLabel: UILabel!
    @IBOutlet weak var quoteTextLabel: UILabel!
    
    let viewModel = HomeViewModel()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        updateQuote()
        
        doTodayView.layer.cornerRadius = 12
        activitiesAndTipsView.layer.cornerRadius = 12
        trackItView.layer.cornerRadius = 12
        eventsView.layer.cornerRadius = 12
        trainingView.layer.cornerRadius = 12
        sayAndShareView.layer.cornerRadius = 12
        quoteView.layer.cornerRadius = 20
        
        addTapGestureToView(doTodayView, identifier: "DoTodayViewController")
        addTapGestureToView(trackItView, identifier: "TrackItViewController")
        
    }
    
    private func addTapGestureToView(_ view: UIView, identifier: String) {
        let tapGesture = UITapGestureRecognizer(target: self, action: #selector(goToScreen(_:)))
        view.isUserInteractionEnabled = true
        view.addGestureRecognizer(tapGesture)
        view.accessibilityIdentifier = identifier
    }
    
    @objc func goToScreen(_ gesture: UITapGestureRecognizer) {
        guard let view = gesture.view, let identifier = view.accessibilityIdentifier else { return }
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        let destinationVC = storyboard.instantiateViewController(withIdentifier: identifier)
        navigationController?.pushViewController(destinationVC, animated: true)
    }
    
    func updateQuote() {
        DispatchQueue.main.async {
            ActivityIndicator.shared.showActivityIndicator(on: self.view, withAlpha: 1.0)
        }
               
        viewModel.bind = {
            guard let quote = self.viewModel.quote else {
                DispatchQueue.main.async {
                    ActivityIndicator.shared.hideActivityIndicator()
                }
                return
            }
            DispatchQueue.main.async {
                self.quoteAutherLabel.text = quote.author
                self.quoteTextLabel.text = quote.text
                ActivityIndicator.shared.hideActivityIndicator()
            }
        }
    }
}

