//
//  TrackItViewController.swift
//  Demo App 2
//
//  Created by BrainX Technologies on 17/05/2023.
//

import UIKit

class TrackItViewController: UIViewController {
    
    @IBOutlet weak var addProgressButtonView: UIButton!
    @IBOutlet weak var bodyView: UIView!
    @IBOutlet weak var trackContainerBottom: TrackItContainer!
    @IBOutlet weak var trackContainerMiddle: TrackItContainer!
    @IBOutlet weak var trackContainerTop: TrackItContainer!
    @IBOutlet weak var backButtonView: UIView!
        
    override func viewDidLoad() {
        super.viewDidLoad()
                
        let backButtonTapGesture = UITapGestureRecognizer(target: self, action: #selector(goBackToPreviousScreen(_:)))
        backButtonView.isUserInteractionEnabled = true
        backButtonView.addGestureRecognizer(backButtonTapGesture)
        
        addProgressButtonView.layer.cornerRadius = 6
        addProgressButtonView.titleLabel?.font = UIFont.systemFont(ofSize: 16, weight: .medium)
        
        trackContainerTop.layer.cornerRadius = 12
        trackContainerMiddle.layer.cornerRadius = 12
        trackContainerBottom.layer.cornerRadius = 12
        trackContainerTop.layer.masksToBounds = true
        trackContainerMiddle.layer.masksToBounds = true
        trackContainerBottom.layer.masksToBounds = true
        
        let startPoint = CGPoint(x: 0.5, y: 0)
        let endPoint = CGPoint(x: 0.5, y: 1)
        
        DispatchQueue.main.async {
            self.trackContainerTop.applyGradient(colors: ["stylingTaskTilesLightBlue", "stylingTaskTilesBlue"], startPoint: startPoint, endPoint: endPoint)
            self.trackContainerMiddle.applyGradient(colors: ["stylingTaskTilesLightOrange", "stylingTaskTilesOrange"], startPoint: startPoint, endPoint: endPoint)
            self.trackContainerBottom.applyGradient(colors: ["stylingTaskTilesLightBlack", "stylingTaskTilesBlack"], startPoint: startPoint, endPoint: endPoint)
        }
    }
    
    @objc func goBackToPreviousScreen(_ gesture: UITapGestureRecognizer) {
        navigationController?.popViewController(animated: true)
    }
}
