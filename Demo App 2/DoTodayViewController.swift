//
//  DoTodayViewController.swift
//  Demo App 2
//
//  Created by BrainX Technologies on 15/05/2023.
//

import UIKit

class DoTodayViewController: UIViewController {
    
    @IBOutlet weak var backButtonView: UIView!

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        let backButtonTapGesture = UITapGestureRecognizer(target: self, action: #selector(goBackToPreviousScreen(_:)))
        backButtonView.isUserInteractionEnabled = true
        backButtonView.addGestureRecognizer(backButtonTapGesture)
    }
    
    @objc func goBackToPreviousScreen(_ gesture: UITapGestureRecognizer) {
        navigationController?.popViewController(animated: true)
    }
}
