//
//  MotoModeBokeCell.swift
//  Chridemoto
//
//  Created by  on 2025/5/26.
//

import UIKit
import SDWebImage
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
    private func escaperoute()  {
        rimDent.layer.cornerRadius =  27.5
        rimDent.layer.masksToBounds = true
 
    }
    override func awakeFromNib() {
        super.awakeFromNib()
        escaperoute()
        vibrant()
    }
    
    
    private func vibrant()  {
        rimDentHighter.layer.cornerRadius =  12
        rimDentHighter.layer.masksToBounds = true
        
        rimDentshort.layer.cornerRadius =  12
        rimDentshort.layer.masksToBounds = true
        
        vibrationCountBtn.layer.cornerRadius =  15
        vibrationCountBtn.layer.masksToBounds = true
        
        shureCountBtn.layer.cornerRadius =  15
        shureCountBtn.layer.masksToBounds = true
        
    }
    
    
    func ShowOffYourRide (ride:Dictionary<String,Any>) {
        if let butnow = ride["overtakingTips"] as? String,let motoshareUrl =  URL.init(string: butnow){
            
            rimDent.sd_setImage(with: motoshareUrl,
                                 placeholderImage: nil,
                                options: .continueInBackground,
                                context: [.imageTransformer: urlImageSize,.storeCacheType : SDImageCacheType.memory.rawValue])
        }
        
        
        
        if let rideUserimage = (ride["rainGearSetup"] as? Array<String>)?.first,let motoshareUrl =  URL.init(string: rideUserimage){
            
            rimDentHighter.sd_setImage(with: motoshareUrl,
                                 placeholderImage: nil,
                                options: .continueInBackground,
                                context: [.imageTransformer: urlImageSize,.storeCacheType : SDImageCacheType.memory.rawValue])
        }
        
        if let rideUserimagelast = (ride["rainGearSetup"] as? Array<String>)?.last,let motoshareUrl =  URL.init(string: rideUserimagelast){
            
            rimDentshort.sd_setImage(with: motoshareUrl,
                                 placeholderImage: nil,
                                options: .continueInBackground,
                                context: [.imageTransformer: urlImageSize,.storeCacheType : SDImageCacheType.memory.rawValue])
        }
        
        tranceImageView.text = ride["groupFormation"] as? String ?? "No Name"
        
        
        let sitemilllion = ride["highwayCruising"] as? Int ?? 0
        vibrationCountBtn.setTitle("\(sitemilllion)", for: .normal)
        
        
        let allilllion = ride["windResistance"] as? Int ?? 0
        shureCountBtn.setTitle("\(allilllion)", for: .normal)
        
        publishRideContent.text = ride["riderVisibility"] as? String
        
        let timeinterval = TimeInterval(integerLiteral: Int64((ride["longDistanceRide"] as? Int ?? 0)/1000))
        
        publishTimeShow.text = self.realityPhantasmagoria(timestamp: timeinterval)
    }
    
    
    func realityPhantasmagoria(timestamp: TimeInterval) -> String {
        let date = Date(timeIntervalSince1970: timestamp)
        let formatter = DateFormatter()
        formatter.dateFormat = "yyyy-MM-dd HH:mm"
        return formatter.string(from: date)
    }
}
