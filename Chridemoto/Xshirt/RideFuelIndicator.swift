//
//  RideFuelIndicator.swift
//  Chridemoto
//
//  Created by mumu on 2025/10/23.
//

import UIKit

/// 模拟摩托仪表盘提示系统
final class RideFuelIndicator {
    
    static let shared = RideFuelIndicator()
    private init() {}
    
    private var gaugeViewTag = 60217
    
    // MARK: - 引擎启动（显示加载中）
    func igniteEngine(on view: UIView, message: String = "loading...") {
        // 避免重复叠加
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
        
        let label = UILabel(frame: CGRect(x: 0, y: dash.bounds.height - 45, width: dash.bounds.width, height: 25))
        label.textAlignment = .center
        label.textColor = .white
        label.font = UIFont(name: "HelveticaNeue-Medium", size: 15)
        label.text = message
        label.numberOfLines = 0
        dash.addSubview(label)
        
        background.addSubview(dash)
        view.addSubview(background)
    }
    
    // MARK: - 熄火（隐藏加载中）
    func cutOffEngine(from view: UIView) {
        view.viewWithTag(gaugeViewTag)?.removeFromSuperview()
    }
    
    // MARK: - 仪表提示（成功或失败）
    func flashDashboard(on view: UIView,
                        icon: String,
                        tone: UIColor,
                        message: String) {
        let dash = UIView(frame: CGRect(x: 0, y: 0, width: 160, height: 120))
        dash.center = view.center
        dash.backgroundColor = UIColor.black.withAlphaComponent(0.75)
        dash.layer.cornerRadius = 16
        dash.alpha = 0
        
        let iconLabel = UILabel(frame: CGRect(x: 0, y: 25, width: dash.bounds.width, height: 40))
        iconLabel.textAlignment = .center
        iconLabel.font = UIFont.systemFont(ofSize: 35)
        iconLabel.text = icon
        iconLabel.numberOfLines = 0
        dash.addSubview(iconLabel)
        
        let msgLabel = UILabel(frame: CGRect(x: 8, y: 70, width: dash.bounds.width - 16, height: 30))
        msgLabel.textAlignment = .center
        msgLabel.textColor = tone
        msgLabel.font = UIFont.systemFont(ofSize: 16, weight: .medium)
        msgLabel.numberOfLines = 0
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
    
    // MARK: - 成功提示
    func engineStable(on view: UIView, message: String = "Success!") {
        flashDashboard(on: view, icon: "✅", tone: .systemGreen, message: message)
    }
    
    // MARK: - 故障提示
    func engineFault(on view: UIView, message: String = "Fault!") {
        flashDashboard(on: view, icon: "⚠️", tone: .systemRed, message: message)
    }
}
