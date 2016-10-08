//
//  AboutPoojaViewController.swift
//  Poojanam
//
//  Created by Gupta on 11/09/16.
//  Copyright © 2016 Gupta. All rights reserved.
//

import UIKit

class AboutPoojaViewController: UITableViewController {
    
    var poojaName : String = ""
    
    
    @IBOutlet weak var poojaInfoNameLabel: UILabel!
    
    @IBOutlet weak var poojaAboutInfoText: UITextView!
    
    @IBOutlet weak var poojaInfoDateView: UIView!
    @IBOutlet weak var poojaInfoBeginView: UIView!
    @IBOutlet weak var poojaInfoEndView: UIView!
    
    @IBOutlet weak var poojaInfoDurationLabel: UILabel!
    @IBOutlet weak var poojaInfoDescriptionView: UITextView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        self.title = poojaName
        poojaInfoNameLabel.text = "About \(poojaName)"
        
        poojaInfoDateView.setViewRoundCornerWithBorder(borderWidth: 1, cornerRadius: 5, borderColor: UIColor().colorGray())
        poojaInfoBeginView.setViewRoundCornerWithBorder(borderWidth: 1, cornerRadius: 5, borderColor: UIColor().colorGray())
        poojaInfoEndView.setViewRoundCornerWithBorder(borderWidth: 1, cornerRadius: 5, borderColor: UIColor().colorGray())
        
        poojaAboutInfoText.setTextViewHeightAsPerContent()
        poojaInfoDescriptionView.setTextViewHeightAsPerContent()
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func  tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        
        switch indexPath.row {
        case 0:
            return 40
        case 1:
            return poojaAboutInfoText.frame.height
        case 2:
            return 145
        case 3:
            return 65
        case 4:
            return poojaInfoDescriptionView.frame.height + 40
        default :
            return UITableViewAutomaticDimension
        }
        
    }
}
