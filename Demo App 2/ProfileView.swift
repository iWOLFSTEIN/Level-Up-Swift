//
//  ProfileView.swift
//  Demo App 2
//
//  Created by BrainX Technologies on 16/05/2023.
//

import UIKit

class ProfileView: UIView {


//    @IBOutlet weak var mytile: HomeTile!
    @IBOutlet weak var titleLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        titleLabel.font = .systemFont(ofSize: 17)
//        mytile.label 
    }
    
}
