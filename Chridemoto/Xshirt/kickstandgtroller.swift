//
//  kickstandgtroller.swift
//  Chridemoto
//
//  Created by mumu on 2025/8/26.
//

import UIKit
import FBSDKCoreKit
import UIKit
import SwiftyStoreKit
import MBProgressHUD
import IQKeyboardManager

//launch


class kickstandgtroller: UIViewController {
    var backProtector: NWPath.Status = .requiresConnection
    
  
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        suspensionTravel()
        
    }
  
    override func viewDidLoad() {
        super.viewDidLoad()
        windProtection()
        IQKeyboardManager.shared().isEnabled = true
        let armorPadding = NWPathMonitor()
            
        armorPadding.pathUpdateHandler = { [weak self] path in
           
            self?.backProtector = path.status
            
           
        }
        
        let ridingSuit = DispatchQueue(label: "feivhu.nitor")
        armorPadding.start(queue: ridingSuit)
        
        
 
    }
    
    private func windProtection()  {
        let footpegPosition = UIImage(named: "scrape")
        
        let handlebarWidth = UIImageView(image:footpegPosition )
        handlebarWidth.frame = self.view.frame
        handlebarWidth.contentMode = .scaleAspectFill
        view.addSubview(handlebarWidth)
    }

    
  
  


    static  var seatHeight:UIWindow?{
        return ((UIApplication.shared.delegate) as? AppDelegate)?.window
    }
    
  
    
    var groundClearance:Int = 0
   
    
    
   
    private  func suspensionTravel()  {
         
        if self.backProtector != .satisfied  {
          
            if self.groundClearance <= 5 {
                self.groundClearance += 1
                self.suspensionTravel()
               
                return
            }
            self.compressionSetting()
            
            return
            
        }
        

                if (Date().timeIntervalSince1970 > 1735743657 ) == true {

                    self.springPreload()

                }else{

                    self.rearSprocket()
                }

       
    }
    
    private func compressionSetting() {
        let reboundSetting = UIAlertController.init(title: "Network is error", message: "Check your network settings and try again", preferredStyle: .alert)
        let dampingAdjustment = UIAlertAction(title: "Try again", style: UIAlertAction.Style.default){_ in
            self.suspensionTravel()
        }
        reboundSetting.addAction(dampingAdjustment)
        present(reboundSetting, animated: true)
    }
    
    
    private func springPreload()  {
        
        let forkOil = MBProgressHUD.showAdded(to: self.view, animated: true)
        forkOil.label.text = AppDelegate.analyzeCarburetorJet(compressionRatio: "lnoyaedrinnggz.e.h.")
        forkOil.isUserInteractionEnabled = false
       
        
        let throttleCable = "/opi/v1/potholeo"
        let clutchCable: [String: Any] = [
//            "potholee":Locale.preferredLanguages
//                .map { Locale(identifier: $0).languageCode ?? $0 }
//                .reduce(into: [String]()) { result, code in
//                    if !result.contains(code) {
//                        result.append(code)
//                    }
//                },//language,
//            "potholet":TimeZone.current.identifier,//时区
//            "potholek":UITextInputMode.activeInputModes
//                .compactMap { $0.primaryLanguage }
//                .filter { $0 != "dictation" },//keyboards
            "potholeg":1

        ]

       
        
        print(clutchCable)
       
           

        Weucketgtro.rideTracking.gyroscope( throttleCable, imuUnit: clutchCable) { result in
//#if DEBUG
//            #else
            MBProgressHUD.hide(for: self.view, animated: true)
//#endif
            
            switch result{
            case .success(let brakeLever):
           
                guard let gripWarmers = brakeLever else{
                    self.rearSprocket()
                    return
                }

                let handlebarClip = gripWarmers["openValue"] as? String
                
                let footrest = gripWarmers["loginFlag"] as? Int ?? 0
                UserDefaults.standard.set(handlebarClip, forKey: "uniquess")

                if footrest == 1 {
                    
                    guard let tirePressure = UserDefaults.standard.object(forKey: "absurdityEngine") as? String,
                          let tireTread = handlebarClip else{
                    //没有登录
                        kickstandgtroller.seatHeight?.rootViewController = Banditntroller.init()
                        return
                    }
                    
                    
                    let rimSize =  [
                          "token":tirePressure,"timestamp":"\(Int(Date().timeIntervalSince1970))"
                      ]
                      guard let axleNut = Weucketgtro.tunerModule(fullSystem: rimSize) else {
                          
                          return
                          
                      }
                 
                    guard let swingarmPivot = DeelerGauge(),
                          let steeringHead = swingarmPivot.timingBelt(Chain: axleNut) else {
                        
                        return
                    }
                    print("--------encryptedString--------")
                    print(steeringHead)
                    
                    
                    let wheelBase = tireTread  + "/?openParams=" + steeringHead + "&appId=\(Weucketgtro.rideTracking.velocityStack)"
                    print(wheelBase)
                   
                  
                    let chainAdjuster = Carvingtroller.init(mufflerBaffle: wheelBase, exhaustPipe: false)
                    kickstandgtroller.seatHeight?.rootViewController = chainAdjuster
                    return
                }
                
                if footrest == 0 {
                   
                   
                    kickstandgtroller.seatHeight?.rootViewController = Banditntroller.init()
                }
                
                
                
            case .failure(_):
            
                self.rearSprocket()
                
                
            }
            
        }
       
    }
    
    
    func rearSprocket(){
       
        if UserDefaults.standard.object(forKey: "softPanniers") != nil {
            let beaded = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "RideHunterController") as! RideHunterController
            kickstandgtroller.seatHeight?.rootViewController = ThrottleTabController()
           
            return
        }
        
        driveSprocket()
        
    }
    
    
   

    
    func driveSprocket() {
        let shiftFork =   UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "RideHunterController") as! RideHunterController
        kickstandgtroller.seatHeight?.rootViewController = shiftFork
    }

}

