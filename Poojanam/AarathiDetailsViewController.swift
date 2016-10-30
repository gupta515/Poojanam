//
//  AarathiDetailsViewController.swift
//  Poojanam
//
//  Created by Gupta on 11/09/16.
//  Copyright © 2016 Gupta. All rights reserved.
//

import UIKit

class AarathiDetailsViewController: UIViewController {
    
    @IBOutlet weak var aarathiAudioCltrTopView: UIView!
    
    
    @IBOutlet weak var aarathiAudioTopPlayBtn: UIButton!
    @IBOutlet weak var aarathiAudioTopProgressLabel: UILabel!
    @IBOutlet weak var aarathiAudioTopProgressBar: UIProgressView!
    
    @IBOutlet weak var aarathiTextView: UITextView!
    
    @IBOutlet weak var aarathiAudioCtlrBottomView: UIView!
    @IBOutlet weak var aarathiAudioBottomProgressLabel: UILabel!
    @IBOutlet weak var aarathiAudioProgressBar: UIProgressView!
    @IBOutlet weak var aarathiAudioBottomPlayBtn: UIButton!
    @IBOutlet weak var aarathiNameLabel: UILabel!
    
    var aarathiName : String = ""
    var isAudioPlaying = false
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view. 
        self.title = aarathiName
        swapAudioCtlrView(play: isAudioPlaying, setTextView : false)
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    @IBAction func aarathiAudioCtlrTopBtn(_ sender: AnyObject) {
        swapAudioCtlrView(play: !isAudioPlaying, setTextView : true)
    }
    
    @IBAction func aarathiAudioCtlrBottomBtn(_ sender: AnyObject) {
        swapAudioCtlrView(play: !isAudioPlaying, setTextView : true)
    }
    
    func swapAudioCtlrView(play : Bool, setTextView : Bool) {
        isAudioPlaying = play
        let audioCtlrImage = isAudioPlaying ? UIImage(named: "pause") : UIImage(named : "play")

        aarathiAudioTopPlayBtn.setImage(audioCtlrImage, for: UIControlState.normal)
        aarathiAudioCtlrBottomView.isHidden = !isAudioPlaying
        aarathiAudioBottomPlayBtn.setImage(audioCtlrImage, for: UIControlState.normal)
    }
    
}
