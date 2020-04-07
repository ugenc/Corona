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
    

    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
        let a = DunyaFonk()
      

        olumSayisi.text = String(a.0)
        kurtulanSayisi.text = String(a.1)
        teshisSayisi.text = String(a.2)
        if a.2 != 0 {
            olumOrani.text = ("%\(100*a.0/a.2)")
        }
    

        
        print("dünya")
        
        
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
                //self.olumOrani.text = ("%\(100*olum/teshis)")



            case .failure(let error):
                print(error)
            }

        }

        
        
        
    }
    
    
    @IBAction func toggleBas(_ sender: UISegmentedControl) {
        
        let dunya = DunyaFonk()
        let tur = TurkiyeFonk()
        
        switch toggleDegisti.selectedSegmentIndex
        {
        case 0:
            
            olumSayisi.text = String(dunya.0)
            kurtulanSayisi.text = String(dunya.1)
            teshisSayisi.text = String(dunya.2)
            if dunya.2 != 0 {
                olumOrani.text = ("%\(100*dunya.0/dunya.2)")
            }
            
            print("dünya")
            
        case 1:
            
            
            olumSayisi.text = String(tur.0)
            kurtulanSayisi.text = String(tur.1)
            teshisSayisi.text = String(tur.2)
            if tur.2 != 0 {
                olumOrani.text = ("%\(100*tur.0/tur.2)")

            }
             print("türkiye")
            
        default:
            break;
        }
        
        
    }
    
    
}



