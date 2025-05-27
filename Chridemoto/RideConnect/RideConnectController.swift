//
//  RideConnectController.swift
//  Chridemoto
//
//  Created by  on 2025/5/23.
//

import UIKit
import MBProgressHUD
import SDWebImage

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
            
            self.refreshMotoBikeUIshow(dik: motoData)
           
            
        } misfireHandler: { hum in
            MBProgressHUD.hide(for: self.view, animated: true)
          
        }

        
    }
    
    private func refreshMotoBikeUIshow(dik:Dictionary<String,Any>)  {
        if let rideUserimage = dik["cruiseControlUse"] as? String,let motoshareUrl =  URL.init(string: rideUserimage){
            
            rimDentHighter.sd_setImage(with: motoshareUrl,
                                 placeholderImage: nil,
                                options: .continueInBackground,
                                context: [.imageTransformer: urlImageSize,.storeCacheType : SDImageCacheType.memory.rawValue])
            rimDent.sd_setImage(with: motoshareUrl,
                                placeholderImage: nil,
                               options: .continueInBackground,
                               context: [.imageTransformer: urlImageSize,.storeCacheType : SDImageCacheType.memory.rawValue])
            
            
            
        }
        
        tranceImageView.text = dik["touringWindscreen"] as? String
        vibration.setTitle("\(dik["ridePlanning"] as? Int ?? 0) Following", for: .normal)
        
        power.setTitle("\(dik["sidestandSensor"] as? Int ?? 0) Fans", for: .normal)
    }
    
    
    @IBAction func hazardSan(_ sender: UIButton) {
        navigationToCpntrller(root:self.generateRideRoute( detaiARide: .fuelWallet))
    
    }
    
    
    @IBAction func coolantLevel(_ sender: UIButton) {
        navigationToCpntrller(root:self.generateRideRoute( detaiARide: .garageSettings))
    }
    
    @IBAction func muscleMemory(_ sender: UIButton) {
        navigationToCpntrller(root:self.generateRideRoute( detaiARide: .bikeConfiguration))
    }
    
    
    @IBAction func greaseMonkey(_ sender: UIButton) {
        navigationToCpntrller(root:self.generateRideRoute( detaiARide: .followingRiders))
    }
    
    
    @IBAction func hypnosis(_ sender: UIButton) {
        navigationToCpntrller(root:self.generateRideRoute( detaiARide: .fanClub))
    }
    
}
