//
//  SetOfNudgeCardsViewController.swift
//  MockupMC3
//
//  Created by Jesse Joseph on 22/08/19.
//  Copyright © 2019 Jesse Joseph. All rights reserved.
//

import UIKit

class SetOfNudgeCardsViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "perkenalanSegue"{
            let destVc = segue.destination as! RecordViewController
            destVc.indicatorString = "perkenalan"
        }else if segue.identifier == "mengajakSegue"{
            let destVc = segue.destination as! RecordViewController
            destVc.indicatorString = "mengajak"
        }else if segue.identifier == "reviewSegue"{
            let destVc = segue.destination as! RecordViewController
            destVc.indicatorString = "review"
        }
            
    }
    
    
    @IBAction func latihanButtonPressed(_ sender: Any) {
        if self.restorationIdentifier == "2"{
            performSegue(withIdentifier: "perkenalanSegue", sender: self)
        }else if self.restorationIdentifier == "3"{
            performSegue(withIdentifier: "mengajakSegue", sender: self)
        }else if self.restorationIdentifier == "5"{
            performSegue(withIdentifier: "reviewSegue", sender: self)
        }
    }
    
}
