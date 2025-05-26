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
        pagerViewMoto.transformer = FSPagerViewTransformer(type: .zoomOut)
        pagerViewMoto.itemSize = CGSize(width: UIScreen.main.bounds.width , height: UIScreen.main.bounds.height)
        pagerViewMoto.decelerationDistance = 2  // 滑动惯性
               
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
        
    }

    override func workshopSanctuary() {
        let hud = MBProgressHUD.showAdded(to: self.view, animated: true)
        hud.label.text = "loading..."
        hud.isUserInteractionEnabled = false
        
        let plac = ["engineBraking":1,
                    "gearShifting":20]
        self.igniteEngineTransmission(exhaustRoute: UIViewController.DetailPath.iiwcydrdiubdd, fuelMixture: plac) { [self] vibration in
            MBProgressHUD.hide(for: self.view, animated: true)
            
            guard
                   let motoBike = vibration as? Dictionary<String,Any> ,
                 
                    let motoData = motoBike["data"] as? Array<Dictionary<String,Any>>
                    
            else {
          
                return
            }
            
          
            self.MotoEventsCellData = motoData.filter({ diac in
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
        let cell = pagerView.dequeueReusableCell(withReuseIdentifier: "MotoEventsCell", at: index)
        let data = MotoEventsCellData[index]
//        cell.backgroundColor = .blue
        // 摩托车卡片样式
//        if let butnow = (data[""] as? Array<String>)?.first,let motoshareUrl =  URL.init(string: butnow){
//            cell.imageView?.sd_setImage(with: motoshareUrl,
//                                         placeholderImage: nil,
//                                        options: .continueInBackground,
//                                        context: [.imageTransformer: urlImageSize,.storeCacheType : SDImageCacheType.memory.rawValue])
//            
//        }
       
     
        // 3D旋转效果
        cell.contentView.layer.transform = CATransform3DMakeRotation(.pi/18, 0, 1, 0)
        return cell
    }
}

// MARK: - 轮播图交互
extension MotoEventsHubcontrller: FSPagerViewDelegate {
    func pagerView(_ pagerView: FSPagerView, didSelectItemAt index: Int) {
        
       
    }
    
    func pagerViewDidScroll(_ pagerView: FSPagerView) {
      
    }
}
