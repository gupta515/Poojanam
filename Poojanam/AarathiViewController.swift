//
//  AarathiViewController.swift
//  Poojanam
//
//  Created by Gupta on 07/09/16.
//  Copyright © 2016 Gupta. All rights reserved.
//

import UIKit

class AarathiViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
    
    @IBOutlet weak var aarathiTableView: UITableView!
    
    var langAarathis : [String] = []

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    
    override func viewWillAppear(_ animated: Bool) {
        self.tabBarController?.navigationItem.title = "Aarathi"
        
        if let selectedLang = UserDefaults.standard.string(forKey: "selectedLanguage"), let reqAarathiList = allAarathis[selectedLang.lowercased()] {
            langAarathis = reqAarathiList.sorted()
            aarathiTableView.reloadData()
        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    //Aarathi Table View Delegates & DataSource
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return langAarathis.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let aarathiCell = tableView.dequeueReusableCell(withIdentifier: "AarathiCellID") as! AarathiTableViewCell
        
        let aarathiName = langAarathis[indexPath.row]
        
        aarathiCell.aarathiDietyName.setTitle(aarathiName, for: .normal)
        aarathiCell.aarathiDietyName.tag = indexPath.row
        aarathiCell.aarathiDietyName.addTarget(self, action: #selector(aarathiPlay), for: UIControlEvents.touchUpInside)
        return aarathiCell
    }
    
    func aarathiPlay(sender: UIButton) {
        if let btnTitle = sender.currentTitle, let aarathiDetailsView = storyboard?.instantiateViewController(withIdentifier: "AarathiDetailViewID")  as? AarathiDetailsViewController {
            aarathiDetailsView.aarathiName = btnTitle
            self.navigationController?.pushViewController(aarathiDetailsView, animated: true)
        }
    }
}
