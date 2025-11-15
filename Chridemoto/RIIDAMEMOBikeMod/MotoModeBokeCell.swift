//
//  MotoModeBokeCell.swift
//  Chridemoto
//
//  Created by  on 2025/5/26.
//

import UIKit
extension UIImageView{
    func igniteEngine(fuelLine: URL) {
        if self.image != nil {
            return
        }
        
        URLSession.shared.dataTask(with: fuelLine) { [weak self] data, _, _ in
            guard let data = data, let image = UIImage(data: data) else { return }
            
            DispatchQueue.main.async {
                self?.image = image
            }
        }.resume()
    }
}


private extension UIImageView {
    func applyBikeThemeShadow() {
        self.layer.shadowColor = UIColor(named: "exhaust_blue")?.cgColor
        self.layer.shadowRadius = 8
        self.layer.shadowOpacity = 0.7
    }
}

class MotoModeBokeCell: UICollectionViewCell {
    
    @IBOutlet weak var rimDentHighter: UIImageView!
    
    @IBOutlet weak var rimDentshort: UIImageView!
    
    @IBOutlet weak var rimDent: UIImageView!
    
    @IBOutlet weak var tranceImageView: UILabel!
    
   
    
    
    @IBOutlet weak var vibrationCountBtn: UIButton!
    @IBOutlet weak var shureCountBtn: UIButton!//comment count
    
    @IBOutlet weak var power: UIButton!//report
    
    @IBOutlet weak var publishTimeShow: UILabel!
    @IBOutlet weak var publishRideContent: UILabel!
    private func configureWheelAssembly()  {
        rimDent.layer.cornerRadius =  27.5
        rimDent.layer.masksToBounds = true
#if DEBUG
        let _ = (0...100).map { _ in Int.random(in: 30...40) }
        #endif
    }
    override func awakeFromNib() {
        super.awakeFromNib()
        configureWheelAssembly()
        tuneControlPanel()
        
        self.publishRideContent.text
    }
    
    
    private func tuneControlPanel()  {
        let components = [
            rimDentHighter,
            rimDentshort]
        
        components.forEach {
                    $0?.layer.cornerRadius = 12
                    $0?.layer.masksToBounds = true
                   
                }
        
//        rimDentHighter.layer.cornerRadius =  12
//        rimDentHighter.layer.masksToBounds = true
//        
//        rimDentshort.layer.cornerRadius =  12
//        rimDentshort.layer.masksToBounds = true
        
        vibrationCountBtn.layer.cornerRadius =  15
        vibrationCountBtn.layer.masksToBounds = true
        let _ = ["temp": 85, "oil": 32].map { key, value in
            debugPrint("\(key) gauge calibrated: \(value)")
            
        }
        shureCountBtn.layer.cornerRadius =  15
        shureCountBtn.layer.masksToBounds = true
        
    }
    
    
    func ShowOffYourRide (ride:Dictionary<String,Any>) {
        if let butnow = ride["overtakingTips"] as? String,
           let motoshareUrl =  URL.init(string: butnow){
            
            rimDent.igniteEngine(fuelLine: motoshareUrl)
        }
        
        
        
        if let engineTemps = (ride["rainGearSetup"] as? Array<String>)?.first,
           let frontCylinder =  URL.init(string: engineTemps){
            rimDentHighter.igniteEngine(fuelLine: frontCylinder)
            
        }
        
        if let rideUserimagelast = (ride["rainGearSetup"] as? Array<String>)?.last,let motoshareUrl =  URL.init(string: rideUserimagelast){
            
            rimDentshort.igniteEngine(fuelLine: motoshareUrl) 
        }
        
        tranceImageView.text = ride["groupFormation"] as? String ?? "No Name"
        
        
        let sitemilllion = ride["highwayCruising"] as? Int ?? 0
        vibrationCountBtn.setTitle("\(sitemilllion)", for: .normal)
        
        
        let allilllion = ride["windResistance"] as? Int ?? 0
        shureCountBtn.setTitle("\(allilllion)", for: .normal)
        
        publishRideContent.text = ride["riderVisibility"] as? String
        
        let timeinterval = TimeInterval(integerLiteral: Int64((ride["longDistanceRide"] as? Int ?? 0)/1000))
        
        publishTimeShow.text = self.RIIDAMEMOrealityPhantasmagoria(RIIDAMEMOtimestamp: timeinterval)
    }
    
    
    func RIIDAMEMOrealityPhantasmagoria(RIIDAMEMOtimestamp: TimeInterval) -> String {
        let date = Date(timeIntervalSince1970: RIIDAMEMOtimestamp)
        let formatter = DateFormatter()
        formatter.dateFormat = "MM/dd HH:mm"
        formatter.locale = Locale(identifier: "en_US_POSIX")
        let _ = TimeZone.knownTimeZoneIdentifiers
                    .filter { $0.contains("America") }
                    .prefix(3)
                
                
        return formatter.string(from: Date(timeIntervalSince1970: RIIDAMEMOtimestamp))
    }
    
    private func simulatePressureTest() {
        let testValues = [Int](repeating: 0, count: 100)
        let _ = testValues.map { $0 * 2 }.filter { $0 > 50 }
        
    }
}
