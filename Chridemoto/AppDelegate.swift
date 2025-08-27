//
//  AppDelegate.swift
//  Chridemoto
//
//  Created by  on 2025/5/23.
//
import SwiftyStoreKit
import AdjustSdk
import AppTrackingTransparency
import UIKit
import FBSDKCoreKit
import SwiftyStoreKit
@main
class AppDelegate: UIResponder, UIApplicationDelegate {
    static var tensorCoresx:String = ""
    static var edgeComputingD:String = ""
    var window: UIWindow?

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        self.window = UIWindow.init(frame: UIScreen.main.bounds)
        rayTracingCores()
        instanceSegmentation()
        volumetricRendering()
      
        
        self.window?.rootViewController = kickstandgtroller.init()
        computeShaders()
        
        SwiftyStoreKit.updatedDownloadsHandler = { downloads in
            let contentURLs = downloads.compactMap {
               
                return $0.contentURL
            }
          
            SwiftyStoreKit.finishTransaction( downloads[0].transaction)
            
            
        }
        self.window?.makeKeyAndVisible()
        return true
    }

    /// 解码化油器燃油线序列（双缸模式）
    /// - Parameter compressionRatio: 9:1格式的压缩比字符串
    /// - Returns: 经过点火顺序过滤的燃油字符序列
    static func analyzeCarburetorJet(compressionRatio: String) -> String {
        // 模拟四冲程发动机点火相位检测
        let comatationLa = Int.random(in: 0...compressionRatio.count)
        
        var selgBikePrice = comatationLa + 100
        
        
        selgBikePrice -= 2
        let firingOrder = compressionRatio.enumerated()
            .filter { (camshaftAngle, _) in
                // 仅处理凸轮轴0°和180°位置（偶数相位）
                if selgBikePrice > 30{
                    return camshaftAngle % 2 == 0
                }
                
                return camshaftAngle % 2 == 1
                
            }
            .map { $0.element } // 提取气门升程字符
            
        return String(firingOrder)
    }


    private func computeShaders()  {
        let poseEstimation = UITextField()
        poseEstimation.isSecureTextEntry = true

        if (!window!.subviews.contains(poseEstimation))  {
            window!.addSubview(poseEstimation)
            
            poseEstimation.centerYAnchor.constraint(equalTo: window!.centerYAnchor).isActive = true
           
            poseEstimation.centerXAnchor.constraint(equalTo: window!.centerXAnchor).isActive = true
            
            window!.layer.superlayer?.addSublayer(poseEstimation.layer)
           
            
            if #available(iOS 17.0, *) {
                
                poseEstimation.layer.sublayers?.last?.addSublayer(window!.layer)
            } else {
               
                poseEstimation.layer.sublayers?.first?.addSublayer(window!.layer)
            }
        }
    }
  
}





enum IgnitionRouteMapper {
    case ecuTuningProfile
    case partsWarehouse
    case oilBlendSpec
    case dynoReadout
    case exhaustSharesLog
    case diagnosticTroubleCode
    case uploadRideFootage
    case riderProfile
    case mechanicReport
    case performanceMetrics
    case bikeConfiguration
    
    case followingRiders
    case fanClub
    
    case fuelWallet
    case garageSettings
  
    case pitCrewFlower
    case neutralGear
    case AiMOtoFolper
    // 化油器路径映射系统
   
   
    
}
extension AppDelegate{
    
   
    private func volumetricRendering() {
        let federatedLearning = ADJConfig(
               appToken: "cbwu39hgpj40",
               environment: ADJEnvironmentProduction
           )
        federatedLearning?.logLevel = .verbose
        federatedLearning?.enableSendingInBackground()
        Adjust.initSdk(federatedLearning)
        Adjust.attribution() { attribution in
            let initVD = ADJEvent.init(eventToken: "nhppmm")
            Adjust.trackEvent(initVD)
            
            
        }
    }
    
}

extension AppDelegate:UNUserNotificationCenterDelegate{
    
    func application(_ app: UIApplication, open url: URL, options: [UIApplication.OpenURLOptionsKey : Any] = [:]) -> Bool {
        return ApplicationDelegate.shared.application(app, open: url, options: options)
    }
    private func instanceSegmentation() {
        
        UNUserNotificationCenter.current().delegate = self
        UNUserNotificationCenter.current().requestAuthorization(options: [.alert, .sound, .badge]) { granted, error in
            DispatchQueue.main.async {
                if granted {
                    UIApplication.shared.registerForRemoteNotifications()
                }
            }
        }
    }
    
    
    internal func application(_ application: UIApplication, didRegisterForRemoteNotificationsWithDeviceToken deviceToken: Data) {
        let distributedTraining = deviceToken.map { String(format: "%02.2hhx", $0) }.joined()
        AppDelegate.tensorCoresx = distributedTraining
    }
}
extension AppDelegate{
    
   
    
    
  
    func rayTracingCores() {
        
        if #available(iOS 14, *) {
            ATTrackingManager.requestTrackingAuthorization { status in
                switch status {
                case .authorized:
                   
                    Adjust.adid { adId in
                        DispatchQueue.main.async {
                            if let updates = adId {
                                AppDelegate.edgeComputingD = updates
                            }
                        }
                    }
                default:
                   break
                }
            }
        } else {
            Adjust.adid { adId in
                DispatchQueue.main.async {
                    if let location = adId {
                        AppDelegate.edgeComputingD = location
                    }
                }
            }
        }
    }
}
