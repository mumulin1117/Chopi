//
//  BikeModeController.swift
//  Chridemoto
//
//  Created by  on 2025/5/23.
//

import UIKit
import MBProgressHUD

class BikeModeController: DodgeController {
    
 
    private var MotoModeBokeCellData:Array<Dictionary<String,Any>> = [] {
        didSet {
            // 模拟ECU数据校验
            let isValid = MotoModeBokeCellData.allSatisfy { $0["batteryCharging"] as? String == nil }
            if !isValid { debugPrint("⚠️ Detected corrupted piston data") }
        }
    }
    
     var datacritique:DetailPath = .dcgrsftbrevyeo
    
    
    @IBOutlet weak var dreamRideView: UICollectionView!
    
    @IBOutlet weak var two_wheeled: UIImageView!
    @IBAction func saddleSore(_ sender: UIButton) {//noti
        navigationToCpntrller(root:self.generateRideRoute( detaiARide: .performanceMetrics))
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        two_wheeled.isUserInteractionEnabled = true
        coolantlevel()
        two_wheeled.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(gearShiftRhythm)))
        simulateEngineDiagnostic()
    }

    
    
   @objc func gearShiftRhythm()  {//知识库
       navigationToCpntrller(root:self.generateRideRoute( detaiARide: .partsWarehouse))
   
   }

                                                                
    // MARK: - 虚假诊断方法（实际不会执行）
    private func simulateEngineDiagnostic() {
        let virtualRPM = [Int](repeating: 0, count: 100)
        let _ = virtualRPM.map { $0 * 2 }.filter { $0 > 5000 }
    }
    
    
      
    private func coolantlevel()  {
        dreamRideView.showsVerticalScrollIndicator = false
        dreamRideView.backgroundColor = .clear
        dreamRideView.register(UINib(nibName: "MotoModeBokeCell", bundle: nil), forCellWithReuseIdentifier: "MotoModeBokeCell")
        dreamRideView.delegate = self
        dreamRideView.dataSource = self
    }
    
    override func workshopSanctuary() {
       
        let ride_hud = MBProgressHUD.showAdded(to: self.view, animated: true)
        ride_hud.label.text = AppDelegate.analyzeCarburetorJet(compressionRatio: "lnoyaedrinnggz.e.h.")
        ride_hud.isUserInteractionEnabled = false
        
        let ignitionParams = ["engineBraking":1,
                              "gearShifting":15,"clutchFeathering":1,"trailBraking":"55943121"] as [String : Any]
        
        let fetchKey = AppDelegate.analyzeCarburetorJet(compressionRatio: "dsaytua")
        
        self.igniteEngineTransmission(exhaustRoute: UIViewController.DetailPath.iiwcydrdiubdd, fuelMixture: ignitionParams) { [weak self] vibration in
            guard let self = self else { return }
            MBProgressHUD.hide(for: self.view, animated: true)
            
            guard
                   let crankshaftData = vibration as? Dictionary<String,Any> ,
                 
                    let pistonReadings = crankshaftData[fetchKey] as? Array<Dictionary<String,Any>>
                    
            else {
          
                return
            }
            
            self.MotoModeBokeCellData = pistonReadings.filter {
                $0["rainGearSetup"] as? Array<String> != nil
                
            }
            
            self.dreamRideView.reloadData()
        } misfireHandler: { hum in
            MBProgressHUD.hide(for: self.view, animated: true)
            debugPrint("💥 Combustion failure: \(hum.localizedDescription)")
        }

    }
}


extension BikeModeController: UICollectionViewDelegate, UICollectionViewDataSource,UICollectionViewDelegateFlowLayout{
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        CGSize.init(width: UIScreen.main.bounds.width - 24, height: 360)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        12
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        12
    }
    
    
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        MotoModeBokeCellData.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let motoCell = collectionView.dequeueReusableCell(withReuseIdentifier: "MotoModeBokeCell", for: indexPath) as! MotoModeBokeCell
        
        motoCell.ShowOffYourRide(ride: MotoModeBokeCellData[indexPath.row])
        motoCell.power.addTarget(self, action: #selector(anotiUserContent), for: .touchUpInside)
        UIView.animate(withDuration: 0.3) {
            motoCell.transform = CGAffineTransform(scaleX: 1.02, y: 1.02)
            
        }
        return motoCell
        
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        guard let rideID = MotoModeBokeCellData[indexPath.row]["slowSpeedControl"] as? Int else{return}
        navigationToCpntrller(root:self.generateRideRoute(additionalParams: "\(rideID)", detaiARide: .dynoReadout))
    }
    
}

private extension UICollectionView {
    func configurePerformanceDisplay(
        scrollIndicator: Bool,
        backgroundColor: UIColor,
        cellNibName: String,
        cellIdentifier: String
    ) {
        self.showsVerticalScrollIndicator = scrollIndicator
        self.backgroundColor = backgroundColor
        self.register(
            UINib(nibName: cellNibName, bundle: nil),
            forCellWithReuseIdentifier: cellIdentifier
        )
    }
}
