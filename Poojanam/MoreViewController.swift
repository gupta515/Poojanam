//
//  MoreViewController.swift
//  Poojanam
//
//  Created by Gupta on 11/09/16.
//  Copyright © 2016 Gupta. All rights reserved.
//

import UIKit
import iRate

private let RateUsIndex = IndexPath(row: 1, section: 0)
private let ShareIndex = IndexPath(row: 2, section: 0)

class MoreViewController: UITableViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        self.tableView.tableFooterView = UIView()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        self.tabBarController?.navigationItem.title = "More"
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
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        switch indexPath {
        
        case RateUsIndex:

            guard Helper.isAppUpdated() else {
                
                let updateAppAlertCtrlr: UIAlertController = UIAlertController(title: "Poojanam got updated!", message: "We got new update for poojanam, would you like to update poojanam?", preferredStyle: .alert)
                updateAppAlertCtrlr.addAction(UIAlertAction(title: "Cancel", style: UIAlertActionStyle.default) { _ -> Void in
                    self.promptForRating()
                })
                
                updateAppAlertCtrlr.addAction(UIAlertAction(title: "Update", style: UIAlertActionStyle.default) { _ -> Void in
                    self.redirectToAppStore()
                })
                self.present(updateAppAlertCtrlr, animated: true, completion: nil)
                return
            }
            
            promptForRating()
            
        case ShareIndex:
            
            if let url = URL(string: poojanamAppStoreUrl) {
                let text = "I have started using POOJANAM to perform my poojas, Try it out."
                share(text, url: url)
            }
            
        default:
            print("Nothing to handle")
        }
    }
}

extension MoreViewController {
    
    func redirectToAppStore() {
        guard let rateUsURL = URL(string: poojanamAppStoreUrl) else {
            return
        }
        UIApplication.shared.openURL(rateUsURL)
    }
    
    func promptForRating() {
        if #available(iOS 10.3, *) {
            SKStoreReviewController.requestReview()
        } else {
            iRate.sharedInstance().promptForRating()
        }
    }
    
    func share(_ text: String, url: URL) {
        
        let activity = UIActivity()
        let activityVC = UIActivityViewController(activityItems: [text, url], applicationActivities: [activity])
        
        activityVC.excludedActivityTypes = [UIActivityType.addToReadingList, UIActivityType.airDrop, UIActivityType.assignToContact, UIActivityType.print, UIActivityType.saveToCameraRoll, UIActivityType.postToTencentWeibo, UIActivityType.postToVimeo, UIActivityType.postToWeibo]
        activityVC.completionWithItemsHandler = {
            (activity, success, items, error) in

        }
        self.present(activityVC, animated: true, completion: nil)
    }
}
