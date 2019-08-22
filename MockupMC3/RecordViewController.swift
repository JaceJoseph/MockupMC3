//
//  RecordViewController.swift
//  MockupMC3
//
//  Created by Jesse Joseph on 22/08/19.
//  Copyright © 2019 Jesse Joseph. All rights reserved.
//

import UIKit
import AVFoundation

func getDocumentsDirectory() -> URL {
    let paths = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask)
    return paths[0]
}

class RecordViewController: UIViewController {
    @IBOutlet var recordButton: UIButton!
    @IBOutlet var playButton: UIButton!
    @IBOutlet weak var recordBackView: UIView!
    @IBOutlet weak var indicatorLabel: UILabel!
    
    var recordingSession: AVAudioSession!
    var audioRecorder: AVAudioRecorder!
    var audioPlayer: AVAudioPlayer!
    
    lazy var pulse=Pulsing(numberOfPulses: Float.infinity, radius: 200, position:recordBackView.center)
    
    var indicatorString:String?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        recordBackView.layer.cornerRadius = self.recordBackView.frame.height/2
        
        recordingSession = AVAudioSession.sharedInstance()
        
        do {
            try recordingSession.setCategory(.playAndRecord, mode: .default)
            try recordingSession.setActive(true)
            try recordingSession.overrideOutputAudioPort(AVAudioSession.PortOverride.speaker)
            recordingSession.requestRecordPermission { [unowned self] allowed in
                DispatchQueue.main.async {
                    if allowed {
                        self.loadRecordingUI()
                    } else {
                        // failed to record
                    }
                }
            }
        } catch {
            // failed to record!
        }
    }
    
    @IBAction func ExitButton(_ sender: Any) {
        dismiss(animated: true, completion: nil)
    }
    
    func loadRecordingUI() {
        recordButton.isHidden = false
        indicatorLabel.text = indicatorString
//        recordButton.setTitle("Tap to Record", for: .normal)
    }
    
    func addPulse(){
        pulse=Pulsing(numberOfPulses: Float.infinity, radius: 200, position:recordBackView.center)
        pulse.animationDuration = 0.8
        pulse.backgroundColor = UIColor.green.cgColor
        self.view.layer.insertSublayer(pulse, below: recordBackView.layer)
    }
    
    @IBAction func recordButtonPressed(_ sender: UIButton) {
        if audioRecorder == nil {
            startRecording()
            
        } else {
            finishRecording(success: true)
            pulse.removeFromSuperlayer()
        }
    }
    
    @IBAction func playButtonPressed(_ sender: UIButton) {
        if audioPlayer == nil {
            startPlayback()
        } else {
            finishPlayback()
        }
    }
    
    
    // MARK: - Recording
    
    func startRecording() {
        addPulse()
        let audioFilename = getDocumentsDirectory().appendingPathComponent("recording.m4a")
        
        let settings = [
            AVFormatIDKey: Int(kAudioFormatMPEG4AAC),
            AVSampleRateKey: 12000,
            AVNumberOfChannelsKey: 1,
            AVEncoderAudioQualityKey: AVAudioQuality.high.rawValue
        ]
        
        do {
            audioRecorder = try AVAudioRecorder(url: audioFilename, settings: settings)
            audioRecorder.delegate = self
            audioRecorder.record()
            
//            recordButton.setTitle("Tap to Stop", for: .normal)
        } catch {
            finishRecording(success: false)
        }
    }
    
    func finishRecording(success: Bool) {
        audioRecorder.stop()
        audioRecorder = nil
        
        if success {
//            recordButton.setTitle("Tap to Re-record", for: .normal)
            playButton.setTitle("Play Your Recording", for: .normal)
            playButton.isHidden = false
        } else {
//            recordButton.setTitle("Tap to Record", for: .normal)
            playButton.isHidden = true
            // recording failed :(
        }
    }
    
    
    // MARK: - Playback
    
    func startPlayback() {
        let audioFilename = getDocumentsDirectory().appendingPathComponent("recording.m4a")
        do {
            audioPlayer = try AVAudioPlayer(contentsOf: audioFilename)
            audioPlayer.delegate = self
            audioPlayer.play()
            playButton.setTitle("Stop Playback", for: .normal)
        } catch {
            playButton.isHidden = true
            // unable to play recording!
        }
    }
    
    func finishPlayback() {
        audioPlayer = nil
        playButton.setTitle("Play Your Recording", for: .normal)
    }
}

extension RecordViewController : AVAudioRecorderDelegate {
    
    func audioRecorderDidFinishRecording(_ recorder: AVAudioRecorder, successfully flag: Bool) {
        if !flag {
            finishRecording(success: false)
        }
    }
    
}

extension RecordViewController: AVAudioPlayerDelegate {
    
    func audioPlayerDidFinishPlaying(_ player: AVAudioPlayer, successfully flag: Bool) {
        finishPlayback()
    }
    
}
