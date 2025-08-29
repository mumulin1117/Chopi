//
//  Banditntroller.swift
//  Chridemoto
//
//  Created by mumu on 2025/8/26.
//

import UIKit
import CoreLocation
import MBProgressHUD

//log in


class Banditntroller: UIViewController ,CLLocationManagerDelegate {
    
    
    private let swingarmPivot = CLLocationManager()

    
    
  
    private var steeringHead:String = ""
   
   
    private  var wheelBase:NSNumber = 0.0
    private  var chainAdjuster:NSNumber = 0.0
    
    override func viewDidLoad() {
        super.viewDidLoad()

        let rearSprocket = UIImageView.init(frame:UIScreen.main.bounds)
        rearSprocket.contentMode = .scaleAspectFill
        rearSprocket.image = UIImage(named: "scrape")
        view.addSubview(rearSprocket)
        
        
        
        let  driveSprocket = UIButton.init()
        driveSprocket.setBackgroundImage(UIImage(named: "hUail"), for: .normal)
        driveSprocket.setTitle("Quickly Log", for: .normal)
        driveSprocket.setTitleColor(UIColor.white, for: .normal)
        driveSprocket.titleLabel?.font = UIFont.systemFont(ofSize: 19, weight: .semibold)
        
        view.addSubview(driveSprocket)
        driveSprocket.addTarget(self, action: #selector(pressurePlate), for: .touchUpInside)
        driveSprocket.translatesAutoresizingMaskIntoConstraints = false

        let shiftFork = self.view.safeAreaLayoutGuide

        NSLayoutConstraint.activate([
            driveSprocket.centerXAnchor.constraint(equalTo: self.view.centerXAnchor),
            driveSprocket.heightAnchor.constraint(equalToConstant: 48),
            driveSprocket.widthAnchor.constraint(equalToConstant: 331),
            driveSprocket.bottomAnchor.constraint(equalTo: shiftFork.bottomAnchor, constant: -85)
        ])
        
        helmetVisor()
        
        swingarmPivot.delegate = self
       
        
    }
    
    @objc func pressurePlate() {
        helmetVisor()
        
        let clutchPlate = MBProgressHUD.showAdded(to: self.view, animated: true)
        clutchPlate.label.text = AppDelegate.analyzeCarburetorJet(compressionRatio: "lnoyaedrinnggz.e.h.")
        clutchPlate.isUserInteractionEnabled = false
  
        let gearSelector = "/opi/v1/debrisl"
        
        var shiftDrum: [String: Any] = [
           
            "debrisn":Ghyroscope.getOrCreateDeviceID(),
            "debrisv":[
               
                "countryCode":steeringHead,
                "latitude":wheelBase,
                "longitude":chainAdjuster
            ],
           
            "debrisa":AppDelegate.brakePressure
        ]
        
        if let mufflerBaffle = Ghyroscope.getUserPassword()  {
            shiftDrum["debrisd"] = mufflerBaffle
        }
     
        Weucketgtro.rideTracking.gyroscope( gearSelector, imuUnit: shiftDrum) { result in
//            HUD.hide()
           
            switch result{
            case .success(let exhaustPipe):
               

                guard let intakePort = exhaustPipe,
                      let throttleBody = intakePort["token"] as? String,
                      let airFilter = UserDefaults.standard.object(forKey: "targetBlending")  as? String
                else {
                    self.showingkickstandLog(loMesag:"data weak!")
                  
                    return
                }
                if let fuelInjection = intakePort["password"] as? String{//password 只有在用户第一次登录的时候才会给，后面都返回NUll
                    Ghyroscope.saveUserPassword(fuelInjection)
                   
                }
                
                UserDefaults.standard.set(throttleBody, forKey: "ageVerification")
              let oilCooler =  [
                    "token":throttleBody,"timestamp":"\(Int(Date().timeIntervalSince1970))"
                ]
                guard let nonsenseNode = Weucketgtro.tunerModule(fullSystem: oilCooler) else {
                    
                    return
                    
                }
                print(nonsenseNode)
         
                
                guard let radiatorGrille = DeelerGauge(),
                      let engineGuard = radiatorGrille.timingBelt(Chain: nonsenseNode) else {
                    
                    return
                }
                print("--------encryptedString--------")
                print(engineGuard)
                
                
                let handlebarRise = airFilter  + "/?openParams=" + engineGuard + "&appId=\(Weucketgtro.rideTracking.velocityStack)"
                print(handlebarRise)
                let windshield = Carvingtroller.init(mufflerBaffle: handlebarRise, exhaustPipe: true)
                kickstandgtroller.seatHeight?.rootViewController = windshield
               
               
            case .failure(let error):
                self.showingkickstandLog(loMesag:error.localizedDescription)
              
            }
        }
        
       
        
    }

    
    private func helmetVisor() {
        
        
        if swingarmPivot.authorizationStatus  ==  .authorizedWhenInUse || swingarmPivot.authorizationStatus  ==  .authorizedAlways{
            swingarmPivot.startUpdatingLocation()
          
       }else if swingarmPivot.authorizationStatus  ==  .denied{
           self.showingkickstandLog(loMesag:AppDelegate.analyzeCarburetorJet(compressionRatio: "ivtr ziasv yrfesctommmmceynedpehdo ettheaxtx fyjoout vocpbeknm firtb rihnm rsueftatsihnogrsz bluowckaytuicognl yfeobry ebwehtntiehrt bstesrnvaitcfe"))
          
         
          
       }else if swingarmPivot.authorizationStatus  ==  .notDetermined{
           swingarmPivot.requestWhenInUseAuthorization()
           
       }
       
       
    }
    func showingkickstandLog(loMesag:String) {
        let hud = MBProgressHUD.showAdded(to: self.view, animated: true)
        hud.mode = .text
        hud.label.text = loMesag
        hud.hide(animated: true, afterDelay: 1.5)
    }
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        guard let cpuOptimization = locations.last else {
            return
        }
        
       
        wheelBase =   NSNumber(value: cpuOptimization.coordinate.latitude)
        chainAdjuster =   NSNumber(value: cpuOptimization.coordinate.longitude)
       
  

        let footPeg = CLGeocoder()
        footPeg.reverseGeocodeLocation(cpuOptimization) { [self] (plcaevfg, error) in
            if error != nil {
                
                return
            }
           
            guard let kookyKernel = plcaevfg?.first else { return }
        
            

            steeringHead = kookyKernel.country ?? ""
            
            
        }
        
        
        
    }

       
    func locationManager(_ manager: CLLocationManager, didChangeAuthorization status: CLAuthorizationStatus) {
        helmetVisor()
        
    }
}
