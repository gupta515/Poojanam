//
//  PoojaViewController.swift
//  Poojanam
//
//  Created by Gupta on 07/09/16.
//  Copyright © 2016 Gupta. All rights reserved.
//

import UIKit

class PoojaViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    @IBOutlet var poojaTableView : UITableView?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    
    override func viewWillAppear(_ animated: Bool) {
        self.tabBarController?.navigationItem.title = "Pooja"
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    @IBAction func upcomingPoojaDetailBtn(_ sender: AnyObject) {
        moveToPoojaDetailView(poojaName: "Ganesh Upcoming")
    }
    
    @IBAction func upcomingPoojaInfoBtn(_ sender: AnyObject) {
        print("Upcoming pooja button is clicked")
        moveToAboutPoojaView(poojaName: "Ganesh Chaturthi")
    }
    
    //Pooja TableView Delegates
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 5
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let poojaCell = tableView.dequeueReusableCell(withIdentifier: "PoojaCellID") as! PoojaTableViewCell
        //Pooja Info setup
        poojaCell.poojaInfoBtn.tag = indexPath.row
        poojaCell.poojaInfoBtn.addTarget(self, action: #selector(poojaInfoBtn), for: UIControlEvents.touchUpInside)
        
        //Pooja Detail setup
        poojaCell.poojaNameBtn.tag = indexPath.row
        poojaCell.poojaNameBtn.addTarget(self, action: #selector(aboutPooja), for: UIControlEvents.touchUpInside)
        return poojaCell
    }
    
    //Functions to move to Deatil and About views
    func aboutPooja(sender:UIButton)  {
        moveToAboutPoojaView(poojaName: sender.currentTitle!)
    }
    
    func moveToAboutPoojaView(poojaName : String){
        if let aboutPoojaView = storyboard?.instantiateViewController(withIdentifier: "AboutPoojaViewID")  as? AboutPoojaViewController {
            aboutPoojaView.poojaName = poojaName
            self.navigationController?.pushViewController(aboutPoojaView, animated: true)
        }
    }
    
    func poojaInfoBtn(sender:UIButton){
        moveToPoojaDetailView(poojaName: sender.currentTitle!)
        
    }
    
    func moveToPoojaDetailView(poojaName : String){
        if let poojaDetailsView = storyboard?.instantiateViewController(withIdentifier: "PoojaDetailViewID")  as? PoojaDetailsViewController {
            poojaDetailsView.poojaName = poojaName
            self.navigationController?.pushViewController(poojaDetailsView, animated: true)
        }
    }
}
