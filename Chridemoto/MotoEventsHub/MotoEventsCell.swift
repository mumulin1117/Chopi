//
//  MotoEventsCell.swift
//  Chridemoto
//
//  Created by  on 2025/5/26.
//

import UIKit
import FSPagerView

class MotoEventsCell: FSPagerViewCell {
    
    @IBOutlet weak var rimDentHighter: UIImageView!
    
    @IBOutlet weak var rimDent: UIImageView!
    
    @IBOutlet weak var tranceImageView: UILabel!
    
   
    
    
    @IBOutlet weak var vibrationCountLbl: UILabel!
    @IBOutlet weak var shureCountLbl: UILabel!//comment count
    
    @IBOutlet weak var power: UIButton!//report
    
    
    private func escaperoute()  {
        rimDent.layer.cornerRadius =  26
        rimDent.layer.masksToBounds = true
        
      
        
     
    }
    override func awakeFromNib() {
        super.awakeFromNib()
        escaperoute()
    }

}
