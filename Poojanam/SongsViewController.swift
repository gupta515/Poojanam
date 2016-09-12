//
//  SongsViewController.swift
//  Poojanam
//
//  Created by Gupta on 10/09/16.
//  Copyright © 2016 Gupta. All rights reserved.
//

import UIKit

class SongsViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        print("Songs view controller")
    }
    
    override func viewWillAppear(_ animated: Bool) {
        print("Songs view will appear")
        self.tabBarController?.navigationItem.title = "Songs"
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

}
