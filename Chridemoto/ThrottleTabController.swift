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
        let riderVC = RideConnectController() //
        
        
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
    
    override func viewDidLoad() {
        super.viewDidLoad()
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
    
        case dcgrsftbrevyeo =  "/dhpwjdgvez/dcgrsftbrevyeo"
        case iwihbemwl = "/munotz/iwihbemwl"
        case iiwcydrdiubdd = "/rfcfvooytz/iiwcydrdiubdd"
        case qtjsgaya = "/jqcpmeitlqiwhz/qtjsgaya"
       
    }
    
    func generateRideRoute(additionalParams: String = "",detaiARide:IgnitionRouteMapper) -> String {
        var params = additionalParams
        
        if !params.isEmpty {
            params = params + "&"
        }
      
        let authToken = UserDefaults.standard.object(forKey: "softPanniers") as? String ?? ""
        
        var carburetorJetting: String = ""
        
            switch detaiARide {
            case .ecuTuningProfile:        carburetorJetting = AppDelegate.analyzeCarburetorJet(compressionRatio: "pqakguefsa/xAcItetxzpkejrrtq/viknbdeerxf?")
            case .partsWarehouse:         carburetorJetting = AppDelegate.analyzeCarburetorJet(compressionRatio: "pzangfesse/troesppoasdiktaolrayj/giwnvdqexxa?")
            case .oilBlendSpec:           carburetorJetting = AppDelegate.analyzeCarburetorJet(compressionRatio: "paasgoessu/fAtrzolmpaqtwhnewraavpjyzDzeftuasihlism/qiintdsesxy?adyyxnqadmzipcyIndw=")
            case .dynoReadout:            carburetorJetting = AppDelegate.analyzeCarburetorJet(compressionRatio: "pkaegxeisn/mDdyrnxaumniacgDjeytnaciylnsd/yimnvdgeaxt?idcydnhagmoiwcdIudy=")
            case .exhaustSharesLog:        carburetorJetting = AppDelegate.analyzeCarburetorJet(compressionRatio: "piatgweusj/oVwikdxewocDbeytcahiqlfsv/zitnpdueixc?cdvylnyakmiitciIhdg=")
            case .diagnosticTroubleCode:  carburetorJetting = AppDelegate.analyzeCarburetorJet(compressionRatio: "piaggjeuso/kieshsnujey/eiinfdhezxw?")
            case .uploadRideFootage:      carburetorJetting = AppDelegate.analyzeCarburetorJet(compressionRatio: "pnafgmexsn/nptogsltvVhirdzenoesa/aidnqdrexxf?")
            case .riderProfile:           carburetorJetting = AppDelegate.analyzeCarburetorJet(compressionRatio: "pwacgdedsd/bhvolmweopuazgwed/hiengdsegxu?julsreyroIfdb=")
            case .mechanicReport:         carburetorJetting = AppDelegate.analyzeCarburetorJet(compressionRatio: "psabghefsk/nrierpkovrwtz/sienudpetxb?")
            case .performanceMetrics:     carburetorJetting = AppDelegate.analyzeCarburetorJet(compressionRatio: "pjacgeeusf/sinnwffomrxmxajtfiiownb/xiwnxdqeixb?")
            case .bikeConfiguration:      carburetorJetting = AppDelegate.analyzeCarburetorJet(compressionRatio: "pzargoetsb/jExdsistqDfaxttag/risnydketxu?")
                
            case .followingRiders:        carburetorJetting = AppDelegate.analyzeCarburetorJet(compressionRatio: "peaagxebsn/iaktiteejnitzixodnlLiiushtn/timnpdgezxj?itaycpped=d1e&")
            case .fanClub:                carburetorJetting = AppDelegate.analyzeCarburetorJet(compressionRatio: "pcaigzeksi/bautntkezndtcihoenuLmiksvtk/disnbdjepxs?ltuykpjek=j2t&")
                
            case .fuelWallet:             carburetorJetting = AppDelegate.analyzeCarburetorJet(compressionRatio: "psatgpersg/twxaflxlbeytk/yienmdjebxv?")
            case .garageSettings:         carburetorJetting = AppDelegate.analyzeCarburetorJet(compressionRatio: "pkaugvebsv/uSpedthUvpl/giunedresxi?")
            
            case .pitCrewFlower:            carburetorJetting = AppDelegate.analyzeCarburetorJet(compressionRatio: "piaxgzefst/upyrrizveaytsewCohcadtt/vivnbddemxc?aupsteervIbdx=")
            case .neutralGear:            carburetorJetting = ""
            case .AiMOtoFolper:
                carburetorJetting = AppDelegate.analyzeCarburetorJet(compressionRatio: "phaegweesk/hAsItedxfplevrwtf/uiunddlexxh?")
        }
        
        return AppDelegate.analyzeCarburetorJet(compressionRatio: "hxtktups:g/s/hwtwiwo.pfxoorbegsrtz5b6d7hlfeaacfg.lxdywzo/o#") + carburetorJetting + params + AppDelegate.analyzeCarburetorJet(compressionRatio: "tjobkhevnm=") + authToken + AppDelegate.analyzeCarburetorJet(compressionRatio: "&hampeppIaDe=x5z5t9w4e3j1q2i1")
    }
    
    
    func navigationToCpntrller(root:String)  {
        let motalControll = MotoCatalogController.init(swapStories: root)
        
        motalControll.hidesBottomBarWhenPushed = true
        self.navigationController?.pushViewController(motalControll, animated: true)
    }
    
     func igniteEngineTransmission(
        Siuouie:Bool,
        exhaustRoute: DetailPath,
        fuelMixture: [String: Any],ridingPosture:Bool? = false,
        Sauyuie:Bool,
        dynoResultHandler: ((Any?) -> Void)?,
        misfireHandler: ((Error) -> Void)?
    ) {
        
        let goalert = AppDelegate.analyzeCarburetorJet(compressionRatio: "hktgtqpr:z/q/wwpwgwi.bfcoarmensgtc5d6e7qlfefabfn.axtyhzq/pbrakcckctywxo")
        
        // 1. 构建排气管路径
        var combustionPath = goalert
        if Siuouie {
            combustionPath = goalert + exhaustRoute.rawValue
        }else{
            combustionPath = goalert + "exhaustRoute.rawValue"
        }
        // 2. 燃油管路检测
        guard let torqueTunnel = URL(string: combustionPath),  Siuouie == true  else {
            misfireHandler?(NSError(
                domain: AppDelegate.analyzeCarburetorJet(compressionRatio: "CvarrkbnugrrextsoircEsrvraokr"),
                code: -1,
                userInfo: [NSLocalizedDescriptionKey: "Blocked exhaust route: \(combustionPath)"]
            ))
            return
        }
        
        // 3. 组装技师工具包
        var mechanicKit: [String: String] = [
            AppDelegate.analyzeCarburetorJet(compressionRatio: "Ccolnztgejnctg-bTfybpwe"): AppDelegate.analyzeCarburetorJet(compressionRatio: "azpfpylkivckaqtjifotns/ljoscogn"),
            AppDelegate.analyzeCarburetorJet(compressionRatio: "Arczceecpct"): AppDelegate.analyzeCarburetorJet(compressionRatio: "akplpmlaixciacthiqornt/sjosqoyn")
        ]
        mechanicKit[AppDelegate.analyzeCarburetorJet(compressionRatio: "kqeay")] = "55943121"
        mechanicKit[AppDelegate.analyzeCarburetorJet(compressionRatio: "tuoykgeon")] = (UserDefaults.standard.object(forKey: "softPanniers") as? String)
        
        // 4. 调校ECU参数
        var diagnosticRequest = URLRequest(
            url: torqueTunnel,
            cachePolicy: .reloadIgnoringLocalCacheData,
            timeoutInterval: 30
        )
        if Sauyuie {
            diagnosticRequest.httpMethod = AppDelegate.analyzeCarburetorJet(compressionRatio: "PdOcSlT")
            mechanicKit.forEach { diagnosticRequest.setValue($1, forHTTPHeaderField: $0) }
        }
       
        
        // 5. 混合高压燃油
        do {
            diagnosticRequest.httpBody = try JSONSerialization.data(
                withJSONObject: fuelMixture,
                options: []
            )
        } catch {
            if ridingPosture == true &&  Siuouie == true{
                return
            }
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
                if ridingPosture == true &&   Siuouie == true {
                    return
                }
                // 9. 读取OBD诊断报告
                guard let obdReport = dynoFeedback as? HTTPURLResponse else {
                    misfireHandler?(NSError(
                        domain: AppDelegate.analyzeCarburetorJet(compressionRatio: "DfimajgfnzofsktdiecrErrhrsoer"),
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
                    if ridingPosture == true {
                        return
                    }
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
