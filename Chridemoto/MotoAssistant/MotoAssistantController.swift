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

        ridingView.isUserInteractionEnabled = true
        
        ridingView.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(gearShiftRhythm)))
        
        getMotoGallery()
        
        coolantlevel()
    }

    @objc func gearShiftRhythm()  {//ai
        
        navigationToCpntrller(root:self.generateRideRoute(detaiARide: .AiMOtoChat))
    
    }

    @IBOutlet weak var AIMotoChat: UIImageView!
    
    
    
    @IBOutlet weak var pagerBackViewMoto: UIView!
    
    lazy var pagerViewMoto: FSPagerView = {
        let pagerViewMoto = FSPagerView.init(frame: pagerBackViewMoto.bounds)
        
        pagerViewMoto.delegate = self
        pagerViewMoto.dataSource = self
        pagerViewMoto.register(FSPagerViewCell.self, forCellWithReuseIdentifier: "bikeCell")
               
               // 走马灯样式配置
        pagerViewMoto.transformer = FSPagerViewTransformer(type: .overlap)
        pagerViewMoto.itemSize = CGSize(width: UIScreen.main.bounds.width - 70, height: pagerBackViewMoto.bounds.height - 50)
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
       
       
        
        self.igniteEngineTransmission(exhaustRoute: UIViewController.DetailPath.qtjsgaya, fuelMixture: ["motorcycleMaintenance":"55943121"]) { [self] vibration in
            MBProgressHUD.hide(for: self.view, animated: true)
            
            guard
                   let motoBike = vibration as? Dictionary<String,Any> ,
                 
                    let motoData = motoBike["data"] as? Array<Dictionary<String,Any>>
                    
            else {
          
                return
            }
            
            if motoData.count > 4{
                self.MotoActiveUserData = Array(motoData.prefix(4))
            }else{
                self.MotoActiveUserData = motoData
            }
            
            self.updateActiveUser()
            
            
        } misfireHandler: { hum in
            
          
        }
        
        
    }
    
    
    private  func getMotoGallery()  {
        let hud = MBProgressHUD.showAdded(to: self.view, animated: true)
        hud.label.text = "loading..."
        hud.isUserInteractionEnabled = false
        
        let plac = ["engineBraking":1,
                    "downshiftingTechnique": 2 ,
                    "clutchFeathering": 5,
                    "gearShifting":15]
        self.igniteEngineTransmission(exhaustRoute: UIViewController.DetailPath.iiwcydrdiubdd, fuelMixture: plac) { [self] vibration in
            MBProgressHUD.hide(for: self.view, animated: true)
            
            guard
                   let motoBike = vibration as? Dictionary<String,Any> ,
                 
                    let motoData = motoBike["data"] as? Array<Dictionary<String,Any>>
                    
            else {
          
                return
            }
            
          
            self.MotoModeBokeCellData = motoData
            self.pagerViewMoto.reloadData()
            
        } misfireHandler: { hum in
            MBProgressHUD.hide(for: self.view, animated: true)
          
        }

        
    }
    
    
    func updateActiveUser() {
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
        let label = UILabel(frame: CGRect(x:12, y: cell.frame.height-40, width: cell.frame.width - 24, height: 40))
        label.text = "  " + (data["emergencyBraking"] as? String ?? "") + "  "
        label.font = UIFont(name: "Helvetica-Bold", size: 16)
        label.textColor = .white
        label.textAlignment = .center
        label.backgroundColor = UIColor.black.withAlphaComponent(0.6)
        cell.contentView.addSubview(label)
        
        // 3D旋转效果
        cell.contentView.layer.transform = CATransform3DMakeRotation(.pi/18, 0, 1, 0)
        return cell
    }
}

// MARK: - 轮播图交互
extension MotoAssistantController: FSPagerViewDelegate {
    func pagerView(_ pagerView: FSPagerView, didSelectItemAt index: Int) {
        
        guard let rideID = MotoModeBokeCellData[index]["slowSpeedControl"] as? Int else{return}
        navigationToCpntrller(root:self.generateRideRoute(additionalParams: "\(rideID)", detaiARide: .dynoReadout))
    }
    
    func pagerViewDidScroll(_ pagerView: FSPagerView) {
      
    }
}
