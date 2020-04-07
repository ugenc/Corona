////
////  DunyaFonk.swift
////  Korona
////
////  Created by Ugur Genc on 7.04.2020.
////  Copyright © 2020 Bug Design. All rights reserved.
////
//
//import Foundation
//import Alamofire
//import SwiftyJSON
//
//
//func TurkiyeFonk() -> (Int, Int, Int){
//    
//    
//    AF.request("https://covidapi.info/api/v1/latest-date").response { tarihCevap in
//        
//        if let data = tarihCevap.data, let utf8Text = String(data: data, encoding: .utf8) {
//            SonGun.sonGun = utf8Text
//        }
//    }
//    
//    
//    AF.request("https://covidapi.info/api/v1/country/TUR/latest").responseJSON { turkiyeCevap in
//        switch turkiyeCevap.result {
//        case .success(let value):
//            
//            let json = JSON(value)
//            tur.olum = json["result"][SonGun.sonGun]["deaths"].intValue
//            tur.iyi = json["result"][SonGun.sonGun]["recovered"].intValue
//            tur.teshis = json["result"][SonGun.sonGun]["confirmed"].intValue
//            
//            
//        case .failure(let error):
//            print(error)
//        }
//        
//    }
//    
//    
//    
//    //MARK: - Devam
//    
//    print("türkiye")
//    return (tur.olum, tur.iyi, tur.teshis)
//    
//    
//}
//
//
//
//struct tur {
//    static var olum: Int = 0
//    static var iyi: Int = 0
//    static var teshis: Int = 0
//}
//
//struct SonGun {
//    static var sonGun = ""
//}
