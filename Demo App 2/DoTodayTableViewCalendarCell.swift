//
//  DoTodayTableViewCalendarCell.swift
//  Demo App 2
//
//  Created by BrainX Technologies on 16/05/2023.
//

import UIKit

class DoTodayTableViewCalendarCell: UITableViewCell {

    @IBOutlet weak var weekDay7View: UIView!
    @IBOutlet weak var weekDay6View: UIView!
    @IBOutlet weak var weekDay5View: UIView!
    @IBOutlet weak var weekDay4View: UIView!
    @IBOutlet weak var weekDay3View: UIView!
    @IBOutlet weak var weekDay2View: UIView!
    @IBOutlet weak var weekDay1View: UIView!
    @IBOutlet weak var bodyView: UIView!
    @IBOutlet weak var headingView: UIView!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
        headingView.layer.cornerRadius = 10
        bodyView.layer.cornerRadius = 10
        
        weekDay1View.layer.cornerRadius = 17
        weekDay2View.layer.cornerRadius = 17
        weekDay3View.layer.cornerRadius = 17
        weekDay4View.layer.cornerRadius = 17
        weekDay5View.layer.cornerRadius = 17
        weekDay6View.layer.cornerRadius = 17
        weekDay7View.layer.cornerRadius = 17
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
