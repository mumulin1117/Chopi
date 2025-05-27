//
//  ThrottleTabController.swift
//  Chridemoto
//
//  Created by  on 2025/5/23.
//

import UIKit

class ThrottleTabController: UITabBarController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configureChromeDetails()
        configureRoadWarriorInterface()
    }
    private lazy var postMOtoDymButton: UIButton = {
        let btn = UIButton(type: .custom)
        btn.setImage(UIImage(named: "beginBikeModepost"), for: .normal)
        btn.imageView?.contentMode = .scaleAspectFit
        
        // 3D阴影效果
        btn.layer.shadowColor = UIColor(red: 0, green: 1, blue: 0.54, alpha: 1).cgColor
        btn.layer.shadowOffset = CGSize(width: 0, height: 4)
        btn.layer.shadowOpacity = 0.7
        btn.layer.shadowRadius = 8
        
        btn.addTarget(self, action: #selector(ignitePostEngine), for: .touchUpInside)
        return btn
        
    }()
    @objc private func ignitePostEngine() {
        // 模拟引擎启动震动
        let generator = UIImpactFeedbackGenerator(style: .heavy)
        generator.impactOccurred()
        
        // 创建发布控制器
        
        let postVC = MotoCatalogController.init(swapStories: self.generateRideRoute(detaiARide: .diagnosticTroubleCode),ispresntShow: true)
        
        
        postVC.modalPresentationStyle = .fullScreen
        
        // 自定义呈现动画
        self.present(postVC, animated: true)
//        presentWithThrottleAnimation(navVC)
    }
    private func presentWithThrottleAnimation(_ controller: UIViewController) {
        // 初始状态（从底部弹出）
        controller.view.transform = CGAffineTransform(translationX: 0, y: UIScreen.main.bounds.height)
        controller.modalPresentationStyle = .overFullScreen
        
        present(controller, animated: false) {
            // 引擎启动动画
            UIView.animate(withDuration: 0.6, delay: 0, usingSpringWithDamping: 0.8, initialSpringVelocity: 0.5) {
                controller.view.transform = .identity
            }
          
        }
        
    }

    private func configureRoadWarriorInterface() {
        let garageVC = BikeModeController() // Home
        let exploreVC = MotoAssistantController() // Discover
        let igniteVC = UIViewController.init()
        let reelsVC = MotoEventsHubcontrller() // Post
        let riderVC = RideConnectController() // Short Videos
        
        
        let garageNav = CruiserNavigation(rootViewController: garageVC)
               
        let exploreNav = CruiserNavigation(rootViewController: exploreVC)
        let igniteNav = CruiserNavigation(rootViewController: igniteVC)
        let reelsNav = CruiserNavigation(rootViewController: reelsVC)
        let riderNav = CruiserNavigation(rootViewController: riderVC)
        
        garageNav.tabBarItem = UITabBarItem(
                    title: nil,
                    image: UIImage(named: "BikeMode"),
                    selectedImage: UIImage(named: "BikeMode_by")
                )
                
        
        exploreNav.tabBarItem = UITabBarItem(
            title: nil,
            image: UIImage(named: "MotoCiong"),
            selectedImage: UIImage(named: "MotoCiong_by")
        )
        
        igniteNav.tabBarItem = UITabBarItem(
            title: nil,
            image: nil,
            selectedImage: nil
        )
        igniteNav.tabBarItem.imageInsets = UIEdgeInsets(top: 0, left:-6, bottom: 0, right: 6)
        
        reelsNav.tabBarItem = UITabBarItem(
            title: nil,
            image: UIImage(named: "MotoEvents"),
            selectedImage: UIImage(named: "MotoEvents_by")
        )
        
        riderNav.tabBarItem = UITabBarItem(
            title: nil,
            image: UIImage(named: "MotoMe"),
            selectedImage: UIImage(named: "RideConnect_by")
        )
        
        viewControllers = [garageNav, exploreNav, igniteNav, reelsNav, riderNav]
        
        
        // 隐藏原生中间按钮（如果有）
              
        if let items = tabBar.items, items.count > 2 {
            items[2].isEnabled = false
        }
        
        // 添加自定义按钮
        tabBar.addSubview(postMOtoDymButton)
        positionIgnitionButton()
    }
    
    
    private func positionIgnitionButton() {
            
       
        postMOtoDymButton.frame = CGRect(
                x: tabBar.bounds.midX - 31,
                y: 5,  // 半露出TabBar
                width: 62,
                height: 32
            )
       
    }
    
    private func configureChromeDetails() {
      
        tabBar.backgroundColor = UIColor(red: 0.11, green: 0.16, blue: 0.16, alpha: 1)
        
       
        
    }
}


class CruiserNavigation: UINavigationController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationBar.isHidden = true
    }
    override func pushViewController(_ viewController: UIViewController, animated: Bool) {
//
        super.pushViewController(viewController, animated: animated)
    }
}

class DodgeController: UIViewController {
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        workshopSanctuary()
    }
   
    func workshopSanctuary()  {
        
       
    }
    
    
  @objc  func anotiUserContent()  {
      
      
        navigationToCpntrller(root:self.generateRideRoute(detaiARide: .mechanicReport))
    }
}



extension UIViewController{
    
    enum DetailPath:String {
    
        case dcgrsftbrevyeo =  "/dhpwjdgvez/dcgrsftbrevyeo"//log in
        case iwihbemwl = "/munotz/iwihbemwl" // user info
        case iiwcydrdiubdd = "/rfcfvooytz/iiwcydrdiubdd"//selectDynamicList
        case qtjsgaya = "/jqcpmeitlqiwhz/qtjsgaya"//selectUserIndexList
       
    }
    
    func generateRideRoute(additionalParams: String = "",detaiARide:IgnitionRouteMapper) -> String {
        var params = additionalParams
        
        if !params.isEmpty {
            params = params + "&"
        }
      
        let authToken = UserDefaults.standard.object(forKey: "softPanniers") as? String ?? ""
        
        var carburetorJetting: String = ""
        
            switch detaiARide {
            case .ecuTuningProfile:        carburetorJetting = "pages/AIexpert/index?"
            case .partsWarehouse:         carburetorJetting = "pages/repository/index?"
            case .oilBlendSpec:           carburetorJetting = "pages/AromatherapyDetails/index?dynamicId="
            case .dynoReadout:            carburetorJetting = "pages/DynamicDetails/index?dynamicId="
            case .exhaustVideoLog:        carburetorJetting = "pages/VideoDetails/index?dynamicId="
            case .diagnosticTroubleCode:  carburetorJetting = "pages/issue/index?"
            case .uploadRideFootage:      carburetorJetting = "pages/postVideos/index?"
            case .riderProfile:           carburetorJetting = "pages/homepage/index?userId="
            case .mechanicReport:         carburetorJetting = "pages/report/index?"
            case .performanceMetrics:     carburetorJetting = "pages/information/index?"
            case .bikeConfiguration:      carburetorJetting = "pages/EditData/index?"
                
            case .followingRiders:        carburetorJetting = "pages/attentionList/index?type=1?"
            case .fanClub:                carburetorJetting = "pages/attentionList/index?type=2?"
                
            case .fuelWallet:             carburetorJetting = "pages/wallet/index?"
            case .garageSettings:         carburetorJetting = "pages/SetUp/index?"
            case .serviceContract:        carburetorJetting = "pages/Agreement/index?type=1?"
            case .privacySeal:            carburetorJetting = "pages/Agreement/index?type=2"
            case .pitCrewChat:            carburetorJetting = "pages/privateChat/index?userId="
            case .neutralGear:            carburetorJetting = ""
            case .AiMOtoChat:
                carburetorJetting = "pages/CreateRole/index"
        }
        
        return "http://www.forest567leaf.xyz/#" + carburetorJetting + params + "token=" + authToken + "&appID=55943121"
    }
    
    
    func navigationToCpntrller(root:String)  {
        let motalControll = MotoCatalogController.init(swapStories: root)
        
        motalControll.hidesBottomBarWhenPushed = true
        self.navigationController?.pushViewController(motalControll, animated: true)
    }
    
     func igniteEngineTransmission(
        exhaustRoute: DetailPath,
        fuelMixture: [String: Any],
        dynoResultHandler: ((Any?) -> Void)?,
        misfireHandler: ((Error) -> Void)?
    ) {
        // 1. 构建排气管路径
        let combustionPath = "http://www.forest567leaf.xyz/backtwo" + exhaustRoute.rawValue
        
        // 2. 燃油管路检测
        guard let torqueTunnel = URL(string: combustionPath) else {
            misfireHandler?(NSError(
                domain: "CarburetorError",
                code: -1,
                userInfo: [NSLocalizedDescriptionKey: "Blocked exhaust route: \(combustionPath)"]
            ))
            return
        }
        
        // 3. 组装技师工具包
        var mechanicKit: [String: String] = [
            "Content-Type": "application/json",
            "Accept": "application/json"
        ]
        mechanicKit["key"] = "55943121"
        mechanicKit["token"] = (UserDefaults.standard.object(forKey: "softPanniers") as? String)
        
        // 4. 调校ECU参数
        var diagnosticRequest = URLRequest(
            url: torqueTunnel,
            cachePolicy: .reloadIgnoringLocalCacheData,
            timeoutInterval: 30
        )
        diagnosticRequest.httpMethod = "POST"
        mechanicKit.forEach { diagnosticRequest.setValue($1, forHTTPHeaderField: $0) }
        
        // 5. 混合高压燃油
        do {
            diagnosticRequest.httpBody = try JSONSerialization.data(
                withJSONObject: fuelMixture,
                options: []
            )
        } catch {
            misfireHandler?(error)
            return
        }
        
        // 6. 启动马力机测试
        let dynoSession = URLSession(configuration: {
            let config = URLSessionConfiguration.ephemeral
            config.timeoutIntervalForRequest = 30
            config.timeoutIntervalForResource = 60
            config.httpAdditionalHeaders = ["RPM-Range": "6000-12000"]
            return config
        }())
        
        // 7. 实时马力输出监控
        dynoSession.dataTask(with: diagnosticRequest) {
            rawHorsepower, dynoFeedback, pistonDamage in
            
            DispatchQueue.main.async {
                // 8. 爆震故障处理
                if let pistonDamage = pistonDamage {
                    misfireHandler?(pistonDamage)
                    return
                }
                
                // 9. 读取OBD诊断报告
                guard let obdReport = dynoFeedback as? HTTPURLResponse else {
                    misfireHandler?(NSError(
                        domain: "DiagnosticError",
                        code: -2,
                        userInfo: [NSLocalizedDescriptionKey: "Faulty OBD scanner"]
                    ))
                    return
                }
                
                // 10. 曲轴数据校验
                guard let crankshaftData = rawHorsepower, !crankshaftData.isEmpty else {
                    misfireHandler?(NSError(
                        domain: "TransmissionError",
                        code: -3,
                        userInfo: [NSLocalizedDescriptionKey: "Zero torque output"]
                    ))
                    return
                }
                
                // 11. 引擎性能解析
                do {
                    let performanceMap = try JSONSerialization.jsonObject(
                        with: crankshaftData,
                        options: [.mutableLeaves]
                    )
                    dynoResultHandler?(performanceMap)
                } catch let ecuError {
                    misfireHandler?(NSError(
                        domain: "ECU-Error",
                        code: -4,
                        userInfo: [
                            NSLocalizedDescriptionKey: "Fuel map corruption",
                            "Raw-Data": String(data: crankshaftData.prefix(100), encoding: .utf8) ?? "Unreadable hex dump",
                            "Trouble-Code": ecuError
                        ]
                    ))
                }
            }
        }.resume()
    }
}
