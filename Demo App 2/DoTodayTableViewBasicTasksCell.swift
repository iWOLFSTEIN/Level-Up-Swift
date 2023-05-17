import UIKit

class DoTodayTableViewBasicTasksCell: UITableViewCell {
    
    @IBOutlet weak var titleLabel: UILabel!
    let basicTaskTileCount = 3
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        let parentUIView = UIView()
        self.contentView.addSubview(parentUIView)
                
        for index in 0..<basicTaskTileCount {
            let basicTaskTile = BasicTaskTile()
            parentUIView.addSubview(basicTaskTile)
            
            basicTaskTile.translatesAutoresizingMaskIntoConstraints = false
            
            if index == 0 {
                NSLayoutConstraint.activate([
                    basicTaskTile.topAnchor.constraint(equalTo: parentUIView.topAnchor, constant: 10),
                    basicTaskTile.leadingAnchor.constraint(equalTo: parentUIView.leadingAnchor),
                    basicTaskTile.trailingAnchor.constraint(equalTo: parentUIView.trailingAnchor)
                ])
            } else {
                let previousBasicTaskTile = parentUIView.subviews[index - 1] as! BasicTaskTile
                
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
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
}
