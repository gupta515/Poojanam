//
//  PoojaDetailsViewController.swift
//  Poojanam
//
//  Created by Gupta on 11/09/16.
//  Copyright © 2016 Gupta. All rights reserved.
//

import UIKit
import FirebaseStorage
import AVFoundation

class PoojaDetailsViewController: UIViewController, AVAudioPlayerDelegate {
    
    @IBOutlet weak var swapButtonOptionsView: UIView!
    @IBOutlet weak var poojaSamagriBtn: UIButton!
    @IBOutlet weak var poojaVidhiBtn: UIButton!
    
    @IBOutlet weak var poojaSamagriView: UIView!
    @IBOutlet weak var poojaSamagriTextView: UITextView!
    @IBOutlet weak var poojaVidhiView: UIView!
    
    @IBOutlet weak var poojaAudioCtlrTopView: UIView!
    @IBOutlet weak var poojaAudioTopProgressBar: UIProgressView!
    @IBOutlet weak var poojaAudioProgressLabel: UILabel!
    @IBOutlet weak var poojaAudioTopCtlrBtn: UIButton!
    
    @IBOutlet weak var poojaVidhiTextView: UITextView!
    
    @IBOutlet weak var poojaAudioCtlrBottomView: UIView!
    @IBOutlet weak var poojaAudioBottomProgressLabel: UILabel!
    @IBOutlet weak var poojaAudioBottomProgressBar: UIProgressView!
    @IBOutlet weak var poojaAudioLabel: UILabel!
    @IBOutlet weak var poojaAudioBottomCtlrBtn: UIButton!
    
    var poojaName : String = ""
    var isPoojaSamagriActivated : Bool = true
    var audioPlayer = AVAudioPlayer()
    var isAudioPlaying = false
    var audioDuration : Float64 = 0.0
    var updater : CADisplayLink! = nil
    
    let storage = FIRStorage.storage()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        self.navigationController?.removeNavigationBarBorder()
        swapButtonOptionsView.setViewRoundCornerWithBorder(borderWidth: 1, cornerRadius: 5, borderColor: UIColor().appBaseColorSaffaron())
        swapActiveBtn(active: true)
        swapAudioCtlrView(play: isAudioPlaying, setTextView: false)
        
        if let poojaData = poojaDataDicts[poojaName] {
            self.title = poojaData["name"]
            poojaAudioLabel.text = "\(poojaData["name"] ?? "") audio"
            //Set Text info
            poojaVidhiTextView.attributedText = TextFiles().getTextFromFile(fileName: poojaData["vidhi"]!, fileExtension: "rtf")
            poojaVidhiTextView.font = UIFont(name: "NotoSansDevanagari-Regular", size: 42)
            poojaSamagriTextView.attributedText = TextFiles().getTextFromFile(fileName: poojaData["samagri"]!, fileExtension: "rtf")
            
            if let audioPathUrl = Bundle.main.url(forResource: poojaData["audio"], withExtension:".m4a") {
                do {
                    audioPlayer = try AVAudioPlayer(contentsOf: audioPathUrl)
                    audioDuration = getTotalAudioDuration(audioPathUrl: audioPathUrl)
                    
                    updater = CADisplayLink(target: self, selector: #selector(self.trackAudio))
                    updater.frameInterval = 1
                    updater.add(to: RunLoop.current, forMode: RunLoopMode.commonModes)
                } catch {
                    print("Couldn't set audio player")
                }
            }
        }
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        audioPlayer.stop()
    }
    
    func trackAudio() {
        if isAudioPlaying {
            let currentTime = Int(audioPlayer.currentTime)
            let currentTimeStr  = String(format: "%02d", currentTime/60) + ":" + String(format: "%02d", currentTime%60)
            poojaAudioProgressLabel.text = currentTimeStr
            poojaAudioBottomProgressLabel.text = currentTimeStr
            
            poojaAudioTopProgressBar.progress = Float(audioPlayer.currentTime/audioPlayer.duration)
            poojaAudioBottomProgressBar.progress = Float(audioPlayer.currentTime/audioPlayer.duration)
        }
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func poojaSamagriClicked(_ sender: AnyObject) {
        if isPoojaSamagriActivated {
            return
        }
        swapActiveBtn(active: true)
    }
    
    @IBAction func poojaVidhiClicked(_ sender: AnyObject) {
        if !isPoojaSamagriActivated {
            return
        }
        swapActiveBtn(active: false)
    }
    
    @IBAction func poojaTopPlayBtn(_ sender: AnyObject) {
        swapAudioCtlrView(play: !isAudioPlaying, setTextView: true)
        
        if isAudioPlaying {
            audioPlayer.play()
        } else {
            audioPlayer.pause()
        }
        
    }
    
    @IBAction func poojaBottomPlayBtn(_ sender: AnyObject) {
        swapAudioCtlrView(play: !isAudioPlaying, setTextView: true)
        
        if isAudioPlaying {
            audioPlayer.play()
        } else {
            audioPlayer.pause()
        }
    }
    
    //Set View functions
    func swapActiveBtn(active : Bool) {
        isPoojaSamagriActivated = active
        poojaSamagriBtn.swapButtonState(active: isPoojaSamagriActivated)
        poojaVidhiBtn.swapButtonState(active: !isPoojaSamagriActivated)
        
        //Set Corresponding view
        poojaVidhiView.isHidden = true
        poojaSamagriView.isHidden = true
        isPoojaSamagriActivated ? (poojaSamagriView.isHidden = false) : (poojaVidhiView.isHidden = false)
    }
    
    func swapAudioCtlrView(play : Bool, setTextView : Bool) {
        isAudioPlaying = play
        let audioCtlrImage = isAudioPlaying ? UIImage(named: "pause") : UIImage(named : "play")
        if setTextView{
            poojaVidhiTextView.frame.size.height = poojaVidhiView.frame.height - (isAudioPlaying ? 142 : 72)
        }
        poojaAudioTopCtlrBtn.setImage(audioCtlrImage, for: UIControlState.normal)
        poojaAudioCtlrBottomView.isHidden = !isAudioPlaying
        poojaAudioBottomCtlrBtn.setImage(audioCtlrImage, for: UIControlState.normal)
    }
    
    func getTotalAudioDuration(audioPathUrl: URL) -> Float64 {
        return CMTimeGetSeconds(AVURLAsset(url: audioPathUrl).duration)
    }
}
