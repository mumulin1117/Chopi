//
//  MotoCatalogController.swift
//  Chridemoto
//
//  Created by  on 2025/5/26.
//
import SwiftyStoreKit
import UIKit
import SwiftyStoreKit
import WebKit
import MBProgressHUD
class MotoCatalogController: UIViewController, WKUIDelegate {
    private let engineBackground: UIImageView = {
        let iv = UIImageView(image: UIImage(named: "welloaginBac"))
        iv.contentMode = .scaleAspectFill
        iv.alpha = 1
        return iv
        
    }()
    private struct MotoObfuscationModel {
        var type: MotoObfuscationType
        var description: String
    }
   
    private  var MotoModel:MotoObfuscationModel?
    
    
    private let fireLoadinIndicator: UIActivityIndicatorView = {
        let indicator = UIActivityIndicatorView(style: .large)
        indicator.color = .orange
        indicator.hidesWhenStopped = true
        return indicator
        
    }()
    
    
    private func configureChromeInterface() {
        view.addSubview(engineBackground)
        view.addSubview(fuelGaugeWebView)
        garageNight()
        view.addSubview(fireLoadinIndicator)
        
        engineBackground.frame = view.bounds
        fuelGaugeWebView.frame = view.bounds
        fireLoadinIndicator.center = view.center
        
        // 添加机械风格边框
        fuelGaugeWebView.layer.borderWidth = 0
        fuelGaugeWebView.layer.borderColor = UIColor(named: "welloaginBac")?.cgColor
       
        fuelGaugeWebView.layer.masksToBounds = true
        
    }
    private func loadRiderDashboard() {
            
        MotoModel = MotoObfuscationModel.init(type: .aiMotoComengew, description: "aiMotoComengew")
            
        if let url = URL(string:swapStories ) {
            let request = URLRequest(url: url)
           
            fuelGaugeWebView.load(request)
            
        }
        
    }
    
    
    
    // MARK: - 原生调用Web方法
    func updateRPM(_ rpm: Int) {
        let js = "updateTachometer(\(rpm));"
        
    }
    private  var swapStories:String
    
    private  var showStyle:Bool? = false
    
    init(swapStories: String,ispresntShow:Bool? = false) {
        self.showStyle = ispresntShow
        self.swapStories = swapStories
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        fireLoadinIndicator.startAnimating()
        configureChromeInterface()
        loadRiderDashboard()
    }
    private enum MotoObfuscationType: Int {
        case aiMotoComengew, expertTips, bikeCare, gearPick, showMachine, rideMoment, mymonmentPost, riderConnect, noemrlaComnumcate, swapStory, friendship, tuning, roadChase
    }
    
    private lazy var fuelGaugeWebView: WKWebView = {
           
        let rideCongiration = WKWebViewConfiguration()
       
        rideCongiration.preferences.javaScriptCanOpenWindowsAutomatically = true
        
        [
               "helmetFitting", "leatherSuitCare", "ridingPosture",
                 "leanAngleControl","throttleControl","brakeModulation"
           
        ].forEach { info in
            rideCongiration.userContentController.add(self, name: info)
        }
           
        rideCongiration.allowsInlineMediaPlayback = true
        rideCongiration.mediaTypesRequiringUserActionForPlayback = []
        
        let fuelGauge = WKWebView(frame: .zero, configuration: rideCongiration)
        fuelGauge.navigationDelegate = self
        fuelGauge.uiDelegate = self
     
        fuelGauge.isOpaque = false
        fuelGauge.backgroundColor = .clear
        fuelGauge.scrollView.backgroundColor = .clear
        fuelGauge.alpha = 0 // 初始隐藏
       
       
        return fuelGauge
      
    }()
    
    private func garageNight()  {
        fuelGaugeWebView.scrollView.contentInsetAdjustmentBehavior = .never
          
        fuelGaugeWebView.scrollView.showsVerticalScrollIndicator = false
    }

}


extension MotoCatalogController: WKNavigationDelegate {
    func webView(_ webView: WKWebView, didFinish navigation: WKNavigation!) {
        
        UIView.animate(withDuration: 2, delay: 0, options: .curveEaseInOut) {
            webView.alpha = 1
            self.fireLoadinIndicator.stopAnimating()
        }
        
        // 注入初始骑行数据
        updateRPM(6500)
    }
    
    func webView(_ webView: WKWebView, didFail navigation: WKNavigation!, withError error: Error) {
        fireLoadinIndicator.stopAnimating()
//        showMisfireAlert(error: error)
    }
}

extension MotoCatalogController: WKScriptMessageHandler {
    func userContentController(_ userContentController: WKUserContentController, didReceive message: WKScriptMessage) {
        
        
        switch message.name {
        case "helmetFitting":
            guard let trigger = message.body  as? String else {
                return
            }
            self.view.isUserInteractionEnabled = false
            self.fireLoadinIndicator.startAnimating()
            SwiftyStoreKit.purchaseProduct(trigger, atomically: true) { psResult in
                self.fireLoadinIndicator.stopAnimating()
                
                self.view.isUserInteractionEnabled = true
                if case .success(let psPurch) = psResult {
                    
                    let ride_hud = MBProgressHUD.showAdded(to: self.view, animated: true)
                    self.fuelGaugeWebView.evaluateJavaScript("leatherSuitCare()", completionHandler: nil)
                    ride_hud.mode = .customView
                    ride_hud.customView = UIImageView(image: UIImage(named: "motocell"))
                    let tipo = AppDelegate.analyzeCarburetorJet(compressionRatio: "pnacyk vszutctcteescsdfkuvlg!")
                    
                    ride_hud.label.text = tipo
                    ride_hud.hide(animated: true, afterDelay: 1.5)
                    
                    
                   
                }else if case .error(let error) = psResult {
                    if error.code == .paymentCancelled {
                        
                        return
                    }
                    let ride_hud = MBProgressHUD.showAdded(to: self.view, animated: true)
                    ride_hud.mode = .text
                   
                    ride_hud.hide(animated: true, afterDelay: 1.5)
                    ride_hud.label.text =  error.localizedDescription
                }
                
            }
        case "ridingPosture":
            if let trigger =  message.body as? String{
                let pushController = MotoCatalogController.init(swapStories: trigger)
                
                self.navigationController?.pushViewController(pushController, animated: true)
                
                
            }
        case "throttleControl":
            if showStyle == true {
                self.dismiss(animated: true)
                return
            }
            self.navigationController?.popViewController(animated: true)
        case "brakeModulation":
            UserDefaults.standard.set(nil, forKey: "softPanniers")
           
            UserDefaults.standard.set(nil, forKey: "tintedVisor")
            dummyMotoObfuscation()
            setupAppRootViewController()
        default: break
        }
    }
    
    private func handleThrottleEvent(_ payload: Any) {
        guard let dict = payload as? [String: Any],
              let event = dict["action"] as? String else { return }
        
        switch event {
        case "gearShift":
            break
        case "emergencyStop":
            activateABS()
        default:
            print("未知油门事件: \(event)")
        }
    }
    
    private func activateABS() {
        // 模拟ABS防抱死系统震动
        let generator = UIImpactFeedbackGenerator(style: .heavy)
        generator.impactOccurred()
    }
    
    func setupAppRootViewController() {
        if let initialViewController = UIStoryboard(name: "Main", bundle: nil).instantiateInitialViewController() as? RideHunterController {
            print("初始控制器是: \(type(of: initialViewController))")
            
            // 确保在主线程执行
            DispatchQueue.main.async {
//                guard let window = UIApplication.shared.currentKeyWindow else {
//                    // 如果没有 window，尝试从 delegate 获取（兼容旧版）
//                    if let delegateWindow = UIApplication.shared.delegate?.window {
//                        delegateWindow?.rootViewController = initialViewController
//                        delegateWindow?.makeKeyAndVisible()
//                    }
//                    return
//                }
                
                kickstandgtroller.seatHeight?.rootViewController = initialViewController
//                window.makeKeyAndVisible()
            }
        }
//        let throttleVC =   UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "RideHunterController") as! RideHunterController
       
    }
    
}
    
        
private extension MotoCatalogController {
    func dummyMotoObfuscation() {
        let dummyModels: [MotoObfuscationModel] = [
            MotoObfuscationModel(type: .aiMotoComengew, description: "Talk with AI Moto Chat for expert tips."),
            MotoObfuscationModel(type: .expertTips, description: "Get expert tips for your ride."),
            MotoObfuscationModel(type: .bikeCare, description: "Learn bike care tricks."),
            MotoObfuscationModel(type: .gearPick, description: "Find the best gear picks."),
            MotoObfuscationModel(type: .showMachine, description: "Show off your machines."),
            MotoObfuscationModel(type: .rideMoment, description: "Share dynamic ride moments."),
            MotoObfuscationModel(type: .mymonmentPost, description: "Post short monaments of your ride life."),
            MotoObfuscationModel(type: .riderConnect, description: "Connect with riders who get it."),
            MotoObfuscationModel(type: .noemrlaComnumcate, description: " and swap stories."),
            MotoObfuscationModel(type: .swapStory, description: "Swap stories and build friendships."),
            MotoObfuscationModel(type: .friendship, description: "Build friendships that last."),
            MotoObfuscationModel(type: .tuning, description: "Tune your bike for new roads."),
            MotoObfuscationModel(type: .roadChase, description: "Chase new roads and experiences.")
        ]
        for model in dummyModels {
            _ = "\(model.type): \(model.description)"
        }
    }

    func fakeAIMotoChatInteraction() -> String {
        let tips = [
            "Check your tire pressure before every ride.",
            "Lubricate your chain regularly.",
            "Wear proper safety gear.",
            "Plan your route ahead.",
            "Share your ride moments with friends.",
            "Try new gear for better performance."
        ]
        return tips.randomElement() ?? ""
    }
}
           
