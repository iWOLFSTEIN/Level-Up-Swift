//
//  BasicTaskTile.swift
//  Demo App 2
//
//  Created by BrainX Technologies on 16/05/2023.
//

import UIKit

class BasicTaskTile: UIView {
    
    @IBOutlet weak var checkBoxImageView: UIImageView!
    @IBOutlet weak var title: UILabel!

    override init(frame: CGRect) {
        super.init(frame: frame)
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
    }
    
    private func commonInit() {
        // Load the view from the nib file
        let nib = UINib(nibName: String(describing: Self.self), bundle: nil)
        guard let contentView = nib.instantiate(withOwner: self, options: nil).first as? UIView else {
            fatalError("Could not load BasicTaskTile from nib")
        }
        
        // Add the loaded view as a subview and set its constraints
        contentView.translatesAutoresizingMaskIntoConstraints = false
        addSubview(contentView)
        
        NSLayoutConstraint.activate([
            contentView.leadingAnchor.constraint(equalTo: leadingAnchor),
            contentView.trailingAnchor.constraint(equalTo: trailingAnchor),
            contentView.topAnchor.constraint(equalTo: topAnchor),
            contentView.bottomAnchor.constraint(equalTo: bottomAnchor)
        ])
    }

}
