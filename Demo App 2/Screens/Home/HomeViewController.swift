//
//  HomeViewController.swift
//  Demo App 2
//
//  Created by BrainX Technologies on 11/05/2023.
//

import UIKit

class HomeViewController: UIViewController {
    
    @IBOutlet weak var doTodayView: UIView!
    @IBOutlet weak var activitiesAndTipsView: UIView!
    @IBOutlet weak var trackItView: UIView!
    @IBOutlet weak var eventsView: UIView!
    @IBOutlet weak var trainingView: UIView!
    @IBOutlet weak var sayAndShareView: UIView!
    @IBOutlet weak var quoteView: UIView!

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        doTodayView.layer.cornerRadius = 12
        activitiesAndTipsView.layer.cornerRadius = 12
        trackItView.layer.cornerRadius = 12
        eventsView.layer.cornerRadius = 12
        trainingView.layer.cornerRadius = 12
        sayAndShareView.layer.cornerRadius = 12
        quoteView.layer.cornerRadius = 20
        
        let doTodayTapGesture = UITapGestureRecognizer(target: self, action: #selector(goToDoTodayScreen(_:)))
        doTodayView.isUserInteractionEnabled = true
        doTodayView.addGestureRecognizer(doTodayTapGesture)
        
    }
    
    @objc func goToDoTodayScreen(_ gesture: UITapGestureRecognizer) {
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        let destinationVC = storyboard.instantiateViewController(withIdentifier: "DoTodayViewController") as! DoTodayViewController
        navigationController?.pushViewController(destinationVC, animated: true)
    }
}
