//
//  PoojaViewController.swift
//  Poojanam
//
//  Created by Gupta on 07/09/16.
//  Copyright © 2016 Gupta. All rights reserved.
//

import UIKit

class PoojaViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    @IBOutlet weak var upcomingPoojaImage: UIImageView!
    @IBOutlet weak var upcomingPoojaBtn: UIButton!
    @IBOutlet var poojaTableView : UITableView?
    
    var langPoojasDict : [String:[String:String]]?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        upcomingPoojaImage.layer.cornerRadius = upcomingPoojaImage.frame.size.width/2
        upcomingPoojaImage.clipsToBounds = true
        upcomingPoojaBtn.setTitle("Satyanarayana Vrath", for: UIControlState.normal)
    }
    
    override func viewWillAppear(_ animated: Bool) {
        self.tabBarController?.navigationItem.title = "Pooja"
        print("pooja view will appear")
        if let selectedLang = UserDefaults.standard.string(forKey: "selectedLanguage") {
            if let reqPoojalist = allPoojas[selectedLang.lowercased()] {
                langPoojasDict = reqPoojalist
            }
        }
        poojaTableView?.reloadData()
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    @IBAction func upcomingPoojaDetailBtn(_ sender: AnyObject) {
        moveToPoojaDetailView(poojaName: "Satyanarayana Pooja")
    }
    
    @IBAction func upcomingPoojaInfoBtn(_ sender: AnyObject) {
        moveToPoojaInfoView(poojaName: "Satyanarayana Pooja")
    }
    
    //Pooja TableView Delegates
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return langPoojasDict?.keys.count ?? 0
    }
    
    func getPoojaKey(index: Int) -> String {
        if let lazyPoojaKeys = langPoojasDict?.keys {
            let poojaKeysList = Array(lazyPoojaKeys)
            let poojaKey = poojaKeysList[index]
            return poojaKey
        }
        return ""
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let poojaCell = tableView.dequeueReusableCell(withIdentifier: "PoojaCellID") as! PoojaTableViewCell
        //Pooja Info setup
        let cellPoojaKey = getPoojaKey(index: indexPath.row)
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
        if let poojaDetailsView = storyboard?.instantiateViewController(withIdentifier: "PoojaDetailViewID")  as? PoojaDetailsViewController {
            poojaDetailsView.poojaName = poojaName
            self.navigationController?.pushViewController(poojaDetailsView, animated: true)
        }
    }
    
    //Functions to move to Info View
    func poojaInfoBtn(sender:UIButton) {
        moveToPoojaInfoView(poojaName: getPoojaKey(index: sender.tag))
    }
    
    func moveToPoojaInfoView(poojaName : String){
        if let poojaInfoView = storyboard?.instantiateViewController(withIdentifier: "AboutPoojaViewID")  as? AboutPoojaViewController {
            poojaInfoView.poojaName = poojaName
            self.navigationController?.pushViewController(poojaInfoView, animated: true)
        }
    }
}
