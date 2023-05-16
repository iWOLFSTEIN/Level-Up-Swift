//
//  DoTodayTableViewBasicTasksCell.swift
//  Demo App 2
//
//  Created by BrainX Technologies on 16/05/2023.
//

import UIKit

class DoTodayTableViewBasicTasksCell: UITableViewCell {
    
    @IBOutlet weak var taskTile: BasicTaskTile!

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        self.addSubview(taskTile)
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
