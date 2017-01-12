//
//  PoojaViewController.swift
//  Poojanam
//
//  Created by Gupta on 07/09/16.
//  Copyright © 2016 Gupta. All rights reserved.
//

import UIKit

class PoojaViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    //Mark:- IBOutlets
    @IBOutlet weak var upcomingPoojaImage: UIImageView!
    @IBOutlet weak var upcomingPoojaBtn: UIButton!
    @IBOutlet var poojaTableView : UITableView?
    
    //Mark:- Properties
    var langPoojaSortedKeys : [String] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    
    override func viewWillAppear(_ animated: Bool) {
        self.tabBarController?.navigationItem.title = "Pooja"

        langPoojaSortedKeys = getSortedPoojaNames()
        poojaTableView?.reloadData()
        
        if langPoojaSortedKeys.count > 0 {
            let upcomingPoojaKey = langPoojaSortedKeys[0]
            guard !upcomingPoojaKey.isEmpty, let upcomingPoojaInfo = poojaDataDicts[upcomingPoojaKey] else {
                return
            }
            
            upcomingPoojaBtn.setTitle(upcomingPoojaInfo["name"], for: UIControlState.normal)
            upcomingPoojaImage.image = UIImage(named: upcomingPoojaInfo["image"]!)
        }
        
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func upcomingPoojaDetailBtn(_ sender: AnyObject) {
        if let upcomingPoojaName = upcomingPoojaBtn.title(for: UIControlState.normal) {
            moveToPoojaDetailView(poojaName: upcomingPoojaName)
        }
    }
    
    @IBAction func upcomingPoojaInfoBtn(_ sender: AnyObject) {
        if let upcomingPoojaName = upcomingPoojaBtn.title(for: UIControlState.normal) {
            moveToPoojaInfoView(poojaName: upcomingPoojaName)
        }
    }
    
    //Pooja TableView Delegates
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return langPoojaSortedKeys.count
    }
    
    func getPoojaKey(index: Int) -> String {
        if let selectedLang = UserDefaults.standard.string(forKey: "selectedLanguage"), let reqPoojaDict = allPoojas[selectedLang.lowercased()] {
            let lazyPoojaKeys = reqPoojaDict.keys
            let poojaKeysList = Array(lazyPoojaKeys)
            let poojaKey = poojaKeysList[index]
            return poojaKey
        }
        return ""
    }
    
    func getSortedPoojaNames() -> [String] {
        if let selectedLang = UserDefaults.standard.string(forKey: "selectedLanguage"), let reqPoojaDict = allPoojas[selectedLang.lowercased()]{
            let lazyPoojaKeys = reqPoojaDict.keys
            let poojaKeysList = Array(lazyPoojaKeys)
            return poojaKeysList.sorted()
        }
        return []
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let poojaCell = tableView.dequeueReusableCell(withIdentifier: "PoojaCellID") as! PoojaTableViewCell
        //Pooja Info setup
        let cellPoojaKey = langPoojaSortedKeys[indexPath.row]
        if let cellPoojaData = poojaDataDicts[cellPoojaKey] {
            poojaCell.poojaNameBtn.setTitle(cellPoojaData["name"], for: UIControlState.normal)
            //Pooja Detail setup
            poojaCell.poojaNameBtn.tag = indexPath.row
            poojaCell.poojaDietyImage.image = UIImage(named:cellPoojaData["image"]!)
            poojaCell.poojaNameBtn.addTarget(self, action: #selector(poojaDetails), for: UIControlEvents.touchUpInside)
            
            //Pooja Info setup
            poojaCell.poojaInfoBtn.tag = indexPath.row
            poojaCell.poojaInfoBtn.addTarget(self, action: #selector(poojaInfoBtn), for: UIControlEvents.touchUpInside)
        }
        
        return poojaCell
    }
    
    //Functions to move to Deatil and About views
    func poojaDetails(sender:UIButton)  {
        if let poojaName = sender.currentTitle {
            moveToPoojaDetailView(poojaName: poojaName)
        }
    }
    
    func moveToPoojaDetailView(poojaName : String){
        if let poojaDetailsView = storyboard?.instantiateViewController(withIdentifier: "PoojaDetailViewID") as? PoojaDetailsViewController {
            poojaDetailsView.poojaName = poojaName
            self.navigationController?.pushViewController(poojaDetailsView, animated: true)
        }
    }
    
    //Functions to move to Info View
    func poojaInfoBtn(sender:UIButton) {
        moveToPoojaInfoView(poojaName: langPoojaSortedKeys[sender.tag])
    }
    
    func moveToPoojaInfoView(poojaName : String){
        if let poojaInfoView = storyboard?.instantiateViewController(withIdentifier: "AboutPoojaViewID")  as? AboutPoojaViewController {
            poojaInfoView.poojaName = poojaName
            self.navigationController?.pushViewController(poojaInfoView, animated: true)
        }
    }
}
