//
//  AboutPoojaViewController.swift
//  Poojanam
//
//  Created by Gupta on 11/09/16.
//  Copyright © 2016 Gupta. All rights reserved.
//

import UIKit

class AboutPoojaViewController: UIViewController {
    
    var poojaName : String = ""

    override func viewDidLoad() {
        super.viewDidLoad()
        print("in view did load \(poojaName)")
        // Do any additional setup after loading the view.
        self.title = poojaName
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
