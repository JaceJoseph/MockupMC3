//
//  RecordingViewController.swift
//  MockupMC3
//
//  Created by Arief Shaifullah Akbar on 23/08/19.
//  Copyright © 2019 Jesse Joseph. All rights reserved.
//

import UIKit
import AVKit

class RecordingViewController: UIViewController {
    var waveformView:SCSiriWaveformView!
    var recorder:AVAudioRecorder!
    var recordingSession: AVAudioSession!

    override func viewDidLoad() {
        super.viewDidLoad()
        
        let bounds = UIScreen.main.bounds
        
        waveformView = SCSiriWaveformView(frame: CGRect(x: 0, y: 0, width: bounds.width, height: bounds.height))
        waveformView.waveColor = #colorLiteral(red: 0.3411764801, green: 0.6235294342, blue: 0.1686274558, alpha: 1)
        waveformView.primaryWaveLineWidth = 3.0
        waveformView.secondaryWaveLineWidth = 1.0
        waveformView.backgroundColor = .clear
        self.view.addSubview(waveformView)
        
        var url:NSURL = NSURL(fileURLWithPath: "/dev/null")
        var settings:NSDictionary = [
            AVSampleRateKey: 44100.0,
            AVFormatIDKey: kAudioFormatAppleLossless,
            AVNumberOfChannelsKey: 2,
            AVEncoderAudioQualityKey: AVAudioQuality.min.rawValue
        ]
        
        do {
            try recorder = AVAudioRecorder(url: url as URL, settings: settings as! [String : Any])
        } catch {
            print(error)
        }
        
        recordingSession = AVAudioSession.sharedInstance()

        do {
            try recordingSession.setCategory(.playAndRecord, mode: .default)
            
        } catch {
            print(error)
        }
        
        recorder.prepareToRecord()
        recorder.isMeteringEnabled = true
        recorder.record()
        
        let displayLink:CADisplayLink = CADisplayLink(target: self, selector: #selector(AVAudioPlayer.updateMeters))
        displayLink.add(to: RunLoop.current, forMode: RunLoop.Mode.common)
    }
    
    @objc func updateMeters() {
        recorder.updateMeters()
        let normalizedValue:CGFloat = pow(10, CGFloat(recorder.averagePower(forChannel: 0))/20)
        waveformView.update(withLevel: normalizedValue)
    }
}
