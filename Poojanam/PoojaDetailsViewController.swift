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
    @IBOutlet weak var poojaVidhiView: UIView!
    
    @IBOutlet weak var poojaAudioCtlrTopView: UIView!
    @IBOutlet weak var poojaAudioProgressLabel: UILabel!
    @IBOutlet weak var poojaAudioTopCtlrBtn: UIButton!
    
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
        setSwapButtonView()
        swapActiveBtn(active: true)
        swapAudioCtlrView(play: isAudioPlaying)
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
        swapAudioCtlrView(play: !isAudioPlaying)
    }
    
    @IBAction func poojaBottomPlayBtn(_ sender: AnyObject) {
        swapAudioCtlrView(play: !isAudioPlaying)
    }
    
    
    //Set View functions
    func setSwapButtonView() {
        swapButtonOptionsView.layer.borderWidth = 1
        swapButtonOptionsView.layer.cornerRadius = 5
        swapButtonOptionsView.clipsToBounds = true
        swapButtonOptionsView.layer.borderColor = UIColor().appBaseColorSaffaron().cgColor
    }
    
    func swapActiveBtn(active : Bool) {
        isPoojaSamagriActivated = active
        poojaSamagriBtn.swapButtonState(active: isPoojaSamagriActivated)
        poojaVidhiBtn.swapButtonState(active: !isPoojaSamagriActivated)
        
        //Set Corresponding view
        poojaVidhiView.isHidden = true
        poojaSamagriView.isHidden = true
        isPoojaSamagriActivated ? (poojaSamagriView.isHidden = false) : (poojaVidhiView.isHidden = false)
    }
    
    func swapAudioCtlrView(play : Bool) {
        isAudioPlaying = play
        let audioCtlrImage = isAudioPlaying ? UIImage(named: "pause") : UIImage(named : "play")
        poojaAudioTopCtlrBtn.setImage(audioCtlrImage, for: UIControlState.normal)
        poojaAudioCtlrBottomView.isHidden = !isAudioPlaying
        poojaAudioBottomCtlrBtn.setImage(audioCtlrImage, for: UIControlState.normal)
    }
}
