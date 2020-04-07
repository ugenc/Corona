//
//  ViewController.swift
//  Korona
//
//  Created by Ugur Genc on 7.04.2020.
//  Copyright © 2020 Bug Design. All rights reserved.
//

import UIKit
import SwiftyJSON
import Alamofire

class ViewController: UIViewController {
    
    @IBOutlet weak var olumSayisi: UILabel!
    @IBOutlet weak var teshisSayisi: UILabel!
    @IBOutlet weak var kurtulanSayisi: UILabel!
    @IBOutlet weak var toggleDegisti: UISegmentedControl!
    @IBOutlet weak var olumOrani: UILabel!
    
    @IBOutlet weak var neredeLabel: UILabel!
    
    
    
    
    let locale = NSLocale.current.regionCode
 
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
        
        print(locale)
        
        AF.request("https://covidapi.info/api/v1/global").responseJSON { dunyaCevap in
            switch dunyaCevap.result {
            case .success(let value):
                
                let json = JSON(value)
                
                let olum = json["result"]["deaths"].intValue
                let iyi = json["result"]["recovered"].intValue
                let teshis = json["result"]["confirmed"].intValue
                
                
                self.olumSayisi.text = String(olum)
                self.kurtulanSayisi.text = String(iyi)
                self.teshisSayisi.text = String(teshis)
                self.olumOrani.text = ("%\(100*olum/teshis)")
                
                
                
            case .failure(let error):
                print(error)
            }
            
        }
        
        
        
        
    }
    
    
    @IBAction func toggleBas(_ sender: UISegmentedControl) {
        
        
        switch toggleDegisti.selectedSegmentIndex
        {
            
        //MARK: - Dünya
        case 0:
            
            AF.request("https://covidapi.info/api/v1/global").responseJSON { dunyaCevap in
                switch dunyaCevap.result {
                case .success(let value):
                    
                    let json = JSON(value)
                    let olum = json["result"]["deaths"].intValue
                    let iyi = json["result"]["recovered"].intValue
                    let teshis = json["result"]["confirmed"].intValue
                    
                    
                    self.olumSayisi.text = String(olum)
                    self.kurtulanSayisi.text = String(iyi)
                    self.teshisSayisi.text = String(teshis)
                    self.olumOrani.text = ("%\(100*olum/teshis)")
                    self.neredeLabel.text = "Dünyada"
                    
                    
                case .failure(let error):
                    print(error)
                }
                
            }
            
            
            
            //MARK: - Türkiye
            
        case 1:
            
            
            AF.request("https://covidapi.info/api/v1/latest-date").response { tarihCevap in
                
                if let data = tarihCevap.data, let utf8Text = String(data: data, encoding: .utf8) {
                    Son.sonGun = utf8Text
                }
            }
            
            
            AF.request("https://covidapi.info/api/v1/country/TUR/latest").responseJSON { turkiyeCevap in
                switch turkiyeCevap.result {
                case .success(let value):
                    
                    let json = JSON(value)
                    Tur.olum = json["result"][Son.sonGun]["deaths"].intValue
                    Tur.iyi = json["result"][Son.sonGun]["recovered"].intValue
                    Tur.teshis = json["result"][Son.sonGun]["confirmed"].intValue
                    self.olumSayisi.text = String(Tur.olum)
                    self.kurtulanSayisi.text = String(Tur.iyi)
                    self.teshisSayisi.text = String(Tur.teshis)
                    self.olumOrani.text = ("%\(100*Tur.olum/Tur.teshis)")
                    self.neredeLabel.text = "Türkiye'de"
                case .failure(let error):
                    print(error)
                }
                
            }
            
        default:
            break;
        }
        
        
        
    }
}



struct Tur {
    static var olum: Int = 0
    static var iyi: Int = 0
    static var teshis: Int = 0
}

struct Son {
    static var sonGun = ""
}




