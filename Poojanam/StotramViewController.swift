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
    
    var langStotrams : [String] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    
    override func viewWillAppear(_ animated: Bool) {
        self.tabBarController?.navigationItem.title = "Stotram"
        
        if let selectedLang = UserDefaults.standard.string(forKey: "selectedLanguage"), let reqStotramList = allStotrams[selectedLang.lowercased()]{
            langStotrams = reqStotramList.sorted()
            stotramTableView.reloadData()
        }
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return langStotrams.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let stotramCell = tableView.dequeueReusableCell(withIdentifier: "StotramCellID") as!StotramTableViewCell
        if let stotramData = stotramDataDict[langStotrams[indexPath.row]] {
            stotramCell.stotramNameLabel.text = langStotrams[indexPath.row]
            stotramCell.stotramProgressLabel.text = stotramData["duration"]
        }

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
        if isStotramPlaying {
            if selectedStotramIndex == selectedStotram {
                stotramPause()
                return
            } else {
                stotramTableView.frame.size.height = stotramTableView.frame.size.height + 70
            }
        }
        
        isStotramPlaying = true
        selectedStotramIndex = selectedStotram
        stotramBtmPlayBtn.setImage(UIImage(named: "pause"), for: UIControlState.normal)
        stotramTableView.frame.size.height = stotramTableView.frame.size.height - 70
        
        //Audio Bottom View
        
        stotramPoojaName.text = langStotrams[selectedStotram]

        stotramBottomAudioCtlr.isHidden = false
        stotramTableView.reloadData()
    }
    
    func stotramPause(){
        isStotramPlaying = false
        stotramBottomAudioCtlr.isHidden = true
        stotramTableView.frame.size.height = stotramTableView.frame.size.height + 70
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
