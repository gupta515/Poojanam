//
//  StotramViewController.swift
//  Poojanam
//
//  Created by Gupta on 11/09/16.
//  Copyright © 2016 Gupta. All rights reserved.
//

import UIKit

class StotramViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
    
    @IBOutlet weak var stotramTableView: UITableView!
    @IBOutlet weak var stotramBottomAudioCtlr: UIView!
    
    @IBOutlet weak var stotramProgressLabel: UILabel!
    @IBOutlet weak var stotramProgressBar: UIProgressView!
    @IBOutlet weak var stotramBtmPlayBtn: UIButton!
    @IBOutlet weak var stotramPoojaName: UILabel!
    
    var isStotramPlaying = false
    var selectedStotramIndex = 0
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
    }
    
    override func viewWillAppear(_ animated: Bool) {
        self.tabBarController?.navigationItem.title = "Stotram"
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 10
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let stotramCell = tableView.dequeueReusableCell(withIdentifier: "StotramCellID") as!StotramTableViewCell
        stotramCell.stotramNameLabel.text = ("Ayyappa Stotram \(indexPath.row + 1)")
        stotramCell.stotramProgressLabel.text = "5 mins"
        
        //Play Button Actions
        stotramCell.stotramAudioBtn.tag = indexPath.row
        stotramCell.stotramAudioBtn.isHidden = true
        stotramCell.stotramAudioBtn.addTarget(self, action: #selector(stotramListPlayButton), for: UIControlEvents.touchUpInside)
        if isStotramPlaying && selectedStotramIndex == indexPath.row{
            stotramCell.stotramAudioBtn.isHidden = false
        }
        return stotramCell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: false)
        stotramPlay(selectedStotram: indexPath.row)
    }
    
    func stotramListPlayButton(sender: UIButton){
        stotramPlay(selectedStotram: sender.tag)
    }
    
    func stotramPlay(selectedStotram : Int){
        if isStotramPlaying && selectedStotramIndex == selectedStotram {
            stotramPause()
            return
        }
        isStotramPlaying = true
        selectedStotramIndex = selectedStotram
        stotramBtmPlayBtn.setImage(UIImage(named: "pause"), for: UIControlState.normal)
        stotramTableView.frame.size.height = stotramTableView.frame.size.height - 70
        stotramBottomAudioCtlr.isHidden = false
        stotramTableView.reloadData()
    }
    
    func stotramPause(){
        isStotramPlaying = false
        stotramBtmPlayBtn.setImage(UIImage(named: "play"), for: UIControlState.normal)
        stotramTableView.reloadData()
    }
    
    @IBAction func stotramBtmAudioCtlr(_ sender: Any) {
        if isStotramPlaying {
            stotramPause()
        } else {
            stotramPlay(selectedStotram: selectedStotramIndex)
        }
    }
    
}
