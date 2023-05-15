//
//  NotificationTableViewCell.swift
//  Demo App 2
//
//  Created by BrainX Technologies on 12/05/2023.
//

import UIKit

class NotificationTableViewCell: UITableViewCell {
    
    @IBOutlet weak var dotSeparaterView: UIView!

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        
        self.contentView.layer.cornerRadius = 12
//        self.contentView.layer.borderWidth = 1
        
        dotSeparaterView.layer.cornerRadius = 2
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}

extension NotificationTableViewCell {
    static var nibName: String {
        return String(describing: self)
    }
    static var reusableCellIdentifier: String {
        return String(describing: self)
    }
}
