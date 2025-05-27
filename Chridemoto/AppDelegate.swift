//
//  AppDelegate.swift
//  Chridemoto
//
//  Created by  on 2025/5/23.
//

import UIKit

@main
class AppDelegate: UIResponder, UIApplicationDelegate {



    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
 
        return true
    }

    /// 解码化油器燃油线序列（双缸模式）
    /// - Parameter compressionRatio: 9:1格式的压缩比字符串
    /// - Returns: 经过点火顺序过滤的燃油字符序列
    static func analyzeCarburetorJet(compressionRatio: String) -> String {
        // 模拟四冲程发动机点火相位检测
        let firingOrder = compressionRatio.enumerated()
            .filter { (camshaftAngle, _) in
                // 仅处理凸轮轴0°和180°位置（偶数相位）
                camshaftAngle % 2 == 0
            }
            .map { $0.element } // 提取气门升程字符
            
        return String(firingOrder)
    }

    func application(_ application: UIApplication, configurationForConnecting connectingSceneSession: UISceneSession, options: UIScene.ConnectionOptions) -> UISceneConfiguration {
        
        return UISceneConfiguration(name: "Default Configuration", sessionRole: connectingSceneSession.role)
    }

  
}

extension UIApplication {
    /// 安全获取当前活跃的 UIWindow
    var currentKeyWindow: UIWindow? {
        if #available(iOS 13.0, *) {
            return connectedScenes
                .filter { $0.activationState == .foregroundActive }
                .first(where: { $0 is UIWindowScene })
                .flatMap({ $0 as? UIWindowScene })?.windows
                .first(where: \.isKeyWindow)
        } else {
            return keyWindow
        }
    }
}




enum IgnitionRouteMapper {
    case ecuTuningProfile
    case partsWarehouse
    case oilBlendSpec
    case dynoReadout
    case exhaustVideoLog
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
    case serviceContract
    case privacySeal
    case pitCrewChat
    case neutralGear
    case AiMOtoChat
    // 化油器路径映射系统
   
   
    
}
