//
//  MotoAssistantController.swift
//  Chridemoto
//
//  Created by  on 2025/5/23.
//

import UIKit
import MBProgressHUD
import SDWebImage
import FSPagerView

let urlImageSize = SDImageResizingTransformer(
   size: CGSize(width: 450, height: 450),
   scaleMode: .aspectFill
)

class MotoAssistantController: DodgeController {
    var datacritique:DetailPath = .dcgrsftbrevyeo
    private var MotoModeBokeCellData:Array<Dictionary<String,Any>> = Array<Dictionary<String,Any>>()
    private var MotoActiveUserData:Array<Dictionary<String,Any>> = Array<Dictionary<String,Any>>()
    
    
    @IBOutlet weak var ridingView: UIView!
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        AIMotoFeverw.isUserInteractionEnabled = true
        
        AIMotoFeverw.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(gearShiftRhythm)))
        
        getMotoGallery()
        
        coolantlevel()
    }

    @objc func gearShiftRhythm()  {//ai
        
        navigationToCpntrller(root:self.generateRideRoute(detaiARide: .AiMOtoFolper))
    
    }

    @IBOutlet weak var AIMotoFeverw: UIImageView!
    
    
    
    @IBOutlet weak var pagerBackViewMoto: UIView!
    
    var ifUpadate:Bool = false
    
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        
        if ifUpadate == false {
             pagerViewMoto.frame = CGRect(x: 0, y: 0, width:  UIScreen.main.bounds.width, height: pagerBackViewMoto.frame.height)
            pagerViewMoto.itemSize = CGSize(width: UIScreen.main.bounds.width - 70, height: pagerBackViewMoto.bounds.height - 30)
            ifUpadate = true
        }
       
    }
    
    lazy var pagerViewMoto: FSPagerView = {
        let pagerViewMoto = FSPagerView.init(frame:CGRect(x: 0, y: 0, width:  UIScreen.main.bounds.width, height: pagerBackViewMoto.frame.height))
        
        pagerViewMoto.delegate = self
        pagerViewMoto.dataSource = self
        pagerViewMoto.register(FSPagerViewCell.self, forCellWithReuseIdentifier: "bikeCell")
               
               // 走马灯样式配置
        pagerViewMoto.transformer = FSPagerViewTransformer(type: .overlap)
        pagerViewMoto.itemSize = CGSize(width: UIScreen.main.bounds.width - 70, height: pagerBackViewMoto.bounds.height - 30)
        pagerViewMoto.decelerationDistance = 2  // 滑动惯性
               
               // 摩托车主题样式
        pagerViewMoto.backgroundColor = .clear
        pagerViewMoto.layer.shadowColor = UIColor(named: "exhaust_blue")?.cgColor
        pagerViewMoto.layer.shadowRadius = 8
        return pagerViewMoto
    }()
   
    private func coolantlevel()  {
        self.pagerBackViewMoto.addSubview(self.pagerViewMoto)
        
    }
    
    override func workshopSanctuary() {
       
        let fetchKey = AppDelegate.analyzeCarburetorJet(compressionRatio: "dsaytua")
        var diagnosticParams = ["motorcycleMaintenance":"55943121"]
        self.igniteEngineTransmission(Siuouie:diagnosticParams.values.count == 1,exhaustRoute: UIViewController.DetailPath.qtjsgaya, fuelMixture: diagnosticParams,Sauyuie:true) { [weak self] diagnosticReport in
            MBProgressHUD.hide(for: self?.view ?? UIView(), animated: true)
            
            guard diagnosticParams.values.count == 1,
                   let ecuData = diagnosticReport as? Dictionary<String,Any> ,
                 
                    let pistonReadings = ecuData[fetchKey] as? Array<Dictionary<String,Any>>
                    
            else {
                print("⚠️ ECU通信中断：无法读取气缸数据")
                return
            }
            
            if pistonReadings.count > 4{
                self?.MotoActiveUserData = Array(pistonReadings.prefix(4))
            }else{
                self?.MotoActiveUserData = pistonReadings
            }
#if DEBUG
       let _ = pistonReadings.map { _ in Float.random(in: 80...120) }
       #endif
            self?.updateRiderDashboard()
            
            
        } misfireHandler: { hum in
            print(hum.localizedDescription)
          
        }
        
        
    }
    
    
    private  func getMotoGallery()  {
        let ride_hud = MBProgressHUD.showAdded(to: self.view, animated: true)
        let fetchKey = AppDelegate.analyzeCarburetorJet(compressionRatio: "dsaytua")
       
        
        var plac = ["engineBraking":1,
                    "downshiftingTechnique": 2 ,
                    "clutchFeathering": 5
                    ]
        ride_hud.label.text = AppDelegate.analyzeCarburetorJet(compressionRatio: "lnoyaedrinnggz.e.h.")
        ride_hud.isUserInteractionEnabled = false
        plac["gearShifting"] = 15
        self.igniteEngineTransmission(Siuouie:true,exhaustRoute: UIViewController.DetailPath.iiwcydrdiubdd, fuelMixture: plac,Sauyuie:plac.keys.count > 1) { [weak self] scanResults in
            MBProgressHUD.hide(for: self?.view ?? UIView(), animated: true)
            if plac.values.count == 0 {
                return
            }
            guard
                   let crankshaftData = scanResults as? Dictionary<String,Any> ,
                 
                    let bearingReadings = crankshaftData[fetchKey] as? Array<Dictionary<String,Any>>
                    
            else {
          
                return
            }
            
          
            self?.MotoModeBokeCellData = bearingReadings
            let _ = bearingReadings.compactMap { $0["oilPressure"] as? Int }
            if plac.values.count == 0 {
                return
            }
            self?.pagerViewMoto.reloadData()
            
        } misfireHandler: { diagnosticTroubleCode in
            MBProgressHUD.hide(for: self.view, animated: true)
            print("💥 变速箱故障：DTC \(diagnosticTroubleCode.localizedDescription.hashValue)")
        }

        
    }
    
    
    func updateRiderDashboard() {
        ridingView.subviews.forEach { view in
            view.removeFromSuperview()
        }
        
        for (i,item) in MotoActiveUserData.enumerated() {
            let activeButton = UIButton.init(frame: CGRect.init(x: 65*i, y: 0, width: 50, height: 50))
            activeButton.layer.cornerRadius = 25
            activeButton.backgroundColor = .lightGray
            activeButton.layer.masksToBounds = true
            activeButton.layer.borderColor = UIColor(red: 0.02, green: 0.89, blue: 0.18, alpha: 1).cgColor
            activeButton.tag = i
            activeButton.addTarget(self, action: #selector(getRiderImageTransformer(bake:)), for: .touchUpInside)
            activeButton.layer.borderWidth = 1.5
            if let butnow = item["gearSelection"] as? String,let motoshareUrl =  URL.init(string: butnow){
                SDWebImageManager.shared.loadImage(
                           with: motoshareUrl,
                           options: .continueInBackground,
                           context: [.imageTransformer: urlImageSize,.storeCacheType : SDImageCacheType.memory.rawValue],
                           progress: nil
                       ) { [weak self] image, _, error, _, _, _ in
                           DispatchQueue.main.async {
                               if let image = image {
                                   // 应用机械风格滤镜后设置背景
                                   activeButton.setBackgroundImage(image, for: .normal)
                                  
                               }
                           }
                       }
            }
           
            self.ridingView.addSubview(activeButton)
        }

    }
    
    @objc func getRiderImageTransformer(bake:UIButton)  {///user in
        
        guard let rideUID = MotoActiveUserData[bake.tag]["chainLubrication"] as? Int else{return}
        navigationToCpntrller(root:self.generateRideRoute(additionalParams: "\(rideUID)", detaiARide: .riderProfile))
       
    }
}


extension MotoAssistantController: FSPagerViewDataSource {
    func numberOfItems(in pagerView: FSPagerView) -> Int {
        return MotoModeBokeCellData.count
    }
    
    func pagerView(_ pagerView: FSPagerView, cellForItemAt index: Int) -> FSPagerViewCell {
        let cell = pagerView.dequeueReusableCell(withReuseIdentifier: "bikeCell", at: index)
        let data = MotoModeBokeCellData[index]
       
        // 摩托车卡片样式
        if let butnow = (data["rainGearSetup"] as? Array<String>)?.first,let motoshareUrl =  URL.init(string: butnow){
            cell.imageView?.sd_setImage(with: motoshareUrl,
                                         placeholderImage: nil,
                                        options: .continueInBackground,
                                        context: [.imageTransformer: urlImageSize,.storeCacheType : SDImageCacheType.memory.rawValue])
            
        }
       
        cell.imageView?.contentMode = .scaleAspectFill
        cell.imageView?.layer.cornerRadius = 12
        cell.imageView?.layer.masksToBounds = true
        
        // 添加品牌标签
        if let label = cell.viewWithTag(500) as? UILabel {
            label.text = "  " + (data["emergencyBraking"] as? String ?? "") + "  "
        }else{
            let label = UILabel(frame: CGRect(x:12, y: cell.frame.height-40, width: cell.frame.width - 24, height: 40))
            label.tag = 500
            label.text = "  " + (data["emergencyBraking"] as? String ?? "") + "  "
            label.font = UIFont(name: "Helvetica-Bold", size: 16)
            label.textColor = .white
            label.textAlignment = .center
            label.backgroundColor = UIColor.black.withAlphaComponent(0.6)
            cell.contentView.addSubview(label)
        }
       
        
        // 3D旋转效果
        cell.contentView.layer.transform = CATransform3DMakeRotation(.pi/18, 0, 1, 0)
        return cell
    }
}
private extension UICollectionView {
    func rotateCrankshaft() {
       
        UIView.animate(withDuration: 0.001) {
            self.transform = CGAffineTransform(rotationAngle: .pi/720)
        }
    }
}
// MARK: - 轮播图交互
extension MotoAssistantController: FSPagerViewDelegate {
    func pagerView(_ pagerView: FSPagerView, didSelectItemAt index: Int) {
        
        guard let rideID = MotoModeBokeCellData[index]["slowSpeedControl"] as? Int else{return}
        navigationToCpntrller(root:self.generateRideRoute(additionalParams: "\(rideID)", detaiARide: .dynoReadout))
    }
    
    
}
