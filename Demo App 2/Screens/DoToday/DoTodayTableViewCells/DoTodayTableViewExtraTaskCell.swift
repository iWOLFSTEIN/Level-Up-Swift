//
//  DoTodayTableViewExtraTaskCell.swift
//  Demo App 2
//
//  Created by BrainX Technologies on 17/05/2023.
//

import UIKit

class DoTodayTableViewExtraTaskCell: UITableViewCell {
    
    @IBOutlet weak var titleLabel: UILabel!
    let basicTaskTileCount = 3
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        let parentUIView = UIView()
        parentUIView.backgroundColor = .clear
        self.contentView.addSubview(parentUIView)
        
        for index in 0..<basicTaskTileCount {
            let basicTaskTile = TaskTile()
            if index % 2 == 0 {
                basicTaskTile.stylingView.applyGradient(colors: ["stylingTaskTilesBlue", "stylingTaskTilesLightBlue"], startPoint: CGPoint(x: 0.5, y: 0), endPoint: CGPoint(x: 0.5, y: 1))
            }
            else {
                basicTaskTile.stylingView.applyGradient(colors: ["stylingTaskTilesOrange", "stylingTaskTilesLightOrange"], startPoint: CGPoint(x: 0.5, y: 0), endPoint: CGPoint(x: 0.5, y: 1))
            }
            basicTaskTile.subviews.first!.layer.cornerRadius = 6
            basicTaskTile.stylingView.applyCornerRadius(cornerRadius: 6, corners: [.topLeft, .bottomLeft])
            
            parentUIView.addSubview(basicTaskTile)
            
            basicTaskTile.translatesAutoresizingMaskIntoConstraints = false
            
            if index == 0 {
                NSLayoutConstraint.activate([
                    basicTaskTile.topAnchor.constraint(equalTo: parentUIView.topAnchor, constant: 10),
                    basicTaskTile.leadingAnchor.constraint(equalTo: parentUIView.leadingAnchor),
                    basicTaskTile.trailingAnchor.constraint(equalTo: parentUIView.trailingAnchor)
                ])
            } else {
                let previousBasicTaskTile = parentUIView.subviews[index - 1] as! TaskTile
                
                NSLayoutConstraint.activate([
                    basicTaskTile.topAnchor.constraint(equalTo: previousBasicTaskTile.bottomAnchor, constant: 10),
                    basicTaskTile.leadingAnchor.constraint(equalTo: parentUIView.leadingAnchor),
                    basicTaskTile.trailingAnchor.constraint(equalTo: parentUIView.trailingAnchor)
                ])
            }
        }
        
        parentUIView.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            parentUIView.topAnchor.constraint(equalTo: self.contentView.topAnchor, constant: titleLabel.bounds.height),
            parentUIView.leadingAnchor.constraint(equalTo: self.contentView.leadingAnchor),
            parentUIView.trailingAnchor.constraint(equalTo: self.contentView.trailingAnchor),
            parentUIView.bottomAnchor.constraint(equalTo: self.contentView.bottomAnchor)
        ])
        
        let bottomView = UIView(frame: CGRect(x: 0, y: 0, width: self.bounds.width, height: 20))
        bottomView.backgroundColor = .orange
        self.contentView.addSubview(bottomView)
        
        bottomView.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            bottomView.topAnchor.constraint(equalTo: parentUIView.bottomAnchor)
        ])
    }
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        
    }
    
}
