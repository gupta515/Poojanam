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
    
    var poojaName : String = ""
    var isPoojaSamagriActivated : Bool = true
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        self.title = poojaName
        removeNavBarBorder()
        setSwapButtonView()
        swapActiveBtn(active: true)
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
    
    //Set View functions
    func removeNavBarBorder() {
        for parent in self.navigationController!.navigationBar.subviews {
            for childView in parent.subviews {
                if(childView is UIImageView) {
                    childView.removeFromSuperview()
                    break
                }
            }
        }
    }
    
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
}
