//
//  Stotram+Enums.swift
//  Poojanam
//
//  Created by Gupta on 05/02/17.
//  Copyright © 2017 Gupta. All rights reserved.
//

import Foundation

enum Stotram : String {
    
    case    MarathiGanpatiAtharvashishaStotram      =   "Ganpati Atharvashisha Stotram_Marathi"
    case    MarathiGanpatiSuktaStotram              =   "Ganpati Sukta Stotram_Marathi"
    case    MarathiMahalakshmiAshtakStotram         =   "Mahalakshmi Ashtak Stotram_Marathi"
    case    MarathiMarutiStotram                    =   "Maruti Stotram_Marathi"
    case    MarathiNavgrahaStotram                  =   "Navgraha Stotram_Marathi"
    case    MarathiPurushaSuktaStotram              =   "Purusha Sukta Stotram_Marathi"
    case    MarathiRamrakshaStotram                 =   "Ramraksha Stotram_Marathi"
    case    MarathiRudraAdhyayStotram               =   "Rudra Adhyay Stotram_Marathi"
    case    MarathiSankatNashanGaneshStotram        =   "Sankat Nashan Ganesh Stotram_Marathi"
    case    MarathiShaniStotram                     =   "Shani Stotram_Marathi"
    case    MarathiShriSuktaStotram                 =   "Shri Sukta Stotram_Marathi"
    case    MarathiSourSuktaStotram                 =   "Sour Sukta Stotram_Marathi"
    case    MarathiDattatreyaKashtaNashakStotram    =   "Dattatreya Kashta Nashak Stotram_Marathi"
    
    var title : String {
        
        switch self {
            
        case .MarathiGanpatiAtharvashishaStotram:
            return "श्री गणपति अथर्वशीर्षम्"
        
        case .MarathiGanpatiSuktaStotram:
            return "श्री गणपति सूक्त्"
            
        case .MarathiMahalakshmiAshtakStotram:
            return "श्री महालक्ष्मी अष्टक्"
            
        case .MarathiMarutiStotram:
            return "मारुती स्तोत्र"
            
        case .MarathiNavgrahaStotram:
            return "नवग्रह स्तोत्र"
            
        case .MarathiPurushaSuktaStotram:
            return "पुरूष स्तोत्र"
            
        case .MarathiRamrakshaStotram:
            return "श्रीरामरक्षा स्तोत्र"
            
        case.MarathiRudraAdhyayStotram:
            return "रुद्र अध्याय् ( शिव रुद्र अध्याय् )"
            
        case .MarathiSankatNashanGaneshStotram:
            return "संकट नाशन गणेश स्तोत्र"
            
        case .MarathiShaniStotram:
            return "शनि स्तोत्र"
            
        case .MarathiShriSuktaStotram:
            return "श्री सुक्त्"
            
        case .MarathiSourSuktaStotram:
            return "सौर  सूक्त्"
            
        case .MarathiDattatreyaKashtaNashakStotram:
            return "दत्तात्रेय कष्ट नाशन स्तोत्र"
        }
    }
    
    var audio : String {
        
        switch self {
            
        case .MarathiGanpatiAtharvashishaStotram:
            return "marathi_ganpati_athravshisha_stotram"
            
        case .MarathiGanpatiSuktaStotram:
            return "marathi_ganpati_sukta_stotram"
            
        case .MarathiMahalakshmiAshtakStotram:
            return "marathi_mahalakshmi_ashtakam_stotram"
            
        case .MarathiMarutiStotram:
            return "marathi_maruti_stotram"
            
        case .MarathiNavgrahaStotram:
            return "marathi_navgraha_stotram"
            
        case .MarathiPurushaSuktaStotram:
            return "marathi_purusha_sukta_stotram"
            
        case .MarathiRamrakshaStotram:
            return "marathi_ramaraksha_stotram"
            
        case.MarathiRudraAdhyayStotram:
            return "marathi_rudra_adhyay_stotram"
            
        case .MarathiSankatNashanGaneshStotram:
            return "marathi_sankatnashan_ganesh_stotram"
            
        case .MarathiShaniStotram:
            return "marathi_shani_stotram"
            
        case .MarathiShriSuktaStotram:
            return "marathi_shri_stotram"
            
        case .MarathiSourSuktaStotram:
            return "marathi_sour_stotram"
            
        case .MarathiDattatreyaKashtaNashakStotram:
            return "marathi_dattatreya_kashta_nashak_stotram"
        }
    }
    
    var audioBG : String {
        
        switch self {
            
        case .MarathiGanpatiAtharvashishaStotram:
            return "ganeshBG"
            
        case .MarathiGanpatiSuktaStotram:
            return "ganeshBG"
            
        case .MarathiMahalakshmiAshtakStotram:
            return "lakshmiBG"
            
        case .MarathiMarutiStotram:
            return "hanumanBG"
            
        case .MarathiNavgrahaStotram:
            return "ganeshBG"
            
        case .MarathiPurushaSuktaStotram:
            return "ganeshBG"
            
        case .MarathiRamrakshaStotram:
            return "ganeshBG"
            
        case.MarathiRudraAdhyayStotram:
            return "ganeshBG"
            
        case .MarathiSankatNashanGaneshStotram:
            return "ganeshBG"
            
        case .MarathiShaniStotram:
            return "ganeshBG"
            
        case .MarathiShriSuktaStotram:
            return "ganeshBG"
            
        case .MarathiSourSuktaStotram:
            return "ganeshBG"
            
        case .MarathiDattatreyaKashtaNashakStotram:
            return "dattaBG"
        }
    }
    
    var durationValue : String {
        
        switch self {
            
        case .MarathiGanpatiAtharvashishaStotram:
            return "07 mins"
            
        case .MarathiGanpatiSuktaStotram:
            return "03 mins"
            
        case .MarathiMahalakshmiAshtakStotram:
            return "03 mins"
            
        case .MarathiMarutiStotram:
            return "03 mins"
            
        case .MarathiNavgrahaStotram:
            return "03 mins"
            
        case .MarathiPurushaSuktaStotram:
            return "07 mins"
            
        case .MarathiRamrakshaStotram:
            return "06 mins"
            
        case.MarathiRudraAdhyayStotram:
            return "23 mins"
            
        case .MarathiSankatNashanGaneshStotram:
            return "02 mins"
            
        case .MarathiShaniStotram:
            return "04 mins"
            
        case .MarathiShriSuktaStotram:
            return "08 mins"
            
        case .MarathiSourSuktaStotram:
            return "15 mins"
            
        case .MarathiDattatreyaKashtaNashakStotram:
            return "03 mins"
        }
    }
    
    var downloadFBS : String {
        
        switch self {
            
        case .MarathiGanpatiAtharvashishaStotram:
            return fbMarathiGanapathiAtharvashishaStotram
            
        case .MarathiGanpatiSuktaStotram:
            return fbMarathiGanapathiSuktaStotram
            
        case .MarathiMahalakshmiAshtakStotram:
            return fbMarathiMahalakshmiAsthakStotram
            
        case .MarathiMarutiStotram:
            return fbMarathiMaruthiStotram
            
        case .MarathiNavgrahaStotram:
            return fbMarathiNavgrahStotram
            
        case .MarathiPurushaSuktaStotram:
            return fbMarathiPurushaStotram
            
        case .MarathiRamrakshaStotram:
            return fbMarathiRamrakshaStotram
            
        case.MarathiRudraAdhyayStotram:
            return fbMarathiRudraAdhyayStotram
            
        case .MarathiSankatNashanGaneshStotram:
            return fbMarathiSankatNashanGaneshStotram
            
        case .MarathiShaniStotram:
            return fbMarathiShaniStotram
            
        case .MarathiShriSuktaStotram:
            return fbMarathiShriStotram
            
        case .MarathiSourSuktaStotram:
            return fbMarathiSourStotram
            
        case .MarathiDattatreyaKashtaNashakStotram:
            return fbMarathiDattatreyaKashtaNashakStotram
        }
    }
    
    var cacheKey : String {
        
        switch self {
            
        case .MarathiGanpatiAtharvashishaStotram:
            return "marathi_ganpati_athravshisha_stotram_cacheKey"
            
        case .MarathiGanpatiSuktaStotram:
            return "marathi_ganpati_sukta_stotram_cacheKey"
            
        case .MarathiMahalakshmiAshtakStotram:
            return "marathi_mahalakshmi_ashtakam_stotram_cacheKey"
            
        case .MarathiMarutiStotram:
            return "marathi_maruti_stotram_cacheKey"
            
        case .MarathiNavgrahaStotram:
            return "marathi_navgraha_stotram_cacheKey"
            
        case .MarathiPurushaSuktaStotram:
            return "marathi_purusha_sukta_stotram_cacheKey"
            
        case .MarathiRamrakshaStotram:
            return "marathi_ramaraksha_stotram_cacheKey"
            
        case.MarathiRudraAdhyayStotram:
            return "marathi_rudra_adhyay_stotram_cacheKey"
            
        case .MarathiSankatNashanGaneshStotram:
            return "marathi_sankatnashan_ganesh_stotram_cacheKey"
            
        case .MarathiShaniStotram:
            return "marathi_shani_stotram_cacheKey"
            
        case .MarathiShriSuktaStotram:
            return "marathi_shri_stotram_cacheKey"
            
        case .MarathiSourSuktaStotram:
            return "marathi_sour_stotram_cacheKey"
            
        case .MarathiDattatreyaKashtaNashakStotram:
            return "marathi_dattatreya_kashta_nashak_stotram_cacheKey"
        }
    }
}
