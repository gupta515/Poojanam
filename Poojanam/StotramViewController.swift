//
//  StotramViewController.swift
//  Poojanam
//
//  Created by Gupta on 11/09/16.
//  Copyright © 2016 Gupta. All rights reserved.
//

import UIKit

class StotramViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        print("Stotram View didload")
    }
    
    override func viewWillAppear(_ animated: Bool) {
        print("Stotram view will appear")
        self.tabBarController?.navigationItem.title = "Stotram"
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
