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

        profileOuterView.layer.cornerRadius = 12
        changePasswordOuterView.layer.cornerRadius = 12
        coachingPlansOuterView.layer.cornerRadius = 12
        contactUsOuterView.layer.cornerRadius = 12
        privacyPolicyView.layer.cornerRadius = 12
        faqsOuterView.layer.cornerRadius = 12
        logoutButtonView.layer.cornerRadius = 12
    }
}
