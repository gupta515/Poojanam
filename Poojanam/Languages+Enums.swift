//
//  Languages+Enums.swift
//  Poojanam
//
//  Created by Gupta on 05/02/17.
//  Copyright © 2017 Gupta. All rights reserved.
//

import Foundation

enum Language : String {
    
    case Marathi = "marathi"
    
    var keysList : [String] {
        
        switch self {
            
        case .Marathi:
            return ["Mangalagauri Pooja_Marathi", "Parthiv Ganapathi Pooja_Marathi", "Satyanarayana Pooja_Marathi"]
        }
    }
}
