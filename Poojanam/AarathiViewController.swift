//
//  AarathiViewController.swift
//  Poojanam
//
//  Created by Gupta on 07/09/16.
//  Copyright © 2016 Gupta. All rights reserved.
//

import UIKit

class AarathiViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        print("aarathi view didload")
    }
    
    override func viewWillAppear(_ animated: Bool) {
        print("Aarathi view will appear")
        self.tabBarController?.navigationItem.title = "Aarathi"
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
}
