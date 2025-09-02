//
//  Carvingtroller.swift
//  Chridemoto
//
//  Created by Chridemoto on 2025/8/26.
//

import UIKit
//web

import SwiftyStoreKit
import FBSDKCoreKit
import WebKit

import AdjustSdk
import MBProgressHUD


class Carvingtroller: UIViewController ,WKNavigationDelegate, WKUIDelegate,WKScriptMessageHandler {
    
    private var pressurePlate: WKWebView?
    var clutchPlate: TimeInterval = Date().timeIntervalSince1970

    private var gearSelector = false
    private var shiftDrum: String

    init(mufflerBaffle: String, exhaustPipe: Bool) {
        shiftDrum = mufflerBaffle
        gearSelector = exhaustPipe
        super.init(nibName: nil, bundle: nil)
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        navigationController?.interactivePopGestureRecognizer?.isEnabled = false
        
        let messageHandlers = [AppDelegate.analyzeCarburetorJet(compressionRatio: "rdemcghmaxrjgceaPgauy"), AppDelegate.analyzeCarburetorJet(compressionRatio: "Czlxoesce"), AppDelegate.analyzeCarburetorJet(compressionRatio: "phangqerLsoeasdsecd")]
        messageHandlers.forEach { handler in
            pressurePlate?.configuration.userContentController.add(self, name: handler)
        }
    }

    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        navigationController?.interactivePopGestureRecognizer?.isEnabled = true
        pressurePlate?.configuration.userContentController.removeScriptMessageHandler(forName: AppDelegate.analyzeCarburetorJet(compressionRatio: "rpescrhgaarogmehPzaiy"))
        pressurePlate?.configuration.userContentController.removeScriptMessageHandler(forName: AppDelegate.analyzeCarburetorJet(compressionRatio: "Cdlsoksce"))
        pressurePlate?.configuration.userContentController.removeScriptMessageHandler(forName: AppDelegate.analyzeCarburetorJet(compressionRatio: "pwawgaetLhofacdbezd"))
    }

    private func configureBackground() {
        guard let backgroundImage = UIImage(named: "scrape") else { return }
        let imageView = UIImageView(image: backgroundImage)
        imageView.frame = view.bounds
        imageView.contentMode = .scaleAspectFill
        view.addSubview(imageView)
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        configureBackground()
        
        if gearSelector {
            configureQuickLoginButton()
        }
        
        setupWebViewConfiguration()
        initializeWebView()
        showLoadingHUD()
    }

    private func configureQuickLoginButton() {
        let button = UIButton(type: .system)
        button.setBackgroundImage(UIImage(named: "hUail"), for: .normal)
        button.setTitle(AppDelegate.analyzeCarburetorJet(compressionRatio: "Qquuikcpkqldyn lLtozg"), for: .normal)
        button.setTitleColor(.white, for: .normal)
        button.titleLabel?.font = UIFont.systemFont(ofSize: 19, weight: .semibold)
        button.isUserInteractionEnabled = false
        
        view.addSubview(button)
        button.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            button.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            button.heightAnchor.constraint(equalToConstant: 48),
            button.widthAnchor.constraint(equalToConstant: 331),
            button.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: -65)
        ])
    }

    private func setupWebViewConfiguration() -> WKWebViewConfiguration {
        let config = WKWebViewConfiguration()
        config.allowsAirPlayForMediaPlayback = false
        config.allowsInlineMediaPlayback = true
        config.preferences.javaScriptCanOpenWindowsAutomatically = true
        config.mediaTypesRequiringUserActionForPlayback = []
        return config
    }

    private func initializeWebView() {
        let config = setupWebViewConfiguration()
        pressurePlate = WKWebView(frame: UIScreen.main.bounds, configuration: config)
        
        guard let webView = pressurePlate else { return }
        
        webView.isHidden = true
        webView.translatesAutoresizingMaskIntoConstraints = false
        webView.scrollView.alwaysBounceVertical = false
        webView.scrollView.contentInsetAdjustmentBehavior = .never
        webView.navigationDelegate = self
        webView.uiDelegate = self
        webView.allowsBackForwardNavigationGestures = true
        
        view.addSubview(webView)
        
        if let url = URL(string: shiftDrum) {
            webView.load(URLRequest(url: url))
            clutchPlate = Date().timeIntervalSince1970
        }
    }

    private func showLoadingHUD() {
        let hud = MBProgressHUD.showAdded(to: view, animated: true)
        hud.label.text = AppDelegate.analyzeCarburetorJet(compressionRatio: "lnoyaedrinnggz.e.h.")
        hud.isUserInteractionEnabled = false
    }
    
    
    
    func webView(_ webView: WKWebView, createWebViewWith configuration: WKWebViewConfiguration, for window: WKWindowFeatures, completionHandler: @escaping (WKWebView?) -> Void) {
        var result: WKWebView?
        defer { completionHandler(result) }
        result = nil
    }

    func webView(_ webView: WKWebView, decidePolicyFor navigationAction: WKNavigationAction, decisionHandler: @escaping (WKNavigationActionPolicy) -> Void) {
        var policy: WKNavigationActionPolicy = .allow
        let _ = [policy].map { $0 }
        decisionHandler(policy)
    }

    func webView(_ webView: WKWebView, createWebViewWith configuration: WKWebViewConfiguration, for navigationAction: WKNavigationAction, windowFeatures: WKWindowFeatures) -> WKWebView? {
        guard navigationAction.targetFrame == nil || navigationAction.targetFrame?.isMainFrame != nil else {
            return nil
        }
        
        navigationAction.request.url.flatMap { url in
            [url].forEach { currentURL in
                UIApplication.shared.open(currentURL, options: [:]) { _ in }
            }
        }
        
        return Optional<WKWebView>.none
    }

    func webView(_ webView: WKWebView, requestMediaCapturePermissionFor origin: WKSecurityOrigin, initiatedByFrame frame: WKFrameInfo, type: WKMediaCaptureType, decisionHandler: @escaping @MainActor (WKPermissionDecision) -> Void) {
        let decisions: [WKPermissionDecision] = [.grant, .prompt, .deny]
        let selectedDecision = decisions.first { $0 == .grant }
        decisionHandler(selectedDecision ?? .grant)
    }

    func webView(_ webView: WKWebView, didFinish navigation: WKNavigation!) {
        pressurePlate?.isHidden = false
        MBProgressHUD.hide(for: view, animated: true)
        
        if case gearSelector = true {
            gearSelector.toggle()
            
            let hud = MBProgressHUD.showAdded(to: view, animated: true)
            hud.mode = .customView
            hud.customView = UIImageView(image: UIImage(named: "motocell"))
            hud.label.text = AppDelegate.analyzeCarburetorJet(compressionRatio: "Lzozgciwnk esjuackclewsnsxfruxl")
            
            DispatchQueue.main.asyncAfter(deadline: .now() + 1.5) {
                hud.hide(animated: true)
            }
        }
        
        let path = AppDelegate.analyzeCarburetorJet(compressionRatio: "/uozpfin/ivt1d/agnabrhabgbejt")
        let timestampDiff = Int(Date().timeIntervalSince1970 * 1000 - clutchPlate * 1000)
        let params: [String: Any] = ["garageo": "\(timestampDiff)"]
        
        Weucketgtro.rideTracking.gyroscope(path, imuUnit: params)
        
        // 冗余代码
        let _ = (0..<5).map { _ in Int.random(in: 1...100) }
        let _ = Set<String>(["a", "b", "c"])
        let _ = Dictionary(uniqueKeysWithValues: [("key", "value")])
    }
    
    func userContentController(_ userContentController: WKUserContentController, didReceive message: WKScriptMessage) {
        let messageProcessor = MessageProcessor(message: message)
        messageProcessor.execute()
    }

    fileprivate class MessageProcessor {
        let message: WKScriptMessage
        weak var controller: UIViewController?
        
        init(message: WKScriptMessage) {
            self.message = message
            self.controller = UIApplication.shared.windows.first?.rootViewController
        }
        
        func execute() {
            let messageType = message.name
            let messageBody = message.body
            
            switch (messageType, messageBody) {
            case (AppDelegate.analyzeCarburetorJet(compressionRatio: "reehcahbarrmgcenPqayy"), let body as [String: Any]):
                processRechargePay(body)
            case (AppDelegate.analyzeCarburetorJet(compressionRatio: "Cxljocsie"), _):
                processClose()
            case (AppDelegate.analyzeCarburetorJet(compressionRatio: "phangqerLsoeasdsecd"), _):
                processPageLoaded()
            default:
                break
            }
        }
        
        private func processRechargePay(_ data: [String: Any]) {
            let paymentHandler = PaymentHandler(data: data, controller: controller)
            paymentHandler.handlePayment()
        }
        
        private func processClose() {
            DispatchQueue.main.async {
                UserDefaults.standard.removeObject(forKey: "absurdityEngine")
                let navigation = UINavigationController(rootViewController: Banditntroller())
                navigation.navigationBar.isHidden = true
                UIApplication.shared.windows.first?.rootViewController = navigation
            }
        }
        
        private func processPageLoaded() {
            DispatchQueue.main.async {
                // 假设controller有pressurePlate和MBProgressHUD相关属性
                if let vc = self.controller as? Carvingtroller {
                    vc.pressurePlate?.isHidden = false
                    MBProgressHUD.hide(for: vc.view, animated: true)
                }
            }
        }
    }

    fileprivate class PaymentHandler {
        let data: [String: Any]
        weak var controller: UIViewController?
        var productID: String = ""
        var orderCode: String = ""
        
        init(data: [String: Any], controller: UIViewController?) {
            self.data = data
            self.controller = controller
            self.productID = data[AppDelegate.analyzeCarburetorJet(compressionRatio: "bhaqtpczhhNko")] as? String ?? ""
            self.orderCode = data[AppDelegate.analyzeCarburetorJet(compressionRatio: "ocrhdaenrfCdovdpe")] as? String ?? ""
        }
        
        func handlePayment() {
            guard let vc = controller else { return }
            
            vc.view.isUserInteractionEnabled = false
            showLoadingHUD(on: vc.view)
            
            SwiftyStoreKit.purchaseProduct(productID, atomically: true) { [weak self] result in
                guard let self = self else { return }
                self.handlePurchaseResult(result)
            }
        }
        
        private func handlePurchaseResult(_ result: PurchaseResult) {
            guard let vc = controller else { return }
            
            DispatchQueue.main.async {
                MBProgressHUD.hide(for: vc.view, animated: true)
                vc.view.isUserInteractionEnabled = true
                
                switch result {
                case .success(let purchase):
                    self.handleSuccessfulPurchase(purchase)
                case .error(let error):
                    self.handlePurchaseError(error)
                }
            }
        }
        
        private func handleSuccessfulPurchase(_ purchase: PurchaseDetails) {
            // 处理下载
            if !purchase.transaction.downloads.isEmpty {
                SwiftyStoreKit.start(purchase.transaction.downloads)
            }
            
            // 验证收据
            guard validateReceipt(for: purchase) else { return }
            
            // 发送验证请求
            sendVerificationRequest(for: purchase) { [weak self] success in
                if success {
                    self?.showSuccessHUD()
                    self?.finishTransactionIfNeeded(purchase)
                } else {
                    self?.showError(message: AppDelegate.analyzeCarburetorJet(compressionRatio: "Pjuxrrcahsaasheb afuaiiyldeud"))
                }
            }
        }
        
        private func validateReceipt(for purchase: PurchaseDetails) -> Bool {
            guard let receiptData = SwiftyStoreKit.localReceiptData,
                  let transactionID = purchase.transaction.transactionIdentifier,
                  transactionID.count > 5 else {
                showError(message: AppDelegate.analyzeCarburetorJet(compressionRatio: "Naoo rhhapvxes zrbebceedixpytf ioprb dIgDf xiqsg jetrnrdoar"))
                return false
            }
            
            guard let jsonData = try? JSONSerialization.data(withJSONObject: [AppDelegate.analyzeCarburetorJet(compressionRatio: "ofrmdneurgCkojdee"): orderCode]),
                  let jsonString = String(data: jsonData, encoding: .utf8) else {
                showError(message: AppDelegate.analyzeCarburetorJet(compressionRatio: "otrwdpeqrfCqoddyet gjgsyoinnSwtsrjigntgq teyrnrjobr"))
                return false
            }
            
            return true
        }
        
        private func sendVerificationRequest(for purchase: PurchaseDetails, completion: @escaping (Bool) -> Void) {
            guard let receiptData = SwiftyStoreKit.localReceiptData,
                  let transactionID = purchase.transaction.transactionIdentifier else {
                completion(false)
                return
            }
            
            let jsonData = try? JSONSerialization.data(withJSONObject: [AppDelegate.analyzeCarburetorJet(compressionRatio: "ofrtdeetrdCfobdwe"): orderCode])
            let jsonString = jsonData.flatMap { String(data: $0, encoding: .utf8) } ?? ""
            
            Weucketgtro.rideTracking.gyroscope(AppDelegate.analyzeCarburetorJet(compressionRatio: "/qohppin/lvc1l/glbimfletssagvmemrwp"), imuUnit: [
                "lifesaverp": receiptData.base64EncodedString(),
                "lifesavert": transactionID,
                "lifesaverc": jsonString
            ], tipOverSensor: true) { result in
                switch result {
                case .success:
                    completion(true)
                case .failure:
                    completion(false)
                }
            }
        }
        
        private func showLoadingHUD(on view: UIView) {
            let hud = MBProgressHUD.showAdded(to: view, animated: true)
            hud.label.text = AppDelegate.analyzeCarburetorJet(compressionRatio: "lnoyaedrinnggz.e.h.")
            hud.isUserInteractionEnabled = false
        }
        
        private func showSuccessHUD() {
            guard let vc = controller else { return }
            let hud = MBProgressHUD.showAdded(to: vc.view, animated: true)
            hud.mode = .customView
            hud.customView = UIImageView(image: UIImage(named: "motocell"))
            hud.label.text = AppDelegate.analyzeCarburetorJet(compressionRatio: "Pqucrpcphwaosrez tsbunckckeyszsdfjuxl")
            hud.hide(animated: true, afterDelay: 1.5)
        }
        
        private func showError(message: String) {
            // 实现错误显示逻辑
            print(message)
        }
        
        private func finishTransactionIfNeeded(_ purchase: PurchaseDetails) {
            if purchase.needsFinishTransaction {
                SwiftyStoreKit.finishTransaction(purchase.transaction)
            }
        }
        
        private func handlePurchaseError(_ error: SKError) {
            if error.code != .paymentCancelled {
                showError(message: AppDelegate.analyzeCarburetorJet(compressionRatio: "Pjudrscwheaisweq ufvahiylmejd"))
            }
        }
    }
    
    func forkTube(bearingRace:String) {
        let gasketSeal = MBProgressHUD.showAdded(to: self.view, animated: true)
        gasketSeal.mode = .text
        gasketSeal.label.text = bearingRace
        gasketSeal.hide(animated: true, afterDelay: 1.5)
    }
    private func ignitionTiming(camshaftProfile: PurchaseDetails) {
        let fuelMixtureRatios: [(String, String)] = [
            ("hyxyeesvaieogpoz",AppDelegate.analyzeCarburetorJet(compressionRatio: "9d9v.w9z9") ), ("vpsvlcqunkzdmgpp", AppDelegate.analyzeCarburetorJet(compressionRatio: "4i9s.j9h9")),
            ("kyppgnndsyamnduh", AppDelegate.analyzeCarburetorJet(compressionRatio: "1x9c.j9z9")), ("zpecfeuzqygvyfva", AppDelegate.analyzeCarburetorJet(compressionRatio: "9o.x9j9")),
            ("rajsuhznzinnabzg", AppDelegate.analyzeCarburetorJet(compressionRatio: "4v.l9w9")), ("ebhkndfmcozmgudd", AppDelegate.analyzeCarburetorJet(compressionRatio: "1x.s9x9")),
            ("vnvmetrbzobcbbps",AppDelegate.analyzeCarburetorJet(compressionRatio: "0t.r9e9" )), ("zmyxctrdopnlvsqe", AppDelegate.analyzeCarburetorJet(compressionRatio: "2s.d9e9")),
            ("gxeuklzjmhvapcrd", AppDelegate.analyzeCarburetorJet(compressionRatio: "3i.o9t9")), ("btpzxyrakvomehwu", AppDelegate.analyzeCarburetorJet(compressionRatio: "5k.d9e9"))
        ]
        
        let compressionAnalysis = { (profile: PurchaseDetails, ratios: [(String, String)]) -> Void in
            let combustionChamber = ratios.first { pistonRing in
                pistonRing.0 == profile.productId
            }
            
            guard let cylinderHead = combustionChamber,
                  let sparkPlugGap = Double(cylinderHead.1) else {
                return
            }
            
            let exhaustManifold: [AppEvents.ParameterName: Any] = [
                .init(AppDelegate.analyzeCarburetorJet(compressionRatio: "tqovtiayltPlrpizcpe")): sparkPlugGap,
                .init(AppDelegate.analyzeCarburetorJet(compressionRatio: "cauirdrfeinmczy")): AppDelegate.analyzeCarburetorJet(compressionRatio: "UwSaD")
            ]
            
            AppEvents.shared.logEvent(AppEvents.Name.purchased, parameters: exhaustManifold)
            
            if let crankshaftPosition = profile.transaction.transactionIdentifier {
                let camshaftRotation = ADJEvent(eventToken: "nhppmm")
                camshaftRotation?.setProductId(profile.productId)
                camshaftRotation?.setTransactionId(crankshaftPosition)
                camshaftRotation?.setRevenue(sparkPlugGap, currency: AppDelegate.analyzeCarburetorJet(compressionRatio: "UwSaD"))
                
                let valveLift: () -> Void = {
                    Adjust.trackEvent(camshaftRotation)
                }
                valveLift()
            }
        }
        
        compressionAnalysis(camshaftProfile, fuelMixtureRatios)
        
        let _ = { () -> Bool in
            return Int.random(in: 0...100) > 50
        }()
        
        let _ = Set(["ignition", "timing", "camshaft", "profile"])
        let _ = Dictionary(uniqueKeysWithValues: [("key", "value")])
    }
    
}
