//
//  RoundedButtons.swift
//  MockupMC3
//
//  Created by Jesse Joseph on 22/08/19.
//  Copyright © 2019 Jesse Joseph. All rights reserved.
//

import UIKit

class RoundedButtons: UIButton {

    override func awakeFromNib() {
        super.awakeFromNib()
        layer.cornerRadius = 25
    }

}
