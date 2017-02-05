//
//  PoojaViewController.swift
//  Poojanam
//
//  Created by Gupta on 07/09/16.
//  Copyright © 2016 Gupta. All rights reserved.
//

import UIKit

class PoojaViewController: UIViewController {
    
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
        
        guard let selectedLang = UserDefaults.standard.string(forKey: "selectedLanguage"), let poojaListInfo = PoojaList(rawValue: selectedLang.lowercased()) else {
            return
        }
        
        langPoojaSortedKeys = poojaListInfo.keysList.sorted()
        poojaTableView?.reloadData()

    }
    
    @IBAction func upcomingPoojaDetailBtn(_ sender: AnyObject) {
        
    }
    
    @IBAction func upcomingPoojaInfoBtn(_ sender: AnyObject) {
        
    }
}

//Pooja TableView Delegates
extension PoojaViewController : UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return langPoojaSortedKeys.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        //Pooja Info setup
        let poojaKey = langPoojaSortedKeys[indexPath.row]
        
        guard let poojaInfo = Pooja(rawValue: poojaKey), let poojaCell = tableView.dequeueReusableCell(withIdentifier: "PoojaCellID") as? PoojaTableViewCell else {
            return UITableViewCell(frame: CGRect(x: 0, y: 0, width: 0, height: 0))
        }
        
        poojaCell.poojaNameBtn.setTitle(poojaInfo.title, for: UIControlState.normal)
        
        //Pooja Detail setup
        poojaCell.poojaNameBtn.tag = indexPath.row
        poojaCell.poojaDietyImage.image = UIImage(named: poojaInfo.image)
        poojaCell.poojaNameBtn.addTarget(self, action: #selector(poojaDetails), for: UIControlEvents.touchUpInside)
        
        //Pooja Info setup
        poojaCell.poojaInfoBtn.tag = indexPath.row
        poojaCell.poojaInfoBtn.addTarget(self, action: #selector(poojaInfoBtn), for: UIControlEvents.touchUpInside)
        
        return poojaCell
    }
}

extension PoojaViewController {
    
    //Functions to move to Deatil and About views
    func poojaDetails(sender:UIButton)  {
        
        let poojaKey = langPoojaSortedKeys[sender.tag]
        
        guard let poojaInfo = Pooja(rawValue: poojaKey) else {
            return
        }
        
        moveToDetailsPage(poojaInfo: poojaInfo)
        
    }
    
    func moveToDetailsPage(poojaInfo: Pooja) {
        
        guard let poojaDetailsView = storyboard?.instantiateViewController(withIdentifier: "PoojaDetailViewID") as? PoojaDetailsViewController else {
            return
        }
        
        poojaDetailsView.poojaName = poojaInfo.rawValue
        poojaDetailsView.poojaInfo = poojaInfo
        self.navigationController?.pushViewController(poojaDetailsView, animated: true)
        
    }
    
    //Functions to move to Info View
    func poojaInfoBtn(sender:UIButton) {
        
        let poojaKey = langPoojaSortedKeys[sender.tag]
        
        guard let poojaInfo = Pooja(rawValue: poojaKey) else {
            return
        }
        
        moveToInfoPage(poojaInfo: poojaInfo)
    }
    
    func moveToInfoPage(poojaInfo: Pooja) {
        
        guard let poojaInfoView = storyboard?.instantiateViewController(withIdentifier: "AboutPoojaViewID")  as? AboutPoojaViewController else {
            return
        }
        
        poojaInfoView.poojaInfo = poojaInfo
        self.navigationController?.pushViewController(poojaInfoView, animated: true)
        
    }
}
