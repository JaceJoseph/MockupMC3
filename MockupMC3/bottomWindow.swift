//
//  bottomWindow.swift
//  MockupMC3
//
//  Created by Jesse Joseph on 20/08/19.
//  Copyright © 2019 Jesse Joseph. All rights reserved.
//

import UIKit

class bottomWindow: UIView {
    
    override func awakeFromNib() {
        super .awakeFromNib()
        
        self.layer.borderColor = UIColor.init(red: 42/255, green: 74/255, blue: 75/255, alpha: 1) .cgColor
        self.layer.borderWidth = 2
        self.layer.cornerRadius = 10
    }
    /*
    // Only override draw() if you perform custom drawing.
    // An empty implementation adversely affects performance during animation.
    override func draw(_ rect: CGRect) {
        // Drawing code
    }
    */

}
