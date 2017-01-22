//
//  StotramViewController.swift
//  Poojanam
//
//  Created by Gupta on 11/09/16.
//  Copyright © 2016 Gupta. All rights reserved.
//

import UIKit
import AVFoundation

class StotramViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
    
    @IBOutlet weak var stotramTableView: UITableView!
    @IBOutlet weak var stotramBottomAudioCtlr: UIView!
    
    @IBOutlet weak var stotramProgressLabel: UILabel!

    @IBOutlet weak var audioSlider: UISlider!
    @IBOutlet weak var stotramBtmPlayBtn: UIButton!
    @IBOutlet weak var stotramPoojaName: UILabel!
    
    var isStotramPlaying = false
    var didAudioPlayerSet = false
    var selectedStotramIndex : Int?
    
    var langStotrams : [String] = []
    
    var audioPlayer = AVAudioPlayer()
    var updater : CADisplayLink! = nil
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.

        let sliderThumbImage = UIImage(named: "audioSliderSeeker")?.resizeImage(newWidth: 10)
        
        audioSlider.setThumbImage(sliderThumbImage, for: .normal)
    }
    
    func imageWithImage(image: UIImage, scaledToSize newSize: CGSize = CGSize(width: 20, height: 20)) -> UIImage
    {
    UIGraphicsBeginImageContextWithOptions(newSize, false, 0.0)
        image.draw(in: CGRect(x: 0, y: 0, width: newSize.width, height: newSize.height))

    
    let newImage = UIGraphicsGetImageFromCurrentImageContext()
    UIGraphicsEndImageContext()
    
    return newImage!;
    }
    
    override func viewWillAppear(_ animated: Bool) {
        self.tabBarController?.navigationItem.title = "Stotram"
        
        if let selectedLang = UserDefaults.standard.string(forKey: "selectedLanguage"), let reqStotramList = allStotrams[selectedLang.lowercased()]{
            langStotrams = reqStotramList.sorted()
            stotramTableView.reloadData()
        }
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        if didAudioPlayerSet {
            audioPlayer.stop()
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
        if selectedStotramIndex == selectedStotram {
            if isStotramPlaying {
                audioPlayer.pause()
                isStotramPlaying = false
                stotramBottomAudioCtlr.isHidden = true
                stotramTableView.frame.size.height += 70
            } else {
                audioPlayer.play()
                isStotramPlaying = true
                stotramBottomAudioCtlr.isHidden = false
                stotramBtmPlayBtn.setImage(UIImage(named: "pauseWhite"), for: UIControlState.normal)
                stotramTableView.frame.size.height -= 70
            }
            stotramTableView.reloadData()
            return
        }
        if isStotramPlaying {
            audioPlayer.stop()
            stotramTableView.frame.size.height += 70
            stotramBottomAudioCtlr.isHidden = true
        }
        
        isStotramPlaying = true
        selectedStotramIndex = selectedStotram
        stotramBtmPlayBtn.setImage(UIImage(named: "pauseWhite"), for: UIControlState.normal)
        stotramTableView.frame.size.height -= 70
        
        //Audio Bottom View
        let selectedStotramName = langStotrams[selectedStotram]
        stotramPoojaName.text = selectedStotramName
        
        if let stotramInfo = stotramDataDict[selectedStotramName], let stotramAudioFile = stotramInfo["audio"] {
            setAudioController(audioFile: stotramAudioFile)
            audioPlayer.play()
        }
        
        stotramBottomAudioCtlr.isHidden = false
        stotramTableView.reloadData()
    }
    
    func stotramPause() {
        audioPlayer.pause()
        isStotramPlaying = false
        stotramBottomAudioCtlr.isHidden = true
        stotramTableView.frame.size.height += 70
        stotramBtmPlayBtn.setImage(UIImage(named: "playWhite"), for: UIControlState.normal)
        stotramTableView.reloadData()
    }
    
    @IBAction func stotramBtmAudioCtlr(_ sender: Any) {
        if isStotramPlaying {
            stotramPause()
        } else if let index = selectedStotramIndex {
            stotramPlay(selectedStotram: index)
        }
    }
    
    func setAudioController(audioFile:String, withExtension: String = ".m4a") {
        if let audioPathUrl = Bundle.main.url(forResource: audioFile, withExtension: withExtension) {
            do {
                audioPlayer = try AVAudioPlayer(contentsOf: audioPathUrl)
                
                updater = CADisplayLink(target: self, selector: #selector(self.trackAudio))
                updater.frameInterval = 1
                updater.add(to: RunLoop.current, forMode: RunLoopMode.commonModes)
                didAudioPlayerSet = true
            } catch {
                print("Couldn't set audio player")
            }
        }
    }
    
    func getTotalAudioDuration(audioPathUrl: URL) -> Float64 {
        return CMTimeGetSeconds(AVURLAsset(url: audioPathUrl).duration)
    }
    
    func trackAudio() {
        if isStotramPlaying {
            let currentTime = Int(audioPlayer.currentTime)
            let currentTimeStr  = String(format: "%02d", currentTime/60) + ":" + String(format: "%02d", currentTime%60)
            
            stotramProgressLabel.text = currentTimeStr

            audioSlider.value = Float(audioPlayer.currentTime/audioPlayer.duration)
        }
    }

    @IBAction func sliderDragged(_ sender: UISlider) {
        let currentAudioPosition = Float(audioPlayer.duration) * Float(sender.value)
        audioPlayer.currentTime = TimeInterval(currentAudioPosition)
    }
    
    @IBAction func previousStrotam(_ sender: Any) {
        guard let index = selectedStotramIndex, index != 0 else { return }
        stotramPlay(selectedStotram: index - 1)
    }
    
    @IBAction func nextStrotam(_ sender: Any) {
        guard let index = selectedStotramIndex, selectedStotramIndex != (langStotrams.count - 1) else { return }
        stotramPlay(selectedStotram: index + 1)
        
    }
    
}
