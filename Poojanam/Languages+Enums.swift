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
        
        switch self {
            
        case .Marathi:
            return PoojaList(rawValue: self.rawValue)!
        }
    }
    
    var aarathiList : AarathiList {
        
        switch self {
            
        case .Marathi:
            return AarathiList(rawValue: self.rawValue)!
        }
    }
    
    var stotramList : StotramList {
        
        switch self {
            
        case .Marathi:
            return StotramList(rawValue: self.rawValue)!
        }
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

enum StotramList : String {
    
    case Marathi = "marathi"
    
    var keyList : [String] {
        
        switch self {
            
        case .Marathi:
            return ["Ganpati Atharvashisha Stotram_Marathi", "Ganpati Sukta Stotram_Marathi", "Mahalakshmi Ashtak Stotram_Marathi", "Maruti Stotram_Marathi", "Navgraha Stotram_Marathi", "Purusha Sukta Stotram_Marathi", "Ramraksha Stotram_Marathi", "Rudra Adhyay Stotram_Marathi", "Sankat Nashan Ganesh Stotram_Marathi", "Shani Stotram_Marathi", "Shri Sukta Stotram_Marathi", "Sour Sukta Stotram_Marathi", "Dattatreya Kashta Nashak Stotram_Marathi"]
        }
    }
}
