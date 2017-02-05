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
        
        guard let selectedLang = UserDefaults.standard.string(forKey: "selectedLanguage"), let aarathisListInfo = AarathiList(rawValue: selectedLang.lowercased()) else {
            return
        }
        
        langAarathis = aarathisListInfo.keyList.sorted()
        aarathiTableView.reloadData()
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
        
        let aarathiName = langAarathis[indexPath.row]
        
        guard let aarathiCell = tableView.dequeueReusableCell(withIdentifier: "AarathiCellID") as? AarathiTableViewCell, let aarathiInfo = Aarathi(rawValue: aarathiName) else {
            return UITableViewCell(frame: CGRect(x: 0, y: 0, width: 0, height: 0))
        }
        
        aarathiCell.aarathiDietyName.setTitle(aarathiInfo.title, for: .normal)
        aarathiCell.aarathiDietyName.tag = indexPath.row
        aarathiCell.aarathiDietyName.addTarget(self, action: #selector(aarathiPlay), for: UIControlEvents.touchUpInside)
        
        aarathiCell.aarathiDietyImage.image = UIImage(named: aarathiInfo.image)
        
        return aarathiCell
    }
    
    func aarathiPlay(sender: UIButton) {
        
        let aarathiName = langAarathis[sender.tag]
        
        guard let aarathiInfo = Aarathi(rawValue: aarathiName), let aarathiDetailsView = storyboard?.instantiateViewController(withIdentifier: "AarathiDetailViewID")  as? AarathiDetailsViewController else {
            print("Might be proper info is not existing to move forward")
            return
        }
        
        aarathiDetailsView.aarathiInfo = aarathiInfo
        
        self.navigationController?.pushViewController(aarathiDetailsView, animated: true)
        
    }
}
