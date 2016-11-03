//
//  PoojaDetailsViewController.swift
//  Poojanam
//
//  Created by Gupta on 11/09/16.
//  Copyright © 2016 Gupta. All rights reserved.
//

import UIKit
import FirebaseStorage

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
    
    let storage = FIRStorage.storage()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        self.title = poojaName
        self.navigationController?.removeNavigationBarBorder()
        swapButtonOptionsView.setViewRoundCornerWithBorder(borderWidth: 1, cornerRadius: 5, borderColor: UIColor().appBaseColorSaffaron())
        swapActiveBtn(active: true)
        swapAudioCtlrView(play: isAudioPlaying, setTextView: false)
        
        //Set Text info
        poojaVidhiTextView.attributedText = TextFiles().getTextFromFile(fileName: "marathi_satyanarayan_pooja_vidhi", fileExtension: "rtf")
        poojaSamagriTextView.attributedText = TextFiles().getTextFromFile(fileName: "marathi_satyanarayan_pooja_samgri", fileExtension: "rtf")
        
        
        let audioM4A = Bundle.main.path(forResource: "satyanarayanpooja", ofType: "m4a")
        let audioMP3 = Bundle.main.path(forResource: "SatyanarayanPooja", ofType: "mp3")
        print("\(audioM4A) \n \(audioMP3)")
        
        let audioMP3URL = Bundle.main.url(forResource: "satyanarayanpooja", withExtension: "m4a")
        let audioM4AURL = Bundle.main.url(forResource: "SatyanarayanPooja", withExtension: "mp3")
        print("\(audioM4AURL) \n \(audioMP3URL)")
        
        let testAudioFile = Bundle.main.url(forResource: "Maruti Stotra", withExtension: "m4a")
        print("\(testAudioFile)")
        
        let poojaVidhiFBRef = storage.reference(forURL: satyanarayanapoojavidhi)
        let localUrl = URL(fileURLWithPath: "audio/marati/poojavidhi/satyanarayanapoojavidhi.m4a")
        //poojaVidhiFBRef.write(toFile: localUrl)
        
        let downloadAudioFile = Bundle.main.url(forResource: "satyanarayanapoojavidhi", withExtension:".m4a")
        print("download \(downloadAudioFile)")
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
