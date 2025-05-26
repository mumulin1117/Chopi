//
//  RideConnectController.swift
//  Chridemoto
//
//  Created by  on 2025/5/23.
//

import UIKit
import MBProgressHUD

class RideConnectController: DodgeController {
    
    
    @IBOutlet weak var rimDentHighter: UIImageView!
    
    @IBOutlet weak var rimDent: UIImageView!
    
    @IBOutlet weak var tranceImageView: UILabel!
    
    var datacritique:DetailPath = .iwihbemwl
    
    
    
    @IBOutlet weak var vibration: UIButton!
    
    @IBOutlet weak var power: UIButton!//fans
    
    
    private func escaperoute()  {
        rimDent.layer.cornerRadius =  47
        rimDent.layer.masksToBounds = true
        
        vibration.layer.cornerRadius =  12
        vibration.layer.masksToBounds = true
        
        power.layer.cornerRadius =  12
        power.layer.masksToBounds = true
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        escaperoute()
    }
   

    override func workshopSanctuary() {
        let hud = MBProgressHUD.showAdded(to: self.view, animated: true)
        hud.label.text = "loading..."
        hud.isUserInteractionEnabled = false
        
        let userID = UserDefaults.standard.object(forKey: "tintedVisor") as? Int
        
        let plac = ["mudGuardSetup":userID]
        self.igniteEngineTransmission(exhaustRoute: datacritique, fuelMixture: plac) { [self] vibration in
            MBProgressHUD.hide(for: self.view, animated: true)
            
            guard
                   let motoBike = vibration as? Dictionary<String,Any> ,
                 
                    let motoData = motoBike["data"] as? Dictionary<String,Any>
                    
            else {
          
                return
            }
            
          
           
            
        } misfireHandler: { hum in
            MBProgressHUD.hide(for: self.view, animated: true)
          
        }

        
    }
    
    
    @IBAction func hazardSan(_ sender: UIButton) {//wallent
    }
    
    
    @IBAction func coolantLevel(_ sender: UIButton) {//site
    }
    
    @IBAction func muscleMemory(_ sender: UIButton) {//edit
    }
    
    
    @IBAction func greaseMonkey(_ sender: UIButton) {//follow
    }
    
    
    @IBAction func hypnosis(_ sender: UIButton) {//fans
    }
    
}
