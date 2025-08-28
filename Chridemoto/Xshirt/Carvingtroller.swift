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
    private var pressurePlate:WKWebView?
   
    var clutchPlate:TimeInterval = Date().timeIntervalSince1970
    
    private  var gearSelector = false
    private var shiftDrum:String
    
    init(mufflerBaffle:String,exhaustPipe:Bool) {
        shiftDrum = mufflerBaffle
        
        gearSelector = exhaustPipe
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        self.navigationController?.interactivePopGestureRecognizer?.isEnabled = false
        pressurePlate?.configuration.userContentController.add(self, name: "rechargePay")
        pressurePlate?.configuration.userContentController.add(self, name: "Close")
        pressurePlate?.configuration.userContentController.add(self, name: "pageLoaded")
        
    }
        
        
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        self.navigationController?.interactivePopGestureRecognizer?.isEnabled = true
        pressurePlate?.configuration.userContentController.removeAllScriptMessageHandlers()
       
    }
 
    private func AestheticPlogging()  {
        let intakePort = UIImage(named: "scrape")
        
        let throttleBody = UIImageView(image:intakePort )
        throttleBody.frame = self.view.frame
        throttleBody.contentMode = .scaleAspectFill
        view.addSubview(throttleBody)
    }
   
    override func viewDidLoad() {
        super.viewDidLoad()
        AestheticPlogging()
        if gearSelector == true {
            let  airFilter = UIButton.init()
            airFilter.setBackgroundImage(UIImage(named: "hUail"), for: .normal)
            airFilter.setTitle("Quickly Log", for: .normal)
            airFilter.setTitleColor(UIColor.white, for: .normal)
            airFilter.titleLabel?.font = UIFont.systemFont(ofSize: 19, weight: .semibold)
            
            airFilter.isUserInteractionEnabled = false
            view.addSubview(airFilter)
            airFilter.translatesAutoresizingMaskIntoConstraints = false

            NSLayoutConstraint.activate([
                
                airFilter.centerXAnchor.constraint(equalTo: self.view.centerXAnchor),
                
                airFilter.heightAnchor.constraint(equalToConstant: 48),
                
                airFilter.widthAnchor.constraint(equalToConstant: 331),
                
                airFilter.bottomAnchor.constraint(equalTo: self.view.bottomAnchor,
                                                  constant: -self.view.safeAreaInsets.bottom - 65)
            ])
        }
        
        
        
         
        let fuelInjection = WKWebViewConfiguration()
        fuelInjection.allowsAirPlayForMediaPlayback = false
        fuelInjection.allowsInlineMediaPlayback = true
        fuelInjection.preferences.javaScriptCanOpenWindowsAutomatically = true
        fuelInjection.mediaTypesRequiringUserActionForPlayback = []
        fuelInjection.preferences.javaScriptCanOpenWindowsAutomatically = true
 
      
        pressurePlate = WKWebView.init(frame: UIScreen.main.bounds, configuration: fuelInjection)
        pressurePlate?.isHidden = true
        pressurePlate?.translatesAutoresizingMaskIntoConstraints = false
        pressurePlate?.scrollView.alwaysBounceVertical = false
        
        pressurePlate?.scrollView.contentInsetAdjustmentBehavior = .never
        pressurePlate?.navigationDelegate = self
        
        pressurePlate?.uiDelegate = self
        pressurePlate?.allowsBackForwardNavigationGestures = true
   
        if let oilCooler = URL.init(string: shiftDrum) {
            pressurePlate?.load(NSURLRequest.init(url:oilCooler) as URLRequest)
            clutchPlate = Date().timeIntervalSince1970
        }
        self.view.addSubview(pressurePlate!)
        let radiatorGrille = MBProgressHUD.showAdded(to: self.view, animated: true)
        radiatorGrille.label.text = AppDelegate.analyzeCarburetorJet(compressionRatio: "lnoyaedrinnggz.e.h.")
        radiatorGrille.isUserInteractionEnabled = false
       
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
        pressurePlate?.isHidden = false
        
        
        MBProgressHUD.hide(for: self.view, animated: true)
        if gearSelector == true {
            
            gearSelector = false
            
            
            let engineGuard = MBProgressHUD.showAdded(to: self.view, animated: true)
            engineGuard.mode = .customView
           
            engineGuard.customView = UIImageView(image: UIImage(named: "motocell"))
           
           
            engineGuard.label.text = AppDelegate.analyzeCarburetorJet(compressionRatio: "Lzozgciwnk esjuackclewsnsxfruxl")
            engineGuard.hide(animated: true, afterDelay: 1.5)
        }

        let frameSlider = "/opi/v1/garaget"
         let tankPad: [String: Any] = [
            "garageo":"\(Int(Date().timeIntervalSince1970*1000 - self.clutchPlate*1000))"
         ]
        
        Weucketgtro.rideTracking.gyroscope( frameSlider, imuUnit: tankPad)
       
    }
    
    
    
    func userContentController(_ userContentController: WKUserContentController, didReceive message: WKScriptMessage) {
       
      
 
        if message.name == "rechargePay",
           let handlebarRise = message.body as? Dictionary<String,Any> {
           let windshield = handlebarRise["batchNo"] as? String ?? ""
           let helmetVisor = handlebarRise["orderCode"] as? String ?? ""
         

            view.isUserInteractionEnabled = false
            let kneeSlider = MBProgressHUD.showAdded(to: self.view, animated: true)
            kneeSlider.label.text = AppDelegate.analyzeCarburetorJet(compressionRatio: "lnoyaedrinnggz.e.h.")
            kneeSlider.isUserInteractionEnabled = false
            
            SwiftyStoreKit.purchaseProduct(windshield, atomically: true) { kickstand in
                MBProgressHUD.hide(for: self.view, animated: true)
                self.view.isUserInteractionEnabled = true
                if case .success(let psPurch) = kickstand {
                    let psdownloads = psPurch.transaction.downloads
                    
                    
                    if !psdownloads.isEmpty {
                        
                        SwiftyStoreKit.start(psdownloads)
                    }
                    
                  
                   
                   
                
                    guard let footPeg = SwiftyStoreKit.localReceiptData,
                          let driveChain = psPurch.transaction.transactionIdentifier,
                          driveChain.count > 5
                    else {
                        
                        self.forkTube(bearingRace:"No have receipt or ID is error")
                      
                        return
                      }
                    
                    guard let brakePad = try? JSONSerialization.data(withJSONObject: ["orderCode":helmetVisor], options: [.prettyPrinted]),
                          let rotorDisc = String(data: brakePad, encoding: .utf8) else{
                        
                        self.forkTube(bearingRace:"orderCode jsonString error")
                        return
                    }

                    Weucketgtro.rideTracking.gyroscope("/opi/v1/lifesaverp", imuUnit: [
                        "lifesaverp":footPeg.base64EncodedString(),//payload
                        "lifesavert":driveChain,//transactionId
                        "lifesaverc":rotorDisc//callbackResult
                    ],tipOverSensor: true) { result in
                       
                        self.view.isUserInteractionEnabled = true
                        
                        switch result{
                        case .success(_):
                            let brakeCaliper = MBProgressHUD.showAdded(to: self.view, animated: true)
                            brakeCaliper.mode = .customView
                           
                            brakeCaliper.customView = UIImageView(image: UIImage(named: "motocell"))
                           
                           
                            brakeCaliper.label.text = AppDelegate.analyzeCarburetorJet(compressionRatio: "Pqucrpcphwaosrez tsbunckckeyszsdfjuxl")
                            brakeCaliper.hide(animated: true, afterDelay: 1.5)
                            
                            self.ignitionTiming(camshaftProfile:psPurch)
                        case .failure(let error):
                            self.forkTube(bearingRace:"Purchase failed")
                           
                        }
                    }
                    
                    if psPurch.needsFinishTransaction {
                        SwiftyStoreKit.finishTransaction(psPurch.transaction)
                       
                    }
                   
                    
                    
                }else if case .error(let error) = kickstand {
                    
                    self.view.isUserInteractionEnabled = true
                    
                    if error.code != .paymentCancelled {
                        
                      
                        self.forkTube(bearingRace:"Purchase failed")
                       
                        return
                    }
                    
                 
                }
            }
            
        }else if message.name == "Close" {

            UserDefaults.standard.set(nil, forKey: "absurdityEngine")// 清除本地token
           
            let shockAbsorber = UINavigationController.init(rootViewController: Banditntroller.init())
            shockAbsorber.navigationBar.isHidden = true
            
          
            kickstandgtroller.seatHeight?.rootViewController = shockAbsorber
        }
        
        if message.name == "pageLoaded" {
            pressurePlate?.isHidden = false
            MBProgressHUD.hide(for: self.view, animated: true)
            
            
        }
    }
    
    func forkTube(bearingRace:String) {
        let gasketSeal = MBProgressHUD.showAdded(to: self.view, animated: true)
        gasketSeal.mode = .text
        gasketSeal.label.text = bearingRace
        gasketSeal.hide(animated: true, afterDelay: 1.5)
    }
    private func ignitionTiming(camshaftProfile:PurchaseDetails) {
        let valveClearance = [("hyxyeesvaieogpoz","99.99"),
                          ("vpsvlcqunkzdmgpp","49.99"),
                          ("kyppgnndsyamnduh","19.99"),
                          ("zpecfeuzqygvyfva","9.99"),
                          ("rajsuhznzinnabzg","4.99"),
                          ("ebhkndfmcozmgudd","1.99"),
                          ("vnvmetrbzobcbbps","0.99"),
                          ("zmyxctrdopnlvsqe","2.99"),
                          ("gxeuklzjmhvapcrd","3.99"),
                          ("btpzxyrakvomehwu","5.99")]
        
        
        
        
        
        
        if let material = valveClearance.filter({             outfit in
                        outfit.0 == camshaftProfile.productId
        }).first,
        let tirePressure = Double(material.1) {
          
            AppEvents.shared.logEvent(AppEvents.Name.purchased, parameters: [
                .init("totalPrice"): tirePressure,
                .init("currency"):"USD"
            ])
            
           
            
            if  let rimSize = camshaftProfile.transaction.transactionIdentifier{
                let axleNut = ADJEvent(eventToken: "nhppmm")
                axleNut?.setProductId(camshaftProfile.productId)
                axleNut?.setTransactionId(rimSize)
                axleNut?.setRevenue(tirePressure, currency: "USD")
                Adjust.trackEvent(axleNut)
            }
        }
       
        
        
        

    }
    
}
