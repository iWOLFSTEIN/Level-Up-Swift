//
//  HomeTile.swift
//  Demo App 2
//
//  Created by BrainX Technologies on 16/05/2023.
//

import UIKit

class HomeTile: UIView {
    
    @IBOutlet weak var label: UILabel!
    
    override init(frame: CGRect) {
        super.init(frame: frame)
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
    }
    
    func setupOnLoad() {
        
        let content = Bundle.main.loadNibNamed(String(describing: Self.self), owner: self)
        
        
    }

}
