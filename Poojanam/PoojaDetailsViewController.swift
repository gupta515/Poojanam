//
//  PoojaDetailsViewController.swift
//  Poojanam
//
//  Created by Gupta on 11/09/16.
//  Copyright © 2016 Gupta. All rights reserved.
//

import UIKit
import FirebaseStorage
import AVFoundation

class PoojaDetailsViewController: UIViewController, AVAudioPlayerDelegate {
    
    @IBOutlet weak var poojaShareBtn: UIButton!
    
    @IBOutlet weak var swapButtonOptionsView: UIView!
    @IBOutlet weak var poojaSamagriBtn: UIButton!
    @IBOutlet weak var poojaVidhiBtn: UIButton!
    
    @IBOutlet weak var poojaSamagriView: UIView!
    @IBOutlet weak var poojaSamagriTextView: UITextView!
    @IBOutlet weak var poojaVidhiView: UIView!
    
    
    @IBOutlet weak var audioDownloadView: UIView!
    
    @IBOutlet weak var audioDownloadLabel: UILabel!
    @IBOutlet weak var poojaAudioImageBG: UIImageView!
    @IBOutlet weak var poojaAudioCtlrTopView: UIView!
    @IBOutlet weak var poojaAudioProgressLabel: UILabel!
    @IBOutlet weak var poojaAudioTopCtlrBtn: UIButton!
    
    @IBOutlet weak var poojaVidhiTextView: UITextView!
    
    @IBOutlet weak var audioSlider: UISlider!
    
    var poojaName : String = ""
    var poojaInfo : Pooja?
    var isPoojaSamagriActivated : Bool = true
    var audioPlayer = AVAudioPlayer()
    var isDownloading = false
    var isAudioPlayerSet = false
    var isAudioPlaying = false
    var audioDuration : Float64 = 0.0
    var updater : CADisplayLink! = nil
    
    let storage = FIRStorage.storage()
    var downloadTask : FIRStorageDownloadTask?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
        self.navigationController?.removeNavigationBarBorder()
        swapButtonOptionsView.setViewRoundCornerWithBorder(borderWidth: 1, cornerRadius: 5, borderColor: UIColor().appBaseColorSaffaron())
        swapActiveBtn(active: false)
        swapAudioCtlrView(play: isAudioPlaying, setTextView: false)
        
        let sliderThumbImage = UIImage(named: "audioSliderSeeker")?.resizeImage(newWidth: 10)
        
        audioSlider.setThumbImage(sliderThumbImage, for: .normal)
        
        if let poojaData = poojaDataDicts[poojaName] {
            
            self.title = poojaInfo?.title

            //Set Text info
            poojaVidhiTextView.attributedText = TextFiles().getTextFromFile(fileName: poojaData["vidhi"]!, fileExtension: "rtf")
            poojaVidhiTextView.font = UIFont(name: "NotoSansDevanagari-Regular", size: 42)
            poojaSamagriTextView.attributedText = TextFiles().getTextFromFile(fileName: poojaData["samagri"]!, fileExtension: "rtf")
            
            poojaAudioImageBG.image = UIImage(named: poojaData["audioBG"]!)
            guard let poojaAudio = poojaData["audio"], !poojaAudio.isEmpty else {
                print("Audio name is not available")
                return
            }
            
            if let cacheKey = poojaData["cacheKey"], UserDefaults.standard.bool(forKey: cacheKey) {
                print("File already downloaded")
                setAudio(audioUrl: poojaAudio)
                return
            }
            
            if let refURL = poojaData["downloadFBUrl"] {
                poojaAudioCtlrTopView.isHidden = true
                audioDownloadView.isHidden = false
                audioDownloadLabel.text = "Downloading (0%)"
                downloadAudioFromFB(audioFBSUrl: refURL, audioFileName: poojaAudio)
            }
            
        }
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        
        if !isAudioPlayerSet {
            return
        }
        
        audioPlayer.stop()
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func poojaShareAction(_ sender: Any) {
        let shareActivity = UIActivity()
        let shareText = poojaSamagriTextView.text
        let shareActivityView = UIActivityViewController(activityItems: ["Samagri for \(self.title ?? "") \n\n \(shareText ?? "")"], applicationActivities: [shareActivity])
        
        shareActivityView.excludedActivityTypes = [UIActivityType.addToReadingList,UIActivityType.airDrop,UIActivityType.assignToContact,UIActivityType.print,UIActivityType.saveToCameraRoll,UIActivityType.postToTencentWeibo,UIActivityType.postToVimeo,UIActivityType.postToWeibo]
        
        self.present(shareActivityView, animated: true, completion: nil)
    }
    
    @IBAction func poojaSamagriClicked(_ sender: AnyObject) {
        if isPoojaSamagriActivated {
            return
        }
        swapActiveBtn(active: true)
    }
    
    @IBAction func poojaVidhiClicked(_ sender: AnyObject) {
        if !isPoojaSamagriActivated {
            return
        }
        swapActiveBtn(active: false)
    }
    
    @IBAction func selfCloseView(_ sender: Any) {
        
        guard isDownloading || isAudioPlaying else {
            closeView()
            return
        }
        
        let closeViewAlertCtlr = UIAlertController(title: nil, message: nil, preferredStyle: .actionSheet)
        closeViewAlertCtlr.addAction(UIAlertAction(title: isDownloading ? "Cancel Download" : isAudioPlaying ? "Stop Playing" : "", style: .destructive, handler: { (action) in
            self.stopViewActions()
        }))
        closeViewAlertCtlr.addAction(UIAlertAction(title: "No", style: .cancel, handler: nil))
        self.present(closeViewAlertCtlr, animated: true, completion: nil)
    }
    
    func stopViewActions() {
        
        if isDownloading {
            
            downloadTask?.cancel()
        } else if isAudioPlaying {
            
            audioPlayer.stop()
        }
        closeView()
    }
    
    func closeView() {
        isDownloading = false
        isAudioPlaying = false
        isAudioPlayerSet = false
        popViewController()
    }
}

//Mark:- Audio Contorllers
extension PoojaDetailsViewController {
    
    @IBAction func poojaTopPlayBtn(_ sender: AnyObject) {
        swapAudioCtlrView(play: !isAudioPlaying, setTextView: true)
        
        guard isAudioPlayerSet else {
            return
        }
        
        if isAudioPlaying {
            audioPlayer.play()
        } else {
            audioPlayer.pause()
        }
    }
    
    @IBAction func valueAction(_ sender: UISlider) {
        
        guard isAudioPlayerSet else {
            return
        }
        
        let currentAudioPosition = Float(audioPlayer.duration) * Float(sender.value)
        audioPlayer.currentTime = TimeInterval(currentAudioPosition)
    }
    
    func setAudio(audioUrl: String) {
        
        isDownloading = false
        audioDownloadView.isHidden = true
        poojaAudioCtlrTopView.isHidden = false
        
        if let audioPathUrl = DownloadHelper().getLocalDownloadFilePath(endPath: audioUrl, kind: "poojaVidhi") {
            do {
                print("Setitng audio for path \(audioPathUrl)")
                
                isAudioPlayerSet = true
                
                audioPlayer = try AVAudioPlayer(contentsOf: audioPathUrl)
                audioDuration = getTotalAudioDuration(audioPathUrl: audioPathUrl)
                
                updater = CADisplayLink(target: self, selector: #selector(self.trackAudio))
                updater.frameInterval = 1
                updater.add(to: RunLoop.current, forMode: RunLoopMode.commonModes)
            } catch {
                print("Couldn't set audio player")
            }
        }
    }
    
    func trackAudio() {
        if isAudioPlaying {
            let currentTime = Int(audioPlayer.currentTime)
            let currentTimeStr  = String(format: "%02d", currentTime/60) + ":" + String(format: "%02d", currentTime%60)
            poojaAudioProgressLabel.text = currentTimeStr
            audioSlider.value = Float(audioPlayer.currentTime/audioPlayer.duration)
        }
    }
    
    func swapActiveBtn(active : Bool) {
        isPoojaSamagriActivated = active
        poojaSamagriBtn.swapButtonState(active: isPoojaSamagriActivated)
        poojaVidhiBtn.swapButtonState(active: !isPoojaSamagriActivated)
        
        //Set Corresponding view
        poojaVidhiView.isHidden = true
        poojaSamagriView.isHidden = true
        isPoojaSamagriActivated ? (poojaSamagriView.isHidden = false) : (poojaVidhiView.isHidden = false)
        
        poojaShareBtn.setTitle(isPoojaSamagriActivated ? "Share" : "", for: .normal)
        poojaShareBtn.isEnabled = isPoojaSamagriActivated
    }
    
    func swapAudioCtlrView(play : Bool, setTextView : Bool) {
        
        if !isAudioPlayerSet {
            return
        }
        
        isAudioPlaying = play
        let audioCtlrImage = isAudioPlaying ? UIImage(named: "pauseWhite") : UIImage(named : "playWhite")
        
        poojaAudioTopCtlrBtn.setImage(audioCtlrImage, for: UIControlState.normal)
    }
    
    func getTotalAudioDuration(audioPathUrl: URL) -> Float64 {
        return CMTimeGetSeconds(AVURLAsset(url: audioPathUrl).duration)
    }
    
}

//Mark:- PoojaVidhi Download controller
extension PoojaDetailsViewController {
    
    func downloadAudioFromFB(audioFBSUrl: String, audioFileName: String) {
        do {
            let documentURL = try FileManager.default.url(for: .documentDirectory, in: .userDomainMask, appropriateFor: nil, create: true)
            let destinationURL = documentURL.appendingPathComponent(DownloadHelper().getLocalDownloadEndPath(urlString: audioFileName, kind: "poojaVidhi"))
            print("destinationURL \(destinationURL)")
            
            // Start the download (in this case writing to a file)
            let storageRef = storage.reference(forURL: audioFBSUrl)
            self.downloadTask = storageRef.write(toFile: destinationURL)
            
            isDownloading = true
            
            // Observe changes in status
            downloadTask?.observe(.resume) { snapshot in
                // Download resumed, also fires when the download starts
                print("download resumed")
            }
            
            downloadTask?.observe(.pause) { snapshot in
                // Download paused
                print("download paused")
            }
            
            downloadTask?.observe(.progress) { snapshot in
                // Download reported progress
                let percentComplete = 100.0 * Double(snapshot.progress!.completedUnitCount) / Double(snapshot.progress!.totalUnitCount)
                
                guard percentComplete.isNormal else {
                    return
                }
                
                self.audioDownloadLabel.text = "Downloading (\(String(format: "%.02f", percentComplete)) %)"
            }
            
            downloadTask?.observe(.success) { snapshot in
                // Download completed successfully
                print("download success")
                UserDefaults.standard.set(true, forKey: "\(audioFileName)_cacheKey")
                self.isDownloading = false
                self.setAudio(audioUrl: audioFileName)
                
                guard let previousDownloadPoojaAudioName = UserDefaults.standard.string(forKey: "previousDownloadPoojaAudioName"), previousDownloadPoojaAudioName != audioFileName else {
                    print("there is no previous audio file")
                    UserDefaults.standard.set(audioFileName, forKey: "previousDownloadPoojaAudioName")
                    return
                }
                
                print("About to delete old audio file")
                
                let deleted = DownloadHelper().deleteFileAtPath(endPath: previousDownloadPoojaAudioName, kind: "poojaVidhi")
                
                guard deleted else {
                    return
                }
                
                UserDefaults.standard.set(audioFileName, forKey: "previousDownloadPoojaAudioName")
                UserDefaults.standard.set(false, forKey: "\(previousDownloadPoojaAudioName)_cacheKey")
                
            }
            
            // Errors only occur in the "Failure" case
            downloadTask?.observe(.failure) { snapshot in
                guard let errorCode = (snapshot.error as? NSError)?.code else {
                    return
                }
                guard let error = FIRStorageErrorCode(rawValue: errorCode) else {
                    return
                }
                switch (error) {
                case .objectNotFound:
                    // File doesn't exist
                    print("download object not found")
                    break
                case .unauthorized:
                    // User doesn't have permission to access file
                    print("download unauthorized")
                    break
                case .cancelled:
                    // User cancelled the download
                    print("download cancelled")
                    break
                    
                    /* ... */
                    
                case .unknown:
                    // Unknown error occurred, inspect the server response
                    print("download unknown")
                    break
                default:
                    // Another error occurred. This is a good place to retry the download.
                    break
                }
            }
        } catch {
            print("Error occured while downloading file")
        }
    }
    
}
