//
//  DoTodayTableViewBasicTasksCell.swift
//  Demo App 2
//
//  Created by BrainX Technologies on 16/05/2023.
//

import UIKit

class DoTodayTableViewBasicTasksCell: UITableViewCell {
    
    @IBOutlet private weak var basicTaskTileContainerView: BasicTaskTile!

    override func awakeFromNib() {
        super.awakeFromNib()
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

    }
    
}
