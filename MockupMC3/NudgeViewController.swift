//
//  NudgeViewController.swift
//  MockupMC3
//
//  Created by Jesse Joseph on 20/08/19.
//  Copyright © 2019 Jesse Joseph. All rights reserved.
//

import UIKit

class NudgeViewController: UIViewController {

    @IBOutlet weak var pageNudge: UIView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        pageNudge.layer.cornerRadius = 10
        
        pageNudge.layer.shadowColor = UIColor.gray.cgColor
        pageNudge.layer.shadowOpacity = 1
        pageNudge.layer.shadowOffset = .zero
        pageNudge.layer.shadowRadius = 10
        
        pageNudge.layer.shadowPath = UIBezierPath(rect: pageNudge.bounds).cgPath
        pageNudge.layer.shouldRasterize = true

    }
}
