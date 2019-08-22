//
//  Rehearsal1ViewController.swift
//  MockupMC3
//
//  Created by Jesse Joseph on 21/08/19.
//  Copyright © 2019 Jesse Joseph. All rights reserved.
//

import UIKit
import AVKit

class Rehearsal1ViewController: UIViewController {
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    

    @IBAction func exitModalRehearsal1(_ sender: Any) {
        dismiss(animated: true, completion: nil)
    }
    
    @IBAction func play(_ sender: Any) {
        if let path = Bundle.main.path(forResource: "A", ofType: "MOV") {
            let video = AVPlayer(url : URL(fileURLWithPath : path))
            let videoPlayer = AVPlayerViewController()
            videoPlayer.player = video
            present(videoPlayer,animated: true,completion: {video.play()})
        }
    }

}
