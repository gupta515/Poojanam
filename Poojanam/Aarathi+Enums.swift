//
//  Aarathi+Enums.swift
//  Poojanam
//
//  Created by Gupta on 05/02/17.
//  Copyright © 2017 Gupta. All rights reserved.
//

import Foundation

enum Aarathi : String {
    
    case DattaAarathi           =   "Datta Aarathi"
    case DurgaDeviAarathi       =   "Durga Devi Aarathi"
    case GaneshAarathi          =   "Ganesh Aarathi"
    case MangalagauriAarathi    =   "Mangalagauri Aarathi"
    case SatyanarayanaAarathi   =   "Satyanarayana Aarathi"
    case ShankarAarathi         =   "Shankar Aarathi"
    case ShriMaruthiAarathi     =   "Shri Maruthi Aarathi"
    case ShriRamAarathi         =   "Shri Ram Aarathi"
    case VitthalAarathi         =   "Vitthal Aarathi"
    
    var title : String {
        
        switch self {
            
        case .DattaAarathi:
            return "दत्त आरती"
            
        case .DurgaDeviAarathi:
            return "दुर्गा देवि आरती"
            
        case .GaneshAarathi:
            return "गणेश आरती"
            
        case .MangalagauriAarathi:
            return "मंगलागौरी आरती"
            
        case .SatyanarayanaAarathi:
            return "श्रीसत्यनारायण आरती"
            
        case .ShankarAarathi:
            return "शंकर आरती"
            
        case .ShriMaruthiAarathi:
            return "श्री मारुती आरती"
            
        case .ShriRamAarathi:
            return "श्रीराम आरती"
            
        case .VitthalAarathi:
            return "विठ्ठल आरती"
            
        }
    }
    
    var image : String {
        
        switch self {
            
        case .DattaAarathi:
            return "datta"
            
        case .DurgaDeviAarathi:
            return "durga"
            
        case .GaneshAarathi:
            return "ganesh"
            
        case .MangalagauriAarathi:
            return "mangalagauri"
            
        case .SatyanarayanaAarathi:
            return "satyanarayana"
            
        case .ShankarAarathi:
            return "shiva"
            
        case .ShriMaruthiAarathi:
            return "hanuman"
            
        case .ShriRamAarathi:
            return "ram"
            
        case .VitthalAarathi:
            return "vittal"
            
        }
    }
    
    var textFile : String {
        
        switch self {
            
        case .DattaAarathi:
            return "marathi_datta_aarathi"
            
        case .DurgaDeviAarathi:
            return "marathi_durgaDevi_aarathi"
            
        case .GaneshAarathi:
            return "marathi_ganesh_aarathi"
            
        case .MangalagauriAarathi:
            return "marathi_mangalagauri_aarathi"
            
        case .SatyanarayanaAarathi:
            return "marathi_satyanarayanDev_aarathi"
            
        case .ShankarAarathi:
            return "marathi_shankar_aarathi"
            
        case .ShriMaruthiAarathi:
            return "marathi_shriMaruthi_aarathi"
            
        case .ShriRamAarathi:
            return "marathi_shriram_aarathi"
            
        case .VitthalAarathi:
            return "marathi_vitthal_aarathi"
            
        }
    }
    
}
