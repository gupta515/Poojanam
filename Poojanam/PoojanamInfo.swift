//
//  PoojanamInfo.swift
//  Poojanam
//
//  Created by Gupta on 19/09/16.
//  Copyright © 2016 Gupta. All rights reserved.
//

import Foundation

let languagesAvailable = ["Hindi","Marathi","Telugu","Tamil"]

let satyanarayanapoojavidhi = "https://firebasestorage.googleapis.com/v0/b/poojanam-d5278.appspot.com/o/audio%2Fmarathi%2Fpoojavidhi%2Fsatyanarayanpooja%20.m4a?alt=media&token=48bfc778-afa6-48e7-9ebf-48defd4fa8d8"

//Mark:- Pooja's INFO

// Marathi Pooja's
let marathi_pooja_satyanarayana : [String:String] = ["about":"marathi_satyanarayan_pooja_about", "audio":"marathi_satyanarayan_pooja", "benefits":"marathi_satyanarayan_pooja_benefits", "duration":"01hr 15mins", "name":"Satyanarayana Pooja",
    "image":"satyanarayana",
    "samagri":"marathi_satyanarayan_pooja_samagri",
    "vidhi":"marathi_satyanarayan_pooja_vidhi"]

let marathi_pooja_mangalagauri : [String:String] = ["about":"marathi_mangalagauri_pooja_about", "audio":"marathi_mangalagauri_pooja", "benefits":"marathi_mangalagauri_pooja_benefits", "duration":"00hr 45mins", "name":"Mangalagauri Pooja", "image":"mangalagauri", "samagri":"marathi_mangalagauri_pooja_samagri", "vidhi":"marathi_mangalagauri_pooja_vidhi"]

let marathi_pooja_parthivGanapathi : [String:String] = ["about":"marathi_parthivGanapathi_pooja_about", "audio":"marathi_parthivGanapathi_pooja", "benefits":"marathi_parthivGanapathi_pooja_benefits", "duration":"01hr 00mins", "name":"Parthiv Ganapathi", "image":"ganesh", "samagri":"marathi_parthivGanapathi_pooja_samagri", "vidhi":"marathi_parthivGanapathi_pooja_vidhi"]

let marathi_poojas : [String:[String:String]] = ["Satyanarayana Pooja":marathi_pooja_satyanarayana, "Mangalagauri Pooja":marathi_pooja_mangalagauri, "Parthiv Ganapathi": marathi_pooja_parthivGanapathi]

// All Pooja's
let poojaDataDicts : [String:[String:String]] = ["Satyanarayana Pooja":marathi_pooja_satyanarayana, "Mangalagauri Pooja":marathi_pooja_mangalagauri, "Parthiv Ganapathi": marathi_pooja_parthivGanapathi]

let allPoojas : [String:[String:[String:String]]] = ["marathi":marathi_poojas]

//Mark:- Aarathi INFO

//Mark:- Marathi aarathi
let  marathi_datta_aarathi : [String: String] = ["text": "marathi_datta_aarathi", "image": "aarathi_inactive"]
let  marathi_durgaDevi_aarathi : [String: String] = ["text": "marathi_durgaDevi_aarathi", "image": "durga" ]
let  marathi_ganesh_aarathi : [String: String] = ["text": "marathi_ganesh_aarathi", "image": "ganesh"]
let  marathi_mangalagauri_aarathi : [String: String] = ["text": "marathi_mangalagauri_aarathi", "image": "mangalagauri"]
let  marathi_satyanarayanDev_aarathi : [String: String] = ["text": "marathi_satyanarayanDev_aarathi", "image": "satyanarayana"]
let  marathi_shankar_aarathi : [String: String] = ["text": "marathi_shankar_aarathi", "image": "shiva"]
let  marathi_shriMaruthi_aarathi : [String: String] = ["text": "marathi_shriMaruthi_aarathi", "image": "aarathi_inactive"]
let  marathi_shriram_aarathi : [String: String] = ["text": "marathi_shriram_aarathi", "image": "aarathi_inactive"]
let  marathi_vitthal_aarathi : [String: String] = ["text": "marathi_vitthal_aarathi", "image": "aarathi_inactive"]

let marathi_aarathis: [String] = ["Datta Aarathi", "Durga Devi Aarathi", "Ganesh Aarathi", "Mangalagauri Aarathi", "Satyanarayana Aarathi", "Shankar Aarathi", "Shri Maruthi Aarathi", "Shri Ram Aarathi", "Vitthal Aarathi"]

let aarathiDataDict : [String: [String: String]] = ["Datta Aarathi" : marathi_datta_aarathi, "Durga Devi Aarathi": marathi_durgaDevi_aarathi, "Ganesh Aarathi": marathi_ganesh_aarathi, "Mangalagauri Aarathi": marathi_mangalagauri_aarathi, "Satyanarayana Aarathi": marathi_satyanarayanDev_aarathi, "Shankar Aarathi": marathi_shankar_aarathi, "Shri Maruthi Aarathi": marathi_shriMaruthi_aarathi, "Shri Ram Aarathi": marathi_shriram_aarathi, "Vitthal Aarathi": marathi_vitthal_aarathi]

let allAarathis : [String: [String]] = ["marathi": marathi_aarathis]

//MARK:- Stotram INFO

//MARK:- Marathi Stotrams
let marathi_stotram_ganpati_atharvashisha : [String:String] = ["audio":"marathi_ganpati_athravshisha_stotram", "duration":"07 mins"]

let marathi_stotram_ganpati_sukta : [String:String] = ["audio":"marathi_ganpati_sukta_stotram", "duration":"03 mins"]

let marathi_stotram_mahalakshmi_ashtakam : [String:String] = ["audio":"marathi_mahalakshmi_ashtakam_stotram", "duration":"03 mins"]

let marathi_stotram_maruti : [String:String] = ["audio":"marathi_maruti_stotram", "duration":"03 mins"]

let marathi_stotram_navgraha : [String:String] = ["audio":"marathi_navgraha_stotram", "duration":"03 mins"]

let marathi_stotram_purusha_sukta : [String:String] = ["audio":"marathi_purusha_sukta_stotram", "duration":"07 mins"]

let marathi_stotram_ramaraksha : [String:String] = ["audio":"marathi_ramaraksha_stotram", "duration":"06 mins"]

let marathi_stotram_rudra_adhyay : [String:String] = ["audio":"marathi_rudra_adhyay_stotram", "duration":"23 mins"]

let marathi_stotram_sankatnashan_ganesh : [String:String] = ["audio":"marathi_sankatnashan_ganesh_stotram", "duration":"02 mins"]

let marathi_stotram_shani : [String:String] = ["audio":"marathi_shani_stotram", "duration":"04 mins"]

let marathi_stotram_shri_stotram : [String:String] = ["audio":"marathi_shri_stotram", "duration":"08 mins"]

let marathi_stotram_sour : [String:String] = ["audio":"marathi_sour_stotram", "duration":"15 mins"]

let marathi_stotram_dattatreya_kashta_nashak : [String:String] = ["audio":"marathi_dattatreya_kashta_nashak_stotram", "duration":"03 mins"]

let marathi_stotrams : [String] = ["Ganpati Atharvashisha", "Ganpati Sukta", "Mahalakshmi Ashtak", "Maruti Stotram", "Navgraha Stotram", "Purusha Sukta", "Ramraksha Stotra", "Rudra Adhyay", "Sankat Nashan GaneshStotra", "Shani Stotra", "Shri Sukta", "Sour Sukta", "Dattatreya Kashta Nashak"]

let stotramDataDict : [String: [String:String]] = ["Ganpati Atharvashisha": marathi_stotram_ganpati_atharvashisha, "Ganpati Sukta": marathi_stotram_ganpati_sukta, "Mahalakshmi Ashtak": marathi_stotram_mahalakshmi_ashtakam, "Maruti Stotram":marathi_stotram_maruti, "Navgraha Stotram": marathi_stotram_navgraha, "Purusha Sukta": marathi_stotram_purusha_sukta, "Ramraksha Stotra": marathi_stotram_ramaraksha, "Rudra Adhyay": marathi_stotram_rudra_adhyay, "Sankat Nashan GaneshStotra": marathi_stotram_sankatnashan_ganesh, "Shani Stotra": marathi_stotram_shani, "Shri Sukta": marathi_stotram_shri_stotram, "Sour Sukta": marathi_stotram_sour, "Dattatreya Kashta Nashak": marathi_stotram_dattatreya_kashta_nashak]

let allStotrams : [String: [String]] = ["marathi" :  marathi_stotrams]
