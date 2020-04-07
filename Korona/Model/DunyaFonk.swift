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
//func DunyaFonk() -> (String, String, String){
//    
//        AF.request("https://covidapi.info/api/v1/global").responseJSON { dunyaCevap in
//        switch dunyaCevap.result {
//        case .success(let value):
//            
//            
//            
//            let json = JSON(value)
//
//            let olum = json["result"]["deaths"].intValue
//            let iyi = json["result"]["recovered"].intValue
//            let teshis = json["result"]["confirmed"].intValue
//
//
//            Sayi.olumSayisi = String(olum)
//            Sayi.kurtulanSayisi = String(iyi)
//            Sayi.teshisSayisi = String(teshis)
//            //self.olumOrani.text = ("%\(100*olum/teshis)")
//
//
//
//        case .failure(let error):
//            print(error)
//        }
//
//             
//    }
//    return (Sayi.olumSayisi, Sayi.kurtulanSayisi, Sayi.teshisSayisi)
//    
//}
//
//struct Sayi {
//    static var olumSayisi: String = "***"
//    static var kurtulanSayisi: String = "***"
//    static var teshisSayisi: String = "***"
//}
//
//
////func DunyaFonk() -> (Int, Int, Int){
////
////    AF.request("https://covidapi.info/api/v1/global").responseJSON { dunyaCevap in
////        switch dunyaCevap.result {
////        case .success(let value):
////
////            let json = JSON(value)
////
////            dunya.olum = json["result"]["deaths"].intValue
////            dunya.iyi = json["result"]["recovered"].intValue
////            dunya.teshis = json["result"]["confirmed"].intValue
////
////        case .failure(let error):
////            print(error)
////        }
////
////    }
////
////    return (dunya.olum, dunya.iyi, dunya.teshis)
////}
////
////
////
////struct dunya {
////    static var olum: Int = 0
////    static var iyi: Int = 0
////    static var teshis: Int = 0
////}
////
