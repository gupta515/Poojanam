//
//  LanguagesViewController.swift
//  Poojanam
//
//  Created by Gupta on 11/09/16.
//  Copyright © 2016 Gupta. All rights reserved.
//

import UIKit

class LanguagesViewController: UIViewController, UITableViewDelegate, UITableViewDataSource
{
    
    @IBOutlet var languagesTableView : UITableView?
    
    var selectedLanguage = ""
    var isChangeLanguage = false
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        if let selectedLang = UserDefaults.standard.string(forKey: "selectedLanguage") {
            self.title = "Change Language"
            isChangeLanguage = true
            selectedLanguage = selectedLang
        } else {
            self.title = "Choose Language"
        }
        self.languagesTableView?.tableFooterView = UIView()
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return languagesAvailable.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let languageCell = tableView.dequeueReusableCell(withIdentifier: "LanguageCellID") as! LanguageViewCell
        let arryLang = languagesAvailable[indexPath.row]
        languageCell.languageLable.text = arryLang
        languageCell.languageHighLight.isHidden = (arryLang != selectedLanguage)
        return languageCell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let userChoosenLanguage = languagesAvailable[indexPath.row]
        if userChoosenLanguage != selectedLanguage {
            UserDefaults.standard.set(userChoosenLanguage, forKey: "selectedLanguage")
            selectedLanguage = userChoosenLanguage
            languagesTableView?.reloadData()
            
            if !isChangeLanguage, let setTabBarCtlr = storyboard!.instantiateViewController(withIdentifier: "TabBarView") as? TabBarController {
                self.navigationController?.pushViewController(setTabBarCtlr, animated: false)
            }
        }
    }
}
