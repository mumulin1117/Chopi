//
//  MotoAssistantController.swift
//  Chridemoto
//
//  Created by  on 2025/5/23.
//

import UIKit
//import MBProgressHUD



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
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .horizontal

        // 使 items 部分重叠：lineSpacing 取负值（负值大小决定重叠程度）
        layout.minimumLineSpacing = -40 // 根据 overlap 程度微调：原来 `-70` 宽度差为例微调为 -40
        layout.itemSize = CGSize(width: UIScreen.main.bounds.width - 70, height: pagerBackViewMoto.bounds.height - 30)
        if ifUpadate == false {
             pagerViewMoto.frame = CGRect(x: 0, y: 0, width:  UIScreen.main.bounds.width, height: pagerBackViewMoto.frame.height)
            pagerViewMoto.collectionViewLayout = layout//. itemSize = CGSize(width: UIScreen.main.bounds.width - 70, height: pagerBackViewMoto.bounds.height - 30)
            ifUpadate = true
        }
       
    }
    
    lazy var pagerViewMoto: UICollectionView = {
        // 使用 flow layout
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .horizontal

        // 使 items 部分重叠：lineSpacing 取负值（负值大小决定重叠程度）
        layout.minimumLineSpacing = -40 // 根据 overlap 程度微调：原来 `-70` 宽度差为例微调为 -40

        let cv = UICollectionView(frame: CGRect(x: 0,
                                                y: 0,
                                                width: UIScreen.main.bounds.width,
                                                height: pagerBackViewMoto.frame.height),
                                  collectionViewLayout: layout)
        cv.backgroundColor = .clear
        cv.showsHorizontalScrollIndicator = false
        cv.decelerationRate = .fast // 更短的滑动惯性
        cv.translatesAutoresizingMaskIntoConstraints = false

        cv.register(BikeCardCell.self, forCellWithReuseIdentifier: BikeCardCell.reuseIdentifier)
        cv.dataSource = self
        cv.delegate = self

        return cv
    }()
   
    private func coolantlevel()  {
        self.pagerBackViewMoto.addSubview(self.pagerViewMoto)
        
    }
    
    override func workshopSanctuary() {
       
        let fetchKey = AppDelegate.analyzeCarburetorJet(compressionRatio: "dsaytua")
        var diagnosticParams = ["motorcycleMaintenance":"55943121"]
        self.igniteEngineTransmission(Siuouie:diagnosticParams.values.count == 1,exhaustRoute: UIViewController.DetailPath.qtjsgaya, fuelMixture: diagnosticParams,Sauyuie:true) { [unowned self] diagnosticReport in
           
            RideFuelIndicator.shared.cutOffEngine(from: self.view)
            guard diagnosticParams.values.count == 1,
                   let ecuData = diagnosticReport as? Dictionary<String,Any> ,
                 
                    let pistonReadings = ecuData[fetchKey] as? Array<Dictionary<String,Any>>
                    
            else {
                print("⚠️ ECU通信中断：无法读取气缸数据")
                return
            }
            
            if pistonReadings.count > 4{
                self.MotoActiveUserData = Array(pistonReadings.prefix(4))
            }else{
                self.MotoActiveUserData = pistonReadings
            }
#if DEBUG
       let _ = pistonReadings.map { _ in Float.random(in: 80...120) }
       #endif
            self.updateRiderDashboard()
            
            
        } misfireHandler: { hum in
            print(hum.localizedDescription)
          
        }
        
        
    }
    
    
    private  func getMotoGallery()  {
        
        let fetchKey = AppDelegate.analyzeCarburetorJet(compressionRatio: "dsaytua")
       
        
        var plac = ["engineBraking":1,
                    "downshiftingTechnique": 2 ,
                    "clutchFeathering": 5
                    ]
        RideFuelIndicator.shared.igniteEngine(on: self.view)
        plac["gearShifting"] = 15
        self.igniteEngineTransmission(Siuouie:true,exhaustRoute: UIViewController.DetailPath.iiwcydrdiubdd, fuelMixture: plac,Sauyuie:plac.keys.count > 1) { [unowned self] scanResults in
            RideFuelIndicator.shared.cutOffEngine(from: self.view)
            if plac.values.count == 0 {
                return
            }
            guard
                   let crankshaftData = scanResults as? Dictionary<String,Any> ,
                 
                    let bearingReadings = crankshaftData[fetchKey] as? Array<Dictionary<String,Any>>
                    
            else {
          
                return
            }
            
          
            self.MotoModeBokeCellData = bearingReadings
            let _ = bearingReadings.compactMap { $0["oilPressure"] as? Int }
            if plac.values.count == 0 {
                return
            }
            self.pagerViewMoto.reloadData()
            
        } misfireHandler: { diagnosticTroubleCode in
            RideFuelIndicator.shared.cutOffEngine(from: self.view)
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
                URLSession.shared.dataTask(with: motoshareUrl) { [weak self] data, _, _ in
                    guard let data = data, let image = UIImage(data: data) else { return }
                    
                    DispatchQueue.main.async {
                        activeButton.setBackgroundImage(image, for: .normal)
                    }
                }.resume()
                
                
                self.ridingView.addSubview(activeButton)
            }
            
        }
    }
    
    @objc func getRiderImageTransformer(bake:UIButton)  {///user in
        
        guard let rideUID = MotoActiveUserData[bake.tag]["chainLubrication"] as? Int else{return}
        navigationToCpntrller(root:self.generateRideRoute(additionalParams: "\(rideUID)", detaiARide: .riderProfile))
       
    }
}



private extension UICollectionView {
    func rotateCrankshaft() {
       
        UIView.animate(withDuration: 0.001) {
            self.transform = CGAffineTransform(rotationAngle: .pi/720)
        }
    }
}


extension MotoAssistantController: UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {

    func numberOfSections(in collectionView: UICollectionView) -> Int { 1 }

    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return MotoModeBokeCellData.count
    }

    func collectionView(_ collectionView: UICollectionView,
                        cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: BikeCardCell.reuseIdentifier,
                                                            for: indexPath) as? BikeCardCell else {
            return UICollectionViewCell()
        }

        let data = MotoModeBokeCellData[indexPath.item]

        // 保持你原有的图片加载逻辑：保留 igniteEngine(fuelLine:)
        if let butnow = (data["rainGearSetup"] as? [String])?.first,
           let motoshareUrl = URL(string: butnow) {
            // 假设你已有 UIImageView extension: igniteEngine(fuelLine:)
            cell.imageView.igniteEngine(fuelLine: motoshareUrl)
        } else {
            cell.imageView.image = nil
        }

        // 品牌标签文本（保持和之前一致）
        cell.brandLabel.text = "  " + (data["emergencyBraking"] as? String ?? "") + "  "

        // 3D 轻微旋转效果（同你之前的 pi/18）
        var transform = CATransform3DIdentity
        transform.m34 = -1.0 / 1000.0   // 透视
        transform = CATransform3DRotate(transform, CGFloat(Double.pi / 18.0), 0, 1, 0)
        cell.contentView.layer.transform = transform

        return cell
    }

   
    
    func collectionView(_ collectionView: UICollectionView,
                        layout collectionViewLayout: UICollectionViewLayout,
                        sizeForItemAt indexPath: IndexPath) -> CGSize {
      
        
        let width = UIScreen.main.bounds.width - 70
        let height = pagerBackViewMoto.bounds.height - 30
        return CGSize(width: width, height: height)
    }

    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        guard let rideID = MotoModeBokeCellData[indexPath.item]["slowSpeedControl"] as? Int else { return }
        navigationToCpntrller(root: self.generateRideRoute(additionalParams: "\(rideID)", detaiARide: .dynoReadout))
    }
}


extension MotoAssistantController: UIScrollViewDelegate {
    // called before deceleration; 我们手动调整 targetContentOffset 以实现“吸附/分页”的效果
    func scrollViewWillEndDragging(_ scrollView: UIScrollView,
                                   withVelocity velocity: CGPoint,
                                   targetContentOffset: UnsafeMutablePointer<CGPoint>) {
        guard scrollView === pagerViewMoto else { return }
        guard let layout = pagerViewMoto.collectionViewLayout as? UICollectionViewFlowLayout else { return }

        let itemWidth = (layout.itemSize.width)
        let spacing = layout.minimumLineSpacing
        let pageWidth = itemWidth + spacing

        // 当前偏移 + 左侧 inset (我们假设水平居中显示 item)
        let rawOffset = targetContentOffset.pointee.x + pagerViewMoto.contentInset.left

        // 计算即将对齐的索引（同时考虑滑动速度，以模拟 decelerationDistance）
        var index = round(rawOffset / pageWidth)

        // velocity.x 可以用来决定“跨页”行为：如果滑得很快则跨更多页（类似 decelerationDistance）
        if abs(velocity.x) > 0.2 {
            // 根据方向向前/后跨 1 页（速度越大可修改为跨越更多）
            index = velocity.x > 0 ? floor(rawOffset / pageWidth) + 1 : ceil(rawOffset / pageWidth) - 1
        }

        // 限制 index 在合法范围内
        let itemCount = collectionView(pagerViewMoto, numberOfItemsInSection: 0)
        let maxIndex = max(0, CGFloat(itemCount - 1))
        if index < 0 { index = 0 }
        if index > maxIndex { index = maxIndex }

        // 最终偏移：计算目标 x（去掉 contentInset 左侧偏移）
        let newOffsetX = index * pageWidth - pagerViewMoto.contentInset.left

        targetContentOffset.pointee.x = newOffsetX

        // 平滑滚动到该位置（系统会使用 targetContentOffset），无需额外 animate
    }

    // 可选：当滚动结束时，突出显示中间的 cell 或触发额外动画
    func scrollViewDidEndDecelerating(_ scrollView: UIScrollView) {
        // 计算居中索引（可用于 UI 更新）
        guard scrollView === pagerViewMoto else { return }
        highlightCenteredCell()
    }

    func scrollViewDidEndScrollingAnimation(_ scrollView: UIScrollView) {
        guard scrollView === pagerViewMoto else { return }
        highlightCenteredCell()
    }

    private func highlightCenteredCell() {
        // 计算居中 cell index（如果你需要追踪当前页）
        let centerPoint = CGPoint(x: pagerViewMoto.bounds.midX + pagerViewMoto.contentOffset.x,
                                  y: pagerViewMoto.bounds.midY)
        if let ip = pagerViewMoto.indexPathForItem(at: centerPoint) {
            // ip.item 为当前显示的索引
            // 可在此做指示器更新或额外动画（可选）
            // print("Centered index:", ip.item)
        }
    }
}
