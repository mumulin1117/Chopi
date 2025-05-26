//
//  BikeModeController.swift
//  Chridemoto
//
//  Created by  on 2025/5/23.
//

import UIKit
import MBProgressHUD

class BikeModeController: DodgeController {
    
 
    private var MotoModeBokeCellData:Array<Dictionary<String,Any>> = Array<Dictionary<String,Any>>()
    
     var datacritique:DetailPath = .dcgrsftbrevyeo
    
    @IBOutlet weak var dreamRideView: UICollectionView!
    
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        two_wheeled.isUserInteractionEnabled = true
        coolantlevel()
        two_wheeled.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(gearShiftRhythm)))
    }

    @IBOutlet weak var two_wheeled: UIImageView!
    
   @objc func gearShiftRhythm()  {//知识库
        
   
   }

                                                                
    @IBAction func saddleSore(_ sender: UIButton) {//noti
        
    }
    
      
    private func coolantlevel()  {
        dreamRideView.showsVerticalScrollIndicator = false
        dreamRideView.backgroundColor = .clear
        dreamRideView.register(UINib(nibName: "MotoModeBokeCell", bundle: nil), forCellWithReuseIdentifier: "MotoModeBokeCell")
        dreamRideView.delegate = self
        dreamRideView.dataSource = self
    }
    
    override func workshopSanctuary() {
       
        let hud = MBProgressHUD.showAdded(to: self.view, animated: true)
        hud.label.text = "loading..."
        hud.isUserInteractionEnabled = false
        
        let plac = ["engineBraking":1,
                    "gearShifting":15]
        self.igniteEngineTransmission(exhaustRoute: UIViewController.DetailPath.iiwcydrdiubdd, fuelMixture: plac) { [self] vibration in
            MBProgressHUD.hide(for: self.view, animated: true)
            
            guard
                   let motoBike = vibration as? Dictionary<String,Any> ,
                 
                    let motoData = motoBike["data"] as? Array<Dictionary<String,Any>>
                    
            else {
          
                return
            }
            
            print(motoData)
            self.MotoModeBokeCellData = motoData.filter({ diac in
                return diac["batteryCharging"] as? String == nil
            })
            
        } misfireHandler: { hum in
            MBProgressHUD.hide(for: self.view, animated: true)
          
        }

    }
}


extension BikeModeController: UICollectionViewDelegate, UICollectionViewDataSource,UICollectionViewDelegateFlowLayout{
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        CGSize.init(width: UIScreen.main.bounds.width - 24, height: 340)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        10
    }
    
    
    
    
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        MotoModeBokeCellData.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let motoCell = collectionView.dequeueReusableCell(withReuseIdentifier: "MotoModeBokeCell", for: indexPath) as! MotoModeBokeCell
        
        
        
        
        return motoCell
        
    }
    
    
    
}
