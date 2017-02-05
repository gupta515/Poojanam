//
//  Aarathi+Enums.swift
//  Poojanam
//
//  Created by Gupta on 05/02/17.
//  Copyright © 2017 Gupta. All rights reserved.
//

import Foundation

enum Aarathi : String {
    
    case MarathiDattaAarathi           =   "Datta Aarathi_Marathi"
    case MarathiDurgaDeviAarathi       =   "Durga Devi Aarathi_Marathi"
    case MarathiGaneshAarathi          =   "Ganesh Aarathi_Marathi"
    case MarathiMangalagauriAarathi    =   "Mangalagauri Aarathi_Marathi"
    case MarathiSatyanarayanaAarathi   =   "Satyanarayana Aarathi_Marathi"
    case MarathiShankarAarathi         =   "Shankar Aarathi_Marathi"
    case MarathiShriMaruthiAarathi     =   "Shri Maruthi Aarathi_Marathi"
    case MarathiShriRamAarathi         =   "Shri Ram Aarathi_Marathi"
    case MarathiVitthalAarathi         =   "Vitthal Aarathi_Marathi"
    
    var title : String {
        
        switch self {
            
        case .MarathiDattaAarathi:
            return "दत्त आरती"
            
        case .MarathiDurgaDeviAarathi:
            return "दुर्गा देवि आरती"
            
        case .MarathiGaneshAarathi:
            return "गणेश आरती"
            
        case .MarathiMangalagauriAarathi:
            return "मंगलागौरी आरती"
            
        case .MarathiSatyanarayanaAarathi:
            return "श्रीसत्यनारायण आरती"
            
        case .MarathiShankarAarathi:
            return "शंकर आरती"
            
        case .MarathiShriMaruthiAarathi:
            return "श्री मारुती आरती"
            
        case .MarathiShriRamAarathi:
            return "श्रीराम आरती"
            
        case .MarathiVitthalAarathi:
            return "विठ्ठल आरती"
            
        }
    }
    
    var image : String {
        
        switch self {
            
        case .MarathiDattaAarathi:
            return "datta"
            
        case .MarathiDurgaDeviAarathi:
            return "durga"
            
        case .MarathiGaneshAarathi:
            return "ganesh"
            
        case .MarathiMangalagauriAarathi:
            return "mangalagauri"
            
        case .MarathiSatyanarayanaAarathi:
            return "satyanarayana"
            
        case .MarathiShankarAarathi:
            return "shiva"
            
        case .MarathiShriMaruthiAarathi:
            return "hanuman"
            
        case .MarathiShriRamAarathi:
            return "ram"
            
        case .MarathiVitthalAarathi:
            return "vittal"
            
        }
    }
    
    var textFile : String {
        
        switch self {
            
        case .MarathiDattaAarathi:
            return "marathi_datta_aarathi"
            
        case .MarathiDurgaDeviAarathi:
            return "marathi_durgaDevi_aarathi"
            
        case .MarathiGaneshAarathi:
            return "marathi_ganesh_aarathi"
            
        case .MarathiMangalagauriAarathi:
            return "marathi_mangalagauri_aarathi"
            
        case .MarathiSatyanarayanaAarathi:
            return "marathi_satyanarayanDev_aarathi"
            
        case .MarathiShankarAarathi:
            return "marathi_shankar_aarathi"
            
        case .MarathiShriMaruthiAarathi:
            return "marathi_shriMaruthi_aarathi"
            
        case .MarathiShriRamAarathi:
            return "marathi_shriram_aarathi"
            
        case .MarathiVitthalAarathi:
            return "marathi_vitthal_aarathi"
            
        }
    }
    
}
