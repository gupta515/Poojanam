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

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        if let selectedLanguage = UserDefaults.standard.string(forKey: "selectedLanguage") {
            print(selectedLanguage)
            self.title = "Change Language"
        } else {
            self.title = "Choose Language"
            print(languagesAvailable)
        }
        self.languagesTableView?.tableFooterView = UIView()
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
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return languagesAvailable.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let languageCell = tableView.dequeueReusableCell(withIdentifier: "LanguageCellID") as! LanguageViewCell
        languageCell.languageLable.text = languagesAvailable[indexPath.row]
        return languageCell
    }
}
