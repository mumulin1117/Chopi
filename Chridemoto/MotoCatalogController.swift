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
    
    private lazy var fuelGaugeWebView: WKWebView = {
           
        let config = WKWebViewConfiguration()
        config.allowsInlineMediaPlayback = true
        config.mediaTypesRequiringUserActionForPlayback = []
        config.preferences.javaScriptCanOpenWindowsAutomatically = true
        
        [
               "helmetFitting", "leatherSuitCare", "ridingPosture",
                 "leanAngleControl","throttleControl","brakeModulation"
           
        ].forEach { info in
            config.userContentController.add(self, name: info)
        }
           
        
        let webView = WKWebView(frame: .zero, configuration: config)
        webView.navigationDelegate = self
        webView.uiDelegate = self
     
        webView.isOpaque = false
        webView.backgroundColor = .clear
        webView.scrollView.backgroundColor = .clear
        webView.alpha = 0 // 初始隐藏
        webView.scrollView.contentInsetAdjustmentBehavior = .never
          
        webView.scrollView.showsVerticalScrollIndicator = false
       
        return webView
      
    }()
    
    
    private let loadingIndicator: UIActivityIndicatorView = {
        let indicator = UIActivityIndicatorView(style: .large)
        indicator.color = .orange
        indicator.hidesWhenStopped = true
        return indicator
        
    }()
    
    
    private func configureChromeInterface() {
        view.addSubview(engineBackground)
        view.addSubview(fuelGaugeWebView)
        view.addSubview(loadingIndicator)
        
        engineBackground.frame = view.bounds
        fuelGaugeWebView.frame = view.bounds
        loadingIndicator.center = view.center
        
        // 添加机械风格边框
        fuelGaugeWebView.layer.borderWidth = 0
        fuelGaugeWebView.layer.borderColor = UIColor(named: "welloaginBac")?.cgColor
       
        fuelGaugeWebView.layer.masksToBounds = true
        
    }
    private func loadRiderDashboard() {
            loadingIndicator.startAnimating()
            
            if let url = URL(string:swapStories ) {
                var request = URLRequest(url: url)
               
                fuelGaugeWebView.load(request)
                
            }
        
    }
    
    
    
    // MARK: - 原生调用Web方法
    func updateRPM(_ rpm: Int) {
        let js = "updateTachometer(\(rpm));"
        
    }
    private  var swapStories:String
    init(swapStories: String) {
        
        self.swapStories = swapStories
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        configureChromeInterface()
        loadRiderDashboard()
    }
    

}


extension MotoCatalogController: WKNavigationDelegate {
    func webView(_ webView: WKWebView, didFinish navigation: WKNavigation!) {
        UIView.animate(withDuration: 0.5, delay: 2, options: .curveEaseInOut) {
            webView.alpha = 1
            self.loadingIndicator.stopAnimating()
        }
        
        // 注入初始骑行数据
        updateRPM(6500)
    }
    
    func webView(_ webView: WKWebView, didFail navigation: WKNavigation!, withError error: Error) {
        loadingIndicator.stopAnimating()
//        showMisfireAlert(error: error)
    }
}

extension MotoCatalogController: WKScriptMessageHandler {
    func userContentController(_ userContentController: WKUserContentController, didReceive message: WKScriptMessage) {
        self.loadingIndicator.startAnimating()
        self.view.isUserInteractionEnabled = false
        switch message.name {
        case "helmetFitting":
            guard let trigger = message.body  as? String else {
                return
            }
            
            
            SwiftyStoreKit.purchaseProduct(trigger, atomically: true) { psResult in
                self.loadingIndicator.stopAnimating()
                
                self.view.isUserInteractionEnabled = true
                if case .success(let psPurch) = psResult {
                    
                    let hud = MBProgressHUD.showAdded(to: self.view, animated: true)
                    hud.mode = .customView
                    hud.customView = UIImageView(image: UIImage(named: "Checkmark"))
                    hud.label.text = "pay successful!"
                    hud.hide(animated: true, afterDelay: 1.5)
                    
                    
                    self.fuelGaugeWebView.evaluateJavaScript("leatherSuitCare()", completionHandler: nil)
                }else if case .error(let error) = psResult {
                    if error.code == .paymentCancelled {
                        
                        return
                    }
                    let hud = MBProgressHUD.showAdded(to: self.view, animated: true)
                    hud.mode = .text
                    hud.label.text =  error.localizedDescription
                    hud.hide(animated: true, afterDelay: 1.5)
                   
                }
                
            }
        case "ridingPosture":
            if let trigger =  message.body as? String{
                let pushController = MotoCatalogController.init(swapStories: trigger)
                
                self.navigationController?.pushViewController(pushController, animated: true)
                
                
            }
        case "throttleControl":
            self.navigationController?.popViewController(animated: true)
        case "brakeModulation":
            UserDefaults.standard.set(nil, forKey: "softPanniers")
            UserDefaults.standard.set(nil, forKey: "tintedVisor")
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
        let throttleVC = RideHunterController.init()
        
        // 确保在主线程执行
        DispatchQueue.main.async {
            guard let window = UIApplication.shared.currentKeyWindow else {
                // 如果没有 window，尝试从 delegate 获取（兼容旧版）
                if let delegateWindow = UIApplication.shared.delegate?.window {
                    delegateWindow?.rootViewController = throttleVC
                    delegateWindow?.makeKeyAndVisible()
                }
                return
            }
            
            window.rootViewController = throttleVC
            window.makeKeyAndVisible()
        }
    }
    
}
    
        
       
           
