//
//  SettingsViewController.swift
//  Demo App 2
//
//  Created by BrainX Technologies on 15/05/2023.
//

import UIKit

class SettingsViewController: UIViewController {
    
    @IBOutlet weak var profileOuterView: UIView!
    @IBOutlet weak var changePasswordOuterView: UIView!
    @IBOutlet weak var coachingPlansOuterView: UIView!
    @IBOutlet weak var contactUsOuterView: UIView!
    @IBOutlet weak var privacyPolicyView: UIView!
    @IBOutlet weak var faqsOuterView: UIView!
    @IBOutlet weak var logoutButtonView: UIView!

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        profileOuterView.layer.cornerRadius = 12
        changePasswordOuterView.layer.cornerRadius = 12
        coachingPlansOuterView.layer.cornerRadius = 12
        contactUsOuterView.layer.cornerRadius = 12
        privacyPolicyView.layer.cornerRadius = 12
        faqsOuterView.layer.cornerRadius = 12
        logoutButtonView.layer.cornerRadius = 12
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
