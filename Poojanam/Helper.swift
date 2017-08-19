//
//  Helper.swift
//  Poojanam
//
//  Created by Gupta on 02/11/16.
//  Copyright © 2016 Gupta. All rights reserved.
//

import Foundation
import UIKit
import SwiftyJSON

class Helper {
    
    class func getAppVersionDictionary() -> NSDictionary {
        return ["version": Bundle.main.infoDictionary?["CFBundleShortVersionString"] as? String ?? "NA", "build": Bundle.main.infoDictionary?[kCFBundleVersionKey as String] as? String ?? "NA"]
    }
    
    static func getAppVersionFullString() -> String {
        
        let appInfo = getAppVersionDictionary()
        return "\(appInfo["version"] as? String ?? "")(\(appInfo["build"] as? String ?? ""))"
    }
    
    class func isAppUpdated() -> Bool {
        
        let userAppVersion = Bundle.main.infoDictionary?["CFBundleShortVersionString"] as? String ?? "NA"
        
        var storeAppVersion = UserDefaults.standard.string(forKey: "AppStore_AppVersionNumber") ?? "NA"
        
        if let url = URL(string: "http://itunes.apple.com/lookup?bundleId=com.sunsirius.Poojanam"), let data = try? Data(contentsOf: url) {
            
            if let lookup = JSON(data).dictionary, lookup["resultCount"]?.intValue == 1, let currentVersion = lookup["results"]?[0]["version"].string {
                storeAppVersion = currentVersion
                UserDefaults.standard.set(currentVersion, forKey: "AppStore_AppVersionNumber")
            }
        }
        
        return !(storeAppVersion.compare(userAppVersion, options: .numeric) == .orderedDescending)
    }
    
}

class TextFiles {
    func getTextFromFile(fileName: String, fileExtension: String = "rtf") -> NSAttributedString? {
        if let rtfPath = Bundle.main.url(forResource: fileName, withExtension: fileExtension) {
            do {
                return try NSAttributedString(url: rtfPath, options: [NSDocumentTypeDocumentAttribute : NSRTFTextDocumentType], documentAttributes: nil)
            } catch {
                print("No rtf content found!")
                return nil
            }
        }
        return nil
    }
}

class Validator {
    func isEmpty(string: String?) -> Bool {
        guard let str = string else {
            return true
        }
        return str.trimmingCharacters(in: .whitespacesAndNewlines).characters.count <= 0
    }
}

class URLHandler {
    func getLastComponent(urlString: String) -> String {
        guard let fileUrl = URL(string: urlString) else {
            return ""
        }
        return fileUrl.lastPathComponent
    }
}

class DownloadHelper {
    
    func getLocalDownloadEndPath(urlString: String, kind: String) -> String {
        
        guard let language = UserDefaults.standard.string(forKey: "selectedLanguage") else {
            return ""
        }
        
        return "download/\(language.lowercased() )/\(kind)/\(urlString).m4a"
    }
    
    func getLocalDownloadFilePath(endPath: String, kind: String) -> URL? {
        
        guard let filePath =  NSSearchPathForDirectoriesInDomains(.documentDirectory, .userDomainMask, true).first else {
            return nil
        }

        guard let urlPath =  NSURL(fileURLWithPath: filePath, isDirectory: true).appendingPathComponent("/" + getLocalDownloadEndPath(urlString: endPath, kind: kind) )?.path, let reqURL = NSURL(string: urlPath)  as? URL else {
            return nil
        }

        return reqURL
        
    }
    
    func deleteFileAtPath(endPath: String, kind: String) -> Bool {

        let fileManager = FileManager.default

        do {
            let documentURL = try fileManager.url(for: .documentDirectory, in: .userDomainMask, appropriateFor: nil, create: true)
            let destinationURL = documentURL.appendingPathComponent(getLocalDownloadEndPath(urlString: endPath, kind: "poojaVidhi"))
            print("delete file url \(destinationURL)")
            try fileManager.removeItem(at: destinationURL)
            return true
        } catch let error as NSError {
            print(error.localizedDescription)
        }
        return false
    }
    
}
