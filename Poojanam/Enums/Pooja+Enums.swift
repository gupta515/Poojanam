//
//  Pooja+Enums.swift
//  Poojanam
//
//  Created by Gupta on 05/02/17.
//  Copyright © 2017 Gupta. All rights reserved.
//

import Foundation

enum Pooja : String {
    
    case MarathiMangalagauriPooja = "Mangalagauri Pooja_Marathi"
    case MarathiSatyanarayanaPooja = "Satyanarayana Pooja_Marathi"
    case MarathiParthivGanapathiPooja = "Parthiv Ganapathi Pooja_Marathi"
    
    var title : String {
        
        switch self {
            
        case .MarathiMangalagauriPooja:
            return "मंगलागौरी पूजा"
            
        case .MarathiParthivGanapathiPooja:
            return "श्री पार्थिवगणपती पूजा"
            
        case .MarathiSatyanarayanaPooja:
            return "श्रीसत्यनारायण पूजा"
        }
    }
    
    var image : String {
        
        switch self {
            
        case .MarathiMangalagauriPooja:
            return "mangalagauri"
            
        case .MarathiParthivGanapathiPooja:
            return "ganesh"
            
        case .MarathiSatyanarayanaPooja:
            return "satyanarayana"
        }
    }
    
    var samagri : String {
        
        switch self {
            
        case .MarathiMangalagauriPooja:
            return "marathi_mangalagauri_pooja_samagri"
            
        case .MarathiParthivGanapathiPooja:
            return "marathi_parthivGanapathi_pooja_samagri"
            
        case .MarathiSatyanarayanaPooja:
            return "marathi_satyanarayan_pooja_samagri"
        }
    }
    
    var audio : String {
        
        switch self {
            
        case .MarathiMangalagauriPooja:
            return "marathi_mangalagauri_pooja"
            
        case .MarathiParthivGanapathiPooja:
            return "marathi_parthivGanapathi_pooja"
            
        case .MarathiSatyanarayanaPooja:
            return "marathi_satyanarayan_pooja"
        }
    }
    
    var audioBG : String {
        
        switch self {
            
        case .MarathiMangalagauriPooja:
            return "gaurimaathaBG"
            
        case .MarathiParthivGanapathiPooja:
            return "ganeshBG"
            
        case .MarathiSatyanarayanaPooja:
            return "gaurimaathaBG"
        }
    }
    
    var vidhi : String {
        
        switch self {
            
        case .MarathiMangalagauriPooja:
            return "marathi_mangalagauri_pooja_vidhi"
            
        case .MarathiParthivGanapathiPooja:
            return "marathi_parthivGanapathi_pooja_vidhi"
            
        case .MarathiSatyanarayanaPooja:
            return "marathi_satyanarayan_pooja_vidhi"
        }
    }
    
    var downloadFBS : String {
        
        switch self {
            
        case .MarathiMangalagauriPooja:
            return fbMarathiMangalagauriPoojaVidhi
            
        case .MarathiParthivGanapathiPooja:
            return fbMarathiParthivGanapathiPoojaVidhi
            
        case .MarathiSatyanarayanaPooja:
            return fbMarathiSatyanarayanPoojaVidhi
        }
    }
    
    var cacheKey : String {
        
        switch self {
            
        case .MarathiMangalagauriPooja:
            return "marathi_mangalagauri_pooja_cacheKey"
            
        case .MarathiParthivGanapathiPooja:
            return "marathi_parthivGanapathi_pooja_cacheKey"
            
        case .MarathiSatyanarayanaPooja:
            return "marathi_satyanarayan_pooja_cacheKey"
        }
    }
    
    var about : String {
        
        switch self {
            
        case .MarathiMangalagauriPooja:
            return "मंगलागौरी पूजा -(विषयि) माहिती"
            
        case .MarathiParthivGanapathiPooja:
            return "श्री पार्थिवगणपती - (विषयि) माहिती"
            
        case .MarathiSatyanarayanaPooja:
            return "श्रीसत्यनारायण पूजा - (विषयि) माहिती"
        }
    }
    
    var aboutText : String {
        
        switch self {
            
        case .MarathiMangalagauriPooja:
            return "marathi_mangalagauri_pooja_about"
            
        case .MarathiParthivGanapathiPooja:
            return "marathi_parthivGanapathi_pooja_about"
            
        case .MarathiSatyanarayanaPooja:
            return "marathi_satyanarayan_pooja_about"
        }
    }
    
    var benefits : String {
        
        switch self {
            
        case .MarathiMangalagauriPooja:
            return "मंगलागौरी पूजा-फायदे"
            
        case .MarathiParthivGanapathiPooja:
            return "श्री पार्थिवगणपती पूजा-फायदे"
            
        case .MarathiSatyanarayanaPooja:
            return "श्रीसत्यनारायण  पूजा-फायदे"
        }
    }
    
    var benefitsText : String {
        
        switch self {
            
        case .MarathiMangalagauriPooja:
            return "marathi_mangalagauri_pooja_benefits"
            
        case .MarathiParthivGanapathiPooja:
            return "marathi_parthivGanapathi_pooja_benefits"
            
        case .MarathiSatyanarayanaPooja:
            return "marathi_satyanarayan_pooja_benefits"
        }
    }
    
    var duration : String {
        
        switch self {
            
        case .MarathiMangalagauriPooja:
            return "मंगलागौरी पूजा कालावधि"
            
        case .MarathiParthivGanapathiPooja:
            return "श्री पार्थिवगणपती  पूजा कालावधि"
            
        case .MarathiSatyanarayanaPooja:
            return "श्रीसत्यनारायण पूजा कालावधि"
        }
    }
    
    var durationValue : String {
        
        switch self {
            
        case .MarathiMangalagauriPooja:
            return "00hr 45mins"
            
        case .MarathiParthivGanapathiPooja:
            return "01hr 00mins"
            
        case .MarathiSatyanarayanaPooja:
            return "01hr 15mins"
        }
    }
}
