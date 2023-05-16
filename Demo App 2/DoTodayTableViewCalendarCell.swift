//
//  DoTodayTableViewCalendarCell.swift
//  Demo App 2
//
//  Created by BrainX Technologies on 16/05/2023.
//

import UIKit

class DoTodayTableViewCalendarCell: UITableViewCell {

    @IBOutlet weak var bodyView: UIView!
    @IBOutlet weak var headingView: UIView!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
        headingView.layer.cornerRadius = 6
        bodyView.layer.cornerRadius = 6
    }
    
}

extension DoTodayTableViewCalendarCell {
    static var nibName: String {
        return String(describing: self)
    }
    static var reusableCellIdentifier: String {
        return String(describing: self)
    }
}
