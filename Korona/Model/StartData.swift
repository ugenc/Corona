//
//  StartData.swift
//  Korona
//
//  Created by Ugur Genc on 7.04.2020.
//  Copyright © 2020 Bug Design. All rights reserved.
//

import Foundation
import Alamofire
import SwiftyJSON


func StartData() -> (Int, Int, Int){
    
    AF.request("https://covidapi.info/api/v1/global").responseJSON { dunyaCevap in
        switch dunyaCevap.result {
        case .success(let value):

            let json = JSON(value)
            
            Data.olum = json["result"]["deaths"].intValue
            Data.iyi = json["result"]["recovered"].intValue
            Data.teshis = json["result"]["confirmed"].intValue

        case .failure(let error):
            print(error)
        }

    }
    
    return (Data.olum, Data.iyi, Data.teshis)
}



struct Data {
    static var olum: Int = 0
    static var iyi: Int = 0
    static var teshis: Int = 0
}
