import UIKit

class DoTodayTableViewCalendarCell: UITableViewCell {
    
    @IBOutlet weak var bodyView: UIView!
    @IBOutlet weak var headingView: UIView!
    @IBOutlet var weekDayViews: [UIView]!
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        headingView.layer.cornerRadius = 10
        bodyView.layer.cornerRadius = 10
        
        weekDayViews.enumerated().forEach({ (index, view) in
            view.layer.cornerRadius = 17
            view.tag = index
        })
    }
}

