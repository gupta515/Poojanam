//
//  MoreViewController.swift
//  Poojanam
//
//  Created by Gupta on 11/09/16.
//  Copyright © 2016 Gupta. All rights reserved.
//

import UIKit
import iRate

private let RateUs_IndexPath = IndexPath(row: 1, section: 0)

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
        case RateUs_IndexPath:
            promptForRating()
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
    
}
