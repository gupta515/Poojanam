//
//  Languages+Enums.swift
//  Poojanam
//
//  Created by Gupta on 05/02/17.
//  Copyright © 2017 Gupta. All rights reserved.
//

import Foundation

enum Langauge : String {
    
    case Marathi = "marathi"
    
    var titleWithLocal : String {
        return "मराठी (Marathi)"
    }
    
    var poojasList : PoojaList {
        return PoojaList(rawValue: self.rawValue)!
    }
    
    var aarathiList : AarathiList {
        return AarathiList(rawValue: self.rawValue)!
    }
    
}

enum PoojaList : String {
    
    case Marathi = "marathi"

    var keysList : [String] {
        
        switch self {
            
        case .Marathi:
            return ["Mangalagauri Pooja_Marathi", "Parthiv Ganapathi Pooja_Marathi", "Satyanarayana Pooja_Marathi"]
        }
    }
}

enum AarathiList : String {
    
    case Marathi = "marathi"
    
    var keyList : [String] {
        
        switch self {
            
        case .Marathi:
            return ["Datta Aarathi_Marathi", "Durga Devi Aarathi_Marathi", "Ganesh Aarathi_Marathi", "Mangalagauri Aarathi_Marathi", "Satyanarayana Aarathi_Marathi", "Shankar Aarathi_Marathi", "Shri Maruthi Aarathi_Marathi", "Shri Ram Aarathi_Marathi", "Vitthal Aarathi_Marathi"]
        }
    }
}
