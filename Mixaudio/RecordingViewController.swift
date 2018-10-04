//
//  RecordingViewController.swift
//  Mixaudio
//
//  Created by Naelah on 03/05/2018.
//  Copyright © 2018 Arche Information. All rights reserved.
//

import UIKit
import AVFoundation



class RecordingViewController: UIViewController {
   
    var audioPlayer : AVAudioPlayer! = nil
    var song:Song?

    
    @IBOutlet weak var musicTitle: UILabel!
    @IBOutlet weak var recordingLabel: UILabel!
    @IBOutlet weak var timerLabel: UILabel!
    @IBOutlet weak var recordingDots: UIButton!
    @IBOutlet weak var recordingEmpty: UIButton!
    
    @IBAction func recordingButton(_ sender: Any) {
        
        let url = Bundle.main.url(forResource: song?.title, withExtension: ".mp3")
        do{
            
            recordingDots.isHidden = true
            recordingEmpty.isHidden = false
            
            audioPlayer = try AVAudioPlayer(contentsOf: url!)
            audioPlayer.prepareToPlay()
            audioPlayer.play()
            print("playing ")
            
        }catch{ print(error) }
        
    }
    @IBAction func recordingPause(_ sender: Any) {
        
        recordingDots.isHidden = false
        recordingEmpty.isHidden = true
        
    }
    override func viewDidLoad() {
        super.viewDidLoad()

        musicTitle.text = song?.title
        recordingDots.isHidden = false
        
    }
    @IBAction func doneRecording(_ sender: Any) {
        
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
