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
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    
    override func viewWillAppear(_ animated: Bool) {
        self.tabBarController?.navigationItem.title = "Aarathi"
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
        return 5
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let aarathiCell = tableView.dequeueReusableCell(withIdentifier: "AarathiCellID") as! AarathiTableViewCell
        //Pooja Info setup
        aarathiCell.aarathiDietyName.tag = indexPath.row
        aarathiCell.aarathiDietyName.addTarget(self, action: #selector(aarathiPlay), for: UIControlEvents.touchUpInside)
        return aarathiCell
    }
    
    func aarathiPlay(sender:UIButton) {
        print(sender.tag)
        if let aarathiDetailsView = storyboard?.instantiateViewController(withIdentifier: "AarathiDetailViewID")  as? AarathiDetailsViewController {
            aarathiDetailsView.aarathiName = sender.currentTitle ?? "Test dummy Aarathi"
            self.navigationController?.pushViewController(aarathiDetailsView, animated: true)
        }
    }
}
