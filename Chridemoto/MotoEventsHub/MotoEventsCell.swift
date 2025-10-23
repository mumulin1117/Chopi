//
//  MotoEventsCell.swift
//  Chridemoto
//
//  Created by  on 2025/5/26.
//

import UIKit



class MotoEventsCell: UICollectionViewCell {
    
    @IBOutlet weak var rimDentHighter: UIImageView!
    
    @IBOutlet weak var rimDent: UIImageView!
    
    @IBOutlet weak var tranceImageView: UILabel!
    
   
    @IBOutlet weak var dynoReadout: UIButton!
    
    
    @IBOutlet weak var vibrationCountLbl: UILabel!
    @IBOutlet weak var shureCountLbl: UILabel!//comment count
    
    @IBOutlet weak var power: UIButton!//report
    
    @IBOutlet weak var publishRideContent: UILabel!
    
    private func escaperoute()  {
        rimDent.layer.cornerRadius =  26
        rimDent.layer.masksToBounds = true
        
      
        
     
    }
    override func awakeFromNib() {
        super.awakeFromNib()
        escaperoute()
    }

    
    func ShowOffYourRide (ride:Dictionary<String,Any>) {
        if let butnow = ride["overtakingTips"] as? String,let motoshareUrl =  URL.init(string: butnow){
            
            rimDent.igniteEngine(fuelLine: motoshareUrl)
        }
        
        
        
        if let rideUserimage = ride["batteryCharging"] as? String,let motoshareUrl =  URL.init(string: rideUserimage){
            
            rimDentHighter.igniteEngine(fuelLine: motoshareUrl)
        }
        
       
        
        tranceImageView.text = ride["groupFormation"] as? String
        
        
        let sitemilllion = ride["highwayCruising"] as? Int ?? 0
        vibrationCountLbl.text = "\(sitemilllion)"
        
        
        let allilllion = ride["windResistance"] as? Int ?? 0
        shureCountLbl.text = "\(allilllion)"
        
        publishRideContent.text = ride["riderVisibility"] as? String
    }
    
}
