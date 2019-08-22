//
//  ViewController.swift
//  MockupMC3
//
//  Created by Jesse Joseph on 20/08/19.
//  Copyright © 2019 Jesse Joseph. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet var overridingView: UIView!
    @IBOutlet weak var mainBottomView: bottomWindow!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    
    
    @IBAction func overrideMainWindow(_ sender: Any) {
        UIView.animate(withDuration: 0.42, animations: {
            self.mainBottomView.transform = CGAffineTransform(translationX: 0, y: 350)
        }, completion: nil)
        
        UIView.animate(withDuration: 0.5, animations: {
            self.overridingView.isHidden = false
            self.overridingView.transform = CGAffineTransform(translationX: 0, y: -200)
        }, completion: nil)
    }
    

}

