//
//  NotificationTableViewCell.swift
//  Demo App 2
//
//  Created by BrainX Technologies on 12/05/2023.
//

import UIKit

class NotificationTableViewCell: UITableViewCell {
    
    @IBOutlet weak var dotSeparaterView: UIView!
    @IBOutlet weak var notificationIndicatorDotView: UIView!

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        
        self.contentView.layer.cornerRadius = 12
        
        dotSeparaterView.layer.cornerRadius = 2
        notificationIndicatorDotView.layer.cornerRadius = 5
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
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
