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

