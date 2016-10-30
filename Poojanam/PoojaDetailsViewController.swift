//
//  PoojaDetailsViewController.swift
//  Poojanam
//
//  Created by Gupta on 11/09/16.
//  Copyright © 2016 Gupta. All rights reserved.
//

import UIKit

class PoojaDetailsViewController: UIViewController {
    
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
    var isAudioPlaying = false
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        self.title = poojaName
        self.navigationController?.removeNavigationBarBorder()
        swapButtonOptionsView.setViewRoundCornerWithBorder(borderWidth: 1, cornerRadius: 5, borderColor: UIColor().appBaseColorSaffaron())
        swapActiveBtn(active: true)
        swapAudioCtlrView(play: isAudioPlaying, setTextView: false)
        //Set Text info 
        if let poojaSamagriPath = Bundle.main.path(forResource: "ShriSatyanarayanVratSamagri", ofType: "txt") {
            let contents: String
            do {
                contents = try String(contentsOfFile: poojaSamagriPath, encoding: .utf8)
            } catch _ {
                contents = ""
            }
            poojaSamagriTextView.text  = contents as String
        }
        
        if let poojaVidhiPath = Bundle.main.path(forResource: "ShriSatyanarayanVratKatha", ofType: "txt") {
        let contents: String
        do {
            contents = try String(contentsOfFile: poojaVidhiPath, encoding: .utf8)
        } catch _ {
            contents = ""
        }
        poojaVidhiTextView.text  = contents as String
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
    }
    
    @IBAction func poojaBottomPlayBtn(_ sender: AnyObject) {
        swapAudioCtlrView(play: !isAudioPlaying, setTextView: true)
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
}
