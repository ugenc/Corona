//
//  KoronaVeri.swift
//  Korona
//
//  Created by Ugur Genc on 7.04.2020.
//  Copyright © 2020 Bug Design. All rights reserved.
//

import Foundation
import SwiftyJSON
import Alamofire

class KoronaVeri {
 
    
    func veriAl (){
        
        AF.request("https://covidapi.info/api/v1/global").responseJSON { response in
            switch response.result {
            case .success(let value):
                
                let json = JSON(value)
                print(json)
                
                let dunyaIyilesen = json["result"]["recovered"].stringValue
                print(dunyaIyilesen)
               
                
                if let dunyaOlum = json["result"]["deaths"].int {
                    
                    debugPrint(dunyaOlum)
                }
            case .failure(let error):
                print(error)
            }
            

    }
        
    }
    
}


