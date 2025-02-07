//
//  PlaySoundsViewController.swift
//  PitchPerfect
//
//  Created by Dev Kumar on 3/19/24.
//

import UIKit
import AVFoundation
class PlaySoundsViewController: UIViewController {
    @IBOutlet weak var slowButton: UIButton!
    @IBOutlet weak var highpitchButton: UIButton!
    @IBOutlet weak var fastButton: UIButton!
    @IBOutlet weak var lowpitchButton: UIButton!
    @IBOutlet weak var echoButton: UIButton!
    @IBOutlet weak var reverbButton: UIButton!
    @IBOutlet weak var stopButton: UIButton!
    var recordedAudioURL : URL!
    var audioFile:AVAudioFile!
    var audioEngine:AVAudioEngine!
    var audioPlayerNode: AVAudioPlayerNode!
    var stopTimer: Timer!

    enum ButtonType: Int {
        case slow = 0, fast=1, chipmunk=2, vader=3, echo=4, reverb=5
    }
    @IBAction func playSoundForButton (_ sender : UIButton){
        switch(ButtonType(rawValue: sender.tag)!) {
        case .slow:
            playSound(rate: 0.5)
        case .fast:
            playSound(rate: 1.5)
        case .chipmunk:
            playSound(pitch: 1000)
        case .vader:
            playSound(pitch: -1000)
        case .echo:
            playSound(echo: true)
        case .reverb:
            playSound(reverb: true)
        }
        
        configureUI(.playing)
    }
    @IBAction func stopButtonPressed (_ sender : AnyObject){
        stopAudio()
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        setupAudio();
        // Do any additional setup after loading the view.
    }
    override func viewWillAppear(_ animated:Bool) {
        super.viewWillAppear(animated)
        configureUI(.notPlaying)
        
        // Do any additional setup after loading the view.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
