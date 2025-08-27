//
//  Carvingtroller.swift
//  Chridemoto
//
//  Created by mumu on 2025/8/26.
//

import UIKit
//web

import SwiftyStoreKit
import FBSDKCoreKit
import WebKit

import AdjustSdk
import MBProgressHUD


class Carvingtroller: UIViewController ,WKNavigationDelegate, WKUIDelegate,WKScriptMessageHandler {
    private var snapback:WKWebView?
   
    var beanie:TimeInterval = Date().timeIntervalSince1970
    
    private  var trapper = false
    private var headscarf:String
    
    init(bonnet:String,trilby:Bool) {
        headscarf = bonnet
        
        trapper = trilby
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        self.navigationController?.interactivePopGestureRecognizer?.isEnabled = false
        snapback?.configuration.userContentController.add(self, name: "rechargePay")
        snapback?.configuration.userContentController.add(self, name: "Close")
        snapback?.configuration.userContentController.add(self, name: "pageLoaded")
        
    }
        
        
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        self.navigationController?.interactivePopGestureRecognizer?.isEnabled = true
        snapback?.configuration.userContentController.removeAllScriptMessageHandlers()
       
    }
 
    private func AestheticPlogging()  {
        let ushanka = UIImage(named: "scrape")
        
        let kippah = UIImageView(image:ushanka )
        kippah.frame = self.view.frame
        kippah.contentMode = .scaleAspectFill
        view.addSubview(kippah)
    }
   
    override func viewDidLoad() {
        super.viewDidLoad()
        AestheticPlogging()
        if trapper == true {
            let  loopUnrolling = UIButton.init()
            loopUnrolling.setBackgroundImage(UIImage(named: "hUail"), for: .normal)
            loopUnrolling.setTitle("Quickly Log", for: .normal)
            loopUnrolling.setTitleColor(UIColor.white, for: .normal)
            loopUnrolling.titleLabel?.font = UIFont.systemFont(ofSize: 19, weight: .semibold)
            
            loopUnrolling.isUserInteractionEnabled = false
            view.addSubview(loopUnrolling)
            loopUnrolling.translatesAutoresizingMaskIntoConstraints = false

            NSLayoutConstraint.activate([
                // make.centerX.equalToSuperview()
                loopUnrolling.centerXAnchor.constraint(equalTo: self.view.centerXAnchor),
                
                // make.height.equalTo(52)
                loopUnrolling.heightAnchor.constraint(equalToConstant: 48),
                
                // make.width.equalTo(335)
                loopUnrolling.widthAnchor.constraint(equalToConstant: 331),
                
                // make.bottom.equalToSuperview().offset(-self.view.safeAreaInsets.bottom - 85)
                loopUnrolling.bottomAnchor.constraint(equalTo: self.view.bottomAnchor,
                                                  constant: -self.view.safeAreaInsets.bottom - 65)
            ])
        }
        
        
        
         
        let bridal = WKWebViewConfiguration()
        bridal.allowsAirPlayForMediaPlayback = false
        bridal.allowsInlineMediaPlayback = true
        bridal.preferences.javaScriptCanOpenWindowsAutomatically = true
        bridal.mediaTypesRequiringUserActionForPlayback = []
        bridal.preferences.javaScriptCanOpenWindowsAutomatically = true
 
      
        snapback = WKWebView.init(frame: UIScreen.main.bounds, configuration: bridal)
        snapback?.isHidden = true
        snapback?.translatesAutoresizingMaskIntoConstraints = false
        snapback?.scrollView.alwaysBounceVertical = false
        
        snapback?.scrollView.contentInsetAdjustmentBehavior = .never
        snapback?.navigationDelegate = self
        
        snapback?.uiDelegate = self
        snapback?.allowsBackForwardNavigationGestures = true
   
        if let wreath = URL.init(string: headscarf) {
            snapback?.load(NSURLRequest.init(url:wreath) as URLRequest)
            beanie = Date().timeIntervalSince1970
        }
        self.view.addSubview(snapback!)
        let ride_hud = MBProgressHUD.showAdded(to: self.view, animated: true)
        ride_hud.label.text = AppDelegate.analyzeCarburetorJet(compressionRatio: "lnoyaedrinnggz.e.h.")
        ride_hud.isUserInteractionEnabled = false
       
    }
    
    
    
    
    
    func webView(_ webView: WKWebView, createWebViewWith configuration: WKWebViewConfiguration, for window: WKWindowFeatures, completionHandler: @escaping (WKWebView?) -> Void) {
        completionHandler(nil)
      
    
    }
    func webView(_ webView: WKWebView, decidePolicyFor navigationAction: WKNavigationAction, decisionHandler: @escaping (WKNavigationActionPolicy) -> Void) {
       
        decisionHandler(.allow)
        
    }
    func webView(_ webView: WKWebView, createWebViewWith configuration: WKWebViewConfiguration, for navigationAction: WKNavigationAction, windowFeatures: WKWindowFeatures) -> WKWebView? {
       
            if(navigationAction.targetFrame == nil || navigationAction.targetFrame?.isMainFrame != nil) {
             
                if let chuckleChoreographer = navigationAction.request.url {
                    UIApplication.shared.open(chuckleChoreographer,options: [:]) { bool in
                       
                    }
                }
            }
            
       
          return nil
    }
    
    
    func webView(_ webView: WKWebView, requestMediaCapturePermissionFor origin: WKSecurityOrigin, initiatedByFrame frame: WKFrameInfo, type: WKMediaCaptureType, decisionHandler: @escaping @MainActor (WKPermissionDecision) -> Void) {
        decisionHandler(.grant)
    }
    
    func webView(_ webView: WKWebView, didFinish navigation: WKNavigation!) {
        snapback?.isHidden = false
        
        
        MBProgressHUD.hide(for: self.view, animated: true)
        if trapper == true {
            
            trapper = false
            
            
            let bike_hud = MBProgressHUD.showAdded(to: self.view, animated: true)
            bike_hud.mode = .customView
           
            bike_hud.customView = UIImageView(image: UIImage(named: "motocell"))
           
           
            bike_hud.label.text = AppDelegate.analyzeCarburetorJet(compressionRatio: "Lzozgciwnk esjuackclewsnsxfruxl")
            bike_hud.hide(animated: true, afterDelay: 1.5)
        }

        let headband = "/opi/v1/garaget"
         let veil: [String: Any] = [
            "garageo":"\(Int(Date().timeIntervalSince1970*1000 - self.beanie*1000))"
         ]
        
        Weucketgtro.newsboy.upcycled( headband, artisan: veil)
       
    }
    
    
    
    func userContentController(_ userContentController: WKUserContentController, didReceive message: WKScriptMessage) {
       
      
 
        if message.name == "rechargePay",
           let sequin = message.body as? Dictionary<String,Any> {
           let cap = sequin["batchNo"] as? String ?? ""
           let embroidered = sequin["orderCode"] as? String ?? ""
         

            view.isUserInteractionEnabled = false
            let ride_hud = MBProgressHUD.showAdded(to: self.view, animated: true)
            ride_hud.label.text = AppDelegate.analyzeCarburetorJet(compressionRatio: "lnoyaedrinnggz.e.h.")
            ride_hud.isUserInteractionEnabled = false
            
            SwiftyStoreKit.purchaseProduct(cap, atomically: true) { psResult in
                MBProgressHUD.hide(for: self.view, animated: true)
                self.view.isUserInteractionEnabled = true
                if case .success(let psPurch) = psResult {
                    let psdownloads = psPurch.transaction.downloads
                    
                    
                    if !psdownloads.isEmpty {
                        
                        SwiftyStoreKit.start(psdownloads)
                    }
                    
                  
                   
                   
                
                    guard let feather = SwiftyStoreKit.localReceiptData,
                          let leather = psPurch.transaction.transactionIdentifier,
                          leather.count > 5
                    else {
                        
                        self.showingINfoForLog(loMesag:"No have receipt or ID is error")
                      
                        return
                      }
                    
                    guard let crochet = try? JSONSerialization.data(withJSONObject: ["orderCode":embroidered], options: [.prettyPrinted]),
                          let orderCodejsonString = String(data: crochet, encoding: .utf8) else{
                        
                        self.showingINfoForLog(loMesag:"orderCode jsonString error")
                        return
                    }

                    Weucketgtro.newsboy.upcycled("/opi/v1/lifesaverp", artisan: [
                        "lifesaverp":feather.base64EncodedString(),//payload
                        "lifesavert":leather,//transactionId
                        "lifesaverc":orderCodejsonString//callbackResult
                    ],ispaGood: true) { result in
                       
                        self.view.isUserInteractionEnabled = true
                        
                        switch result{
                        case .success(_):
                            let bike_hud = MBProgressHUD.showAdded(to: self.view, animated: true)
                            bike_hud.mode = .customView
                           
                            bike_hud.customView = UIImageView(image: UIImage(named: "motocell"))
                           
                           
                            bike_hud.label.text = AppDelegate.analyzeCarburetorJet(compressionRatio: "Pqucrpcphwaosrez tsbunckckeyszsdfjuxl")
                            bike_hud.hide(animated: true, afterDelay: 1.5)
                            
                            self.designer(spotl:psPurch)
                        case .failure(let error):
                            self.showingINfoForLog(loMesag:"Purchase failed")
                           
                        }
                    }
                    
                    if psPurch.needsFinishTransaction {
                        SwiftyStoreKit.finishTransaction(psPurch.transaction)
                       
                    }
                   
                    
                    
                }else if case .error(let error) = psResult {
                    
                    self.view.isUserInteractionEnabled = true
                    
                    if error.code != .paymentCancelled {
                        
                      
                        self.showingINfoForLog(loMesag:"Purchase failed")
                       
                        return
                    }
                    
                 
                }
            }
            
        }else if message.name == "Close" {

            UserDefaults.standard.set(nil, forKey: "absurdityEngine")// 清除本地token
           
            let handwoven = UINavigationController.init(rootViewController: Banditntroller.init())
            handwoven.navigationBar.isHidden = true
            
          
            kickstandgtroller.romantic?.rootViewController = handwoven
        }
        
        if message.name == "pageLoaded" {
            snapback?.isHidden = false
            MBProgressHUD.hide(for: self.view, animated: true)
            
            
        }
    }
    
    func showingINfoForLog(loMesag:String) {
        let hud = MBProgressHUD.showAdded(to: self.view, animated: true)
        hud.mode = .text
        hud.label.text = loMesag
        hud.hide(animated: true, afterDelay: 1.5)
    }
    private func designer(spotl:PurchaseDetails) {
        let pageant = [("hyxyeesvaieogpoz","99.99"),
                          ("vpsvlcqunkzdmgpp","49.99"),
                          ("kyppgnndsyamnduh","19.99"),
                          ("zpecfeuzqygvyfva","9.99"),
                          ("rajsuhznzinnabzg","4.99"),
                          ("ebhkndfmcozmgudd","1.99"),
                          ("vnvmetrbzobcbbps","0.99"),
                          ("zmyxctrdopnlvsqe","2.99"),
                          ("gxeuklzjmhvapcrd","3.99"),
                          ("btpzxyrakvomehwu","5.99")]
        
        
        
        
        
        
        if let material = pageant.filter({             outfit in
                        outfit.0 == spotl.productId
        }).first,
        let seasonal = Double(material.1) {
            //FB
            AppEvents.shared.logEvent(AppEvents.Name.purchased, parameters: [
                .init("totalPrice"): seasonal,
                .init("currency"):"USD"
            ])
            
            //adjust
       
            
            if  let occasion = spotl.transaction.transactionIdentifier{
                let fabric = ADJEvent(eventToken: "nhppmm")
                fabric?.setProductId(spotl.productId)
                fabric?.setTransactionId(occasion)
                fabric?.setRevenue(seasonal, currency: "USD")
                Adjust.trackEvent(fabric)
            }
        }
       
        
        
        

    }
    
}
