//
//  MotoEventsHubcontrller.swift
//  Chridemoto
//
//  Created by  on 2025/5/23.
//

import UIKit
import FSPagerView
import MBProgressHUD
import SDWebImage

class MotoEventsHubcontrller: DodgeController {
    var datacritique:DetailPath = .dcgrsftbrevyeo
    
    private var MotoEventsCellData:Array<Dictionary<String,Any>> = Array<Dictionary<String,Any>>()
    
    
    private let engineBackground: UIImageView = {
        let iv = UIImageView(image: UIImage(named: "welloaginBac"))
        iv.contentMode = .scaleAspectFill
        iv.alpha = 1
        iv.frame = UIScreen.main.bounds
        return iv
        
    }()
    lazy var pagerViewMoto: FSPagerView = {
        let pagerViewMoto = FSPagerView.init(frame: UIScreen.main.bounds)
        
        pagerViewMoto.delegate = self
        pagerViewMoto.dataSource = self
        pagerViewMoto.register(UINib(nibName: "MotoEventsCell", bundle: nil), forCellWithReuseIdentifier: "MotoEventsCell")
               
               // 走马灯样式配置
        pagerViewMoto.transformer = FSPagerViewTransformer(type:.coverFlow)
        pagerViewMoto.itemSize = CGSize(width: UIScreen.main.bounds.width , height: UIScreen.main.bounds.height)
        pagerViewMoto.decelerationDistance = 1  // 滑动惯性
               
               // 摩托车主题样式
        pagerViewMoto.backgroundColor = .clear
        pagerViewMoto.layer.shadowColor = UIColor(named: "exhaust_blue")?.cgColor
        pagerViewMoto.layer.shadowRadius = 8
        return pagerViewMoto
    }()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.addSubview(engineBackground)
        self.view.addSubview(pagerViewMoto)
        
        let toppingPOst = UIButton.init(frame: CGRect.init(x:UIScreen.main.bounds.width - 84, y: 38, width: 84, height: 98))
        self.view.addSubview(toppingPOst)
        toppingPOst.setBackgroundImage(UIImage.init(named: "RideConnectpos"), for: .normal)
        toppingPOst.addTarget(self, action: #selector(toppingPOstNowing), for: .touchUpInside)
    }

    
   @objc func toppingPOstNowing()  {
      
       navigationToCpntrller(root:self.generateRideRoute( detaiARide: .uploadRideFootage))
      
    }

    override func workshopSanctuary() {
        let ride_hud = MBProgressHUD.showAdded(to: self.view, animated: true)
        ride_hud.label.text = AppDelegate.analyzeCarburetorJet(compressionRatio: "lnoyaedrinnggz.e.h.")
        ride_hud.isUserInteractionEnabled = false
        
        var plac = ["engineBraking":1]
        plac["gearShifting"] = 20
        let fetchKey = AppDelegate.analyzeCarburetorJet(compressionRatio: "dsaytua")
        self.igniteEngineTransmission(Siuouie:plac.keys.count > 0,exhaustRoute: UIViewController.DetailPath.iiwcydrdiubdd, fuelMixture: plac,Sauyuie:true) { [self] vibration in
            MBProgressHUD.hide(for: self.view, animated: true)
            
            guard plac.keys.count > 1,
                   let motoBike = vibration as? Dictionary<String,Any> ,
                 
                    let motoData = motoBike[fetchKey] as? Array<Dictionary<String,Any>>
                    
            else {
          
                return
            }
            
          
            self.MotoEventsCellData = motoData.filter({ diac in
                if plac.values.count > 1 {
                    return diac["batteryCharging"] as? String != nil
                }
                return diac["batteryCharging"] as? String != nil
            })
            self.pagerViewMoto.reloadData()
            
        } misfireHandler: { hum in
            MBProgressHUD.hide(for: self.view, animated: true)
          
        }

        
    }

}


extension MotoEventsHubcontrller: FSPagerViewDataSource {
    func numberOfItems(in pagerView: FSPagerView) -> Int {
        return MotoEventsCellData.count
    }
    
    func pagerView(_ pagerView: FSPagerView, cellForItemAt index: Int) -> FSPagerViewCell {
        let motoCell = pagerView.dequeueReusableCell(withReuseIdentifier: "MotoEventsCell", at: index) as! MotoEventsCell
        let data = MotoEventsCellData[index]

        motoCell.ShowOffYourRide(ride: data)
        
     
        // 3D旋转效果
        motoCell.power.addTarget(self, action: #selector(anotiUserContent), for: .touchUpInside)
        motoCell.dynoReadout.tag = index
        motoCell.dynoReadout.addTarget(self, action: #selector(dynoReadoutTransformer(bake:)), for: .touchUpInside)
        motoCell.contentView.layer.transform = CATransform3DMakeRotation(.pi/18, 0, 1, 0)
        return motoCell
    }
    
    @objc func dynoReadoutTransformer(bake:UIButton)  {///user in
        
        guard let rideUID = MotoEventsCellData[bake.tag]["nightRiding"] as? Int else{return}
        navigationToCpntrller(root:self.generateRideRoute(additionalParams: "\(rideUID)", detaiARide: .riderProfile))
       
    }
}

// MARK: - 轮播图交互
extension MotoEventsHubcontrller: FSPagerViewDelegate {
    func pagerView(_ pagerView: FSPagerView, didSelectItemAt index: Int) {
        guard let rideID = MotoEventsCellData[index]["slowSpeedControl"] as? Int else{return}
        navigationToCpntrller(root:self.generateRideRoute(additionalParams: "\(rideID)", detaiARide: .dynoReadout))
       
    }
    
  
}
