//
//  Helper.swift
//  Poojanam
//
//  Created by Gupta on 02/11/16.
//  Copyright © 2016 Gupta. All rights reserved.
//

import Foundation
import UIKit

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
