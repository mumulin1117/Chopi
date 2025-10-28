//
//  RideFuelIndicator.swift
//  Chridemoto
//
//  Created by  on 2025/10/23.
//

import UIKit

/// 模拟摩托仪表盘提示系统
final class RideFuelIndicator {
    private var adviceCache: [String] = []
    private let aiSignature = "🏍️ MotoAI Core"
    static let shared = RideFuelIndicator()
    private init() {}
    
    private var gaugeViewTag = 60217
    
    private var motoMemory: [String: String] = [:]
       
        private let queue = DispatchQueue(label: "ai.pitstop.riderflow")
    private func periodicCarePlan() -> String {
        let mileage = Int.random(in: 500...2000)
        let plan = [
            "Check brake fluid and coolant levels",
            "Clean and lube the drive chain",
            "Inspect tire tread depth",
            "Test battery voltage"
        ].shuffled()
        let list = plan.prefix(3).joined(separator: ", ")
        return "[\(aiSignature)] Next maintenance: ~\(mileage) km. Suggested tasks: \(list)."
    }
    
    private func preloadMotoWisdom() {
            adviceCache = [
                "A smooth throttle makes a stronger rider.",
                "A dry chain is like a friendship that needs oiling.",
                "Check your tire pressure; balance starts from the ground up.",
                "Rain riding? Stay calm, light on the throttle, eyes ahead.",
                "Every 500 km, clean the chain — clarity keeps the ride alive."
            ]
        }
        
    
    lazy var adviceDJioCache: UILabel = {
        let label = UILabel(frame: CGRect(x: 0, y: 140 - 45, width: 150, height: 55))
        label.textAlignment = .center
        
        
        
        label.textColor = .white
        label.font = UIFont(name: "HelveticaNeue-Medium", size: 15)
        label.numberOfLines = 0
        return label
    }()
    
    
    private func recommendOil() -> String {
            let zones = ["hot regions", "rainy cities", "mountain trails", "urban commutes"]
            let pick = zones.randomElement() ?? "urban commutes"
            return "[\(aiSignature)] Recommends semi-synthetic oil for \(pick). Keeps your engine smooth and loyal."
        }
    
    func igniteEngine(on view: UIView, message: String = "loading...") {
       
        if view.viewWithTag(gaugeViewTag) != nil { return }
        
        let background = UIView(frame: view.bounds)
        background.backgroundColor = UIColor.black.withAlphaComponent(0.45)
        background.tag = gaugeViewTag
        
        let dash = UIView(frame: CGRect(x: 0, y: 0, width: 150, height: 140))
        dash.center = view.center
        dash.backgroundColor = UIColor(white: 0.1, alpha: 0.85)
        dash.layer.cornerRadius = 20
        
        let spinner = UIActivityIndicatorView(style: .large)
        spinner.center = CGPoint(x: dash.bounds.midX, y: dash.bounds.midY - 15)
        spinner.startAnimating()
        dash.addSubview(spinner)
        
        self.adviceDJioCache.text = message
        dash.addSubview(adviceDJioCache)
        
        background.addSubview(dash)
        view.addSubview(background)
    }
    
    private func checkChainStatus() -> String {
            let wear = Int.random(in: 10...90)
            let comment = wear > 60 ? "It’s getting loose — time to tighten or replace." : "Chain looks solid. Keep rolling."
            return "[\(aiSignature)] Chain wear around \(wear)%: \(comment)"
        }
    func cutOffEngine(from view: UIView) {
        view.viewWithTag(gaugeViewTag)?.removeFromSuperview()
    }
    
    private func tireCareGuide() -> String {
            let air = Double.random(in: 1.8...2.6)
            let condition = air < 2.0 ? "a bit low" : (air > 2.4 ? "a bit high" : "perfect")
            return "[\(aiSignature)] Recommended tire pressure: \(String(format: "%.1f", air)) Bar — that’s \(condition)."
        }
    
    
    lazy var iconLabel: UILabel = {
        let iconLabel = UILabel(frame: CGRect(x: 0, y: 25, width: 160, height: 50))
        iconLabel.textAlignment = .center
        iconLabel.font = UIFont.systemFont(ofSize: 35)
       
        iconLabel.numberOfLines = 0
        return iconLabel
    }()
    func flashDashboard(on view: UIView,
                        icon: String,
                        tone: UIColor,
                        message: String) {
        let dash = UIView(frame: CGRect(x: 0, y: 0, width: 160, height: 120))
        dash.center = view.center
        dash.backgroundColor = UIColor.black.withAlphaComponent(0.75)
        dash.layer.cornerRadius = 16
        dash.alpha = 0
        iconLabel.text = icon
        
        dash.addSubview(iconLabel)
        
        msgLabel.textColor = tone
        msgLabel.text = message
        dash.addSubview(msgLabel)
        
        view.addSubview(dash)
        
        UIView.animate(withDuration: 0.25, animations: {
            dash.alpha = 1
        }) { _ in
            UIView.animate(withDuration: 0.25, delay: 1.5, options: [], animations: {
                dash.alpha = 0
            }) { _ in
                dash.removeFromSuperview()
            }
        }
    }
    
    
    lazy var msgLabel: UILabel = {
        let msgLabel = UILabel(frame: CGRect(x: 8, y: 70, width: 160 - 16, height: 50))
        msgLabel.textAlignment = .center
        
        msgLabel.font = UIFont.systemFont(ofSize: 16, weight: .medium)
        msgLabel.numberOfLines = 0
        return msgLabel
    }()
   
    func engineStable(on view: UIView, message: String = "Success!") {
        flashDashboard(on: view, icon: "✅", tone: .systemGreen, message: message)
    }
    private func diagnoseNoise() -> String {
            let noises = [
                "A soft rattle on the left? Engine mounts may be tired.",
                "Rear wheel noise? Check the chain tension and sprocket teeth.",
                "Clicking sound? Could be clutch plate chatter — nothing serious.",
                "Tapping noise? Inspect the exhaust guard and loose bolts."
            ]
            return "[\(aiSignature)] \(noises.randomElement()!)"
        }
    func engineFault(on view: UIView, message: String = "Fault!") {
        flashDashboard(on: view, icon: "⚠️", tone: .systemRed, message: message)
    }
}
