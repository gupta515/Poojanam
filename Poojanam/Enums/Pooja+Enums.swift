//
//  Pooja+Enums.swift
//  Poojanam
//
//  Created by Gupta on 05/02/17.
//  Copyright © 2017 Gupta. All rights reserved.
//

import Foundation

enum LocalLanguage : String {
    
    case MarathiMangalagauriPooja = "marathi_mangalagauri_pooja"
    case MarathiSatyanarayanaPooja = "marathi_satyanarayan_pooja"
    case MarathiParthivGanapathiPooja = "marathi_parthivGanapathi_pooja"
    
    var title : String {
        
        switch self {
            
        case .MarathiMangalagauriPooja:
            return "मंगलागौरी पूजा"
            
        case .MarathiParthivGanapathiPooja:
            return "श्री पार्थिवगणपती पूजा "
            
        case .MarathiSatyanarayanaPooja:
            return "श्रीसत्यनारायण पूजा"
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

}
