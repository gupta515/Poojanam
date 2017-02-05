//
//  PoojanamInfo.swift
//  Poojanam
//
//  Created by Gupta on 19/09/16.
//  Copyright © 2016 Gupta. All rights reserved.
//

import Foundation

let languagesAvailable = ["Hindi","Marathi","Telugu","Tamil"]

//Mark:- Pooja's INFO

// Marathi Pooja's


let marathi_pooja_mangalagauri : [String:String] = [ "audio":"marathi_mangalagauri_pooja",   "name":"Mangalagauri Pooja", "image":"mangalagauri", "samagri":"marathi_mangalagauri_pooja_samagri", "vidhi":"marathi_mangalagauri_pooja_vidhi", "downloadFBUrl": fbMarathiMangalagauriPoojaVidhi, "cacheKey": "marathi_mangalagauri_pooja_cacheKey", "audioBG": "gaurimaathaBG"]

let marathi_pooja_parthivGanapathi : [String:String] = [ "audio":"marathi_parthivGanapathi_pooja",   "name":"Parthiv Ganapathi", "image":"ganesh", "samagri":"marathi_parthivGanapathi_pooja_samagri", "vidhi":"marathi_parthivGanapathi_pooja_vidhi", "downloadFBUrl": fbMarathiParthivGanapathiPoojaVidhi, "cacheKey": "marathi_parthivGanapathi_pooja_cacheKey", "audioBG": "ganeshBG"]

let marathi_pooja_satyanarayana : [String:String] = [ "audio": "marathi_satyanarayan_pooja", "name": "Satyanarayana Pooja",
                                                     "samagri": "marathi_satyanarayan_pooja_samagri",
                                                     "vidhi": "marathi_satyanarayan_pooja_vidhi", "downloadFBUrl": fbMarathiSatyanarayanPoojaVidhi, "cacheKey": "marathi_satyanarayan_pooja_cacheKey", "audioBG": "gaurimaathaBG"]

let marathi_poojas : [String:[String:String]] = ["Satyanarayana Pooja_Marathi":marathi_pooja_satyanarayana, "Mangalagauri Pooja_Marathi":marathi_pooja_mangalagauri, "Parthiv Ganapathi Pooja_Marathi": marathi_pooja_parthivGanapathi]

// All Pooja's
let poojaDataDicts : [String:[String:String]] = ["Satyanarayana Pooja_Marathi":marathi_pooja_satyanarayana, "Mangalagauri Pooja_Marathi":marathi_pooja_mangalagauri, "Parthiv Ganapathi Pooja_Marathi": marathi_pooja_parthivGanapathi]

let allPoojas : [String:[String:[String:String]]] = ["marathi":marathi_poojas]

//MARK:- Stotram INFO

//MARK:- Marathi Stotrams
let marathi_stotram_ganpati_atharvashisha : [String:String] = ["audio":"marathi_ganpati_athravshisha_stotram", "duration":"07 mins", "downloadFBUrl": fbMarathiGanapathiAtharvashishaStotram, "cacheKey": "marathi_ganpati_athravshisha_stotram_cacheKey"]

let marathi_stotram_ganpati_sukta : [String:String] = ["audio":"marathi_ganpati_sukta_stotram", "duration":"03 mins", "downloadFBUrl": fbMarathiGanapathiSuktaStotram, "cacheKey": "marathi_ganpati_sukta_stotram_cacheKey"]

let marathi_stotram_mahalakshmi_ashtakam : [String:String] = ["audio":"marathi_mahalakshmi_ashtakam_stotram", "duration":"03 mins", "downloadFBUrl": fbMarathiMahalakshmiAsthakStotram, "cacheKey": "marathi_mahalakshmi_ashtakam_stotram_cacheKey"]

let marathi_stotram_maruti : [String:String] = ["audio":"marathi_maruti_stotram", "duration":"03 mins", "downloadFBUrl": fbMarathiMaruthiStotram, "cacheKey": "marathi_maruti_stotram_cacheKey"]

let marathi_stotram_navgraha : [String:String] = ["audio":"marathi_navgraha_stotram", "duration":"03 mins", "downloadFBUrl": fbMarathiNavgrahStotram, "cacheKey": "marathi_navgraha_stotram_cacheKey"]

let marathi_stotram_purusha_sukta : [String:String] = ["audio":"marathi_purusha_sukta_stotram", "duration":"07 mins", "downloadFBUrl": fbMarathiPurushaStotram, "cacheKey": "marathi_purusha_sukta_stotram_cacheKey"]

let marathi_stotram_ramaraksha : [String:String] = ["audio":"marathi_ramaraksha_stotram", "duration":"06 mins", "downloadFBUrl": fbMarathiRamrakshaStotram, "cacheKey": "marathi_ramaraksha_stotram_cacheKey"]

let marathi_stotram_rudra_adhyay : [String:String] = ["audio":"marathi_rudra_adhyay_stotram", "duration":"23 mins", "downloadFBUrl": fbMarathiRudraAdhyayStotram, "cacheKey": "marathi_rudra_adhyay_stotram_cacheKey"]

let marathi_stotram_sankatnashan_ganesh : [String:String] = ["audio":"marathi_sankatnashan_ganesh_stotram", "duration":"02 mins", "downloadFBUrl": fbMarathiSankatNashanGaneshStotram, "cacheKey": "marathi_sankatnashan_ganesh_stotram_cacheKey"]

let marathi_stotram_shani : [String:String] = ["audio":"marathi_shani_stotram", "duration":"04 mins", "downloadFBUrl": fbMarathiShaniStotram, "cacheKey": "marathi_shani_stotram_cacheKey"]

let marathi_stotram_shri_stotram : [String:String] = ["audio":"marathi_shri_stotram", "duration":"08 mins", "downloadFBUrl": fbMarathiShriStotram, "cacheKey": "marathi_shri_stotram_cacheKey"]

let marathi_stotram_sour : [String:String] = ["audio":"marathi_sour_stotram", "duration":"15 mins", "downloadFBUrl": fbMarathiSourStotram, "cacheKey": "marathi_sour_stotram_cacheKey"]

let marathi_stotram_dattatreya_kashta_nashak : [String:String] = ["audio":"marathi_dattatreya_kashta_nashak_stotram", "duration":"03 mins", "downloadFBUrl": fbMarathiDattatreyaKashtaNashakStotram, "cacheKey": "marathi_dattatreya_kashta_nashak_stotram_cacheKey"]

let marathi_stotrams : [String] = ["Ganpati Atharvashisha", "Ganpati Sukta", "Mahalakshmi Ashtak", "Maruti Stotram", "Navgraha Stotram", "Purusha Sukta", "Ramraksha Stotra", "Rudra Adhyay", "Sankat Nashan GaneshStotra", "Shani Stotra", "Shri Sukta", "Sour Sukta", "Dattatreya Kashta Nashak"]

let stotramDataDict : [String: [String:String]] = ["Ganpati Atharvashisha": marathi_stotram_ganpati_atharvashisha, "Ganpati Sukta": marathi_stotram_ganpati_sukta, "Mahalakshmi Ashtak": marathi_stotram_mahalakshmi_ashtakam, "Maruti Stotram":marathi_stotram_maruti, "Navgraha Stotram": marathi_stotram_navgraha, "Purusha Sukta": marathi_stotram_purusha_sukta, "Ramraksha Stotra": marathi_stotram_ramaraksha, "Rudra Adhyay": marathi_stotram_rudra_adhyay, "Sankat Nashan GaneshStotra": marathi_stotram_sankatnashan_ganesh, "Shani Stotra": marathi_stotram_shani, "Shri Sukta": marathi_stotram_shri_stotram, "Sour Sukta": marathi_stotram_sour, "Dattatreya Kashta Nashak": marathi_stotram_dattatreya_kashta_nashak]

let allStotrams : [String: [String]] = ["marathi" :  marathi_stotrams]
