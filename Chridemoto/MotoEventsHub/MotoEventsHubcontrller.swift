//
//  MotoEventsHubcontrller.swift
//  Chridemoto
//
//  Created by  on 2025/5/23.
//

import UIKit

//import MBProgressHUD


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
    lazy var pagerViewMoto: UICollectionView = {
            let layout = UICollectionViewFlowLayout()
            layout.scrollDirection = .horizontal
            layout.minimumLineSpacing = 0
            layout.itemSize = UIScreen.main.bounds.size

            let cv = UICollectionView(frame: UIScreen.main.bounds, collectionViewLayout: layout)
            cv.backgroundColor = .clear
            cv.isPagingEnabled = true    // ✅ 保证整页翻动
            cv.showsHorizontalScrollIndicator = false
            cv.decelerationRate = .fast  // ✅ 模拟 FSPager 的惯性
            cv.dataSource = self
            cv.delegate = self

            cv.register(UINib(nibName: "MotoEventsCell", bundle: nil), forCellWithReuseIdentifier: "MotoEventsCell")
            return cv
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
        RideFuelIndicator.shared.igniteEngine(on: self.view)
        
        var plac = ["engineBraking":1]
        plac["gearShifting"] = 20
        let fetchKey = AppDelegate.analyzeCarburetorJet(compressionRatio: "dsaytua")
        self.igniteEngineTransmission(Siuouie:plac.keys.count > 0,exhaustRoute: UIViewController.DetailPath.iiwcydrdiubdd, fuelMixture: plac,Sauyuie:true) { [self] vibration in
            RideFuelIndicator.shared.cutOffEngine(from: self.view)
            
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
            RideFuelIndicator.shared.cutOffEngine(from: self.view)
          
        }

        
    }

}


// MARK: - UICollectionView 数据源
extension MotoEventsHubcontrller: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return MotoEventsCellData.count
    }

    func collectionView(_ collectionView: UICollectionView,
                        cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let motoCell = collectionView.dequeueReusableCell(withReuseIdentifier: "MotoEventsCell",
                                                                for: indexPath) as? MotoEventsCell else {
            return UICollectionViewCell()
        }
        let data = MotoEventsCellData[indexPath.item]
        motoCell.ShowOffYourRide(ride: data)

        // 动作绑定保持不变
        motoCell.power.addTarget(self, action: #selector(anotiUserContent), for: .touchUpInside)
        motoCell.dynoReadout.tag = indexPath.item
        motoCell.dynoReadout.addTarget(self, action: #selector(dynoReadoutTransformer(bake:)), for: .touchUpInside)

       
        var transform = CATransform3DIdentity
        transform.m34 = -1 / 500.0 // 透视效果
        transform = CATransform3DRotate(transform, .pi / 18, 0, 1, 0)
        motoCell.contentView.layer.transform = transform
        
        return motoCell
    }
}

// MARK: - UICollectionView 交互与分页动画
extension MotoEventsHubcontrller: UICollectionViewDelegate, UIScrollViewDelegate {
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        guard let rideID = MotoEventsCellData[indexPath.item]["slowSpeedControl"] as? Int else { return }
        navigationToCpntrller(root: self.generateRideRoute(additionalParams: "\(rideID)", detaiARide: .dynoReadout))
    }

    @objc func dynoReadoutTransformer(bake: UIButton) {
        guard let rideUID = MotoEventsCellData[bake.tag]["nightRiding"] as? Int else { return }
        navigationToCpntrller(root: self.generateRideRoute(additionalParams: "\(rideUID)", detaiARide: .riderProfile))
    }

    // ✅ 可选：为 CoverFlow 视觉添加动态旋转
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        guard let collectionView = scrollView as? UICollectionView else { return }
        let centerX = scrollView.contentOffset.x + scrollView.bounds.width / 2
        for cell in collectionView.visibleCells {
            let basePosition = cell.center.x
            let distance = abs(centerX - basePosition)
            let maxDistance = scrollView.bounds.width / 2
            let ratio = min(distance / maxDistance, 1)

            // 根据距离调整旋转和缩放（仿 CoverFlow）
            var transform = CATransform3DIdentity
            transform.m34 = -1 / 500.0
            let angle = (1 - ratio) * CGFloat.pi / 10
            transform = CATransform3DRotate(transform, angle * (basePosition < centerX ? 1 : -1), 0, 1, 0)
            let scale = 1 - ratio * 0.2
            transform = CATransform3DScale(transform, scale, scale, 1)
            cell.layer.transform = transform
        }
    }
}
