//
//  MainNavigationController.swift
//  Poojanam
//
//  Created by Gupta on 18/09/16.
//  Copyright © 2016 Gupta. All rights reserved.
//

import UIKit

class MainNavigationController: UINavigationController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.

        // TO DO: Delete below code when new languages are added
        //        if let _ = UserDefaults.standard.string(forKey: "selectedLanguage") {
        //            return
        //        }
        //        if let selectLanguageController = storyboard!.instantiateViewController(withIdentifier: "LanguageView") as? LanguagesViewController {
        //            setViewControllers([selectLanguageController], animated: true)
        //        }

        UserDefaults.standard.removeObject(forKey: "selectedLanguage")
        
        if UserDefaults.standard.string(forKey: "AppStore_AppVersionNumber") == nil  || UserDefaults.standard.string(forKey: "AppStore_AppVersionNumber")?.isEmpty == true {
            UserDefaults.standard.set(Helper.getAppVersionFullString(), forKey: "AppStore_AppVersionNumber")
        }
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
