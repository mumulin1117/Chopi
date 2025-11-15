//
//  MotoRidetermController.swift
//  Chridemoto
//
//  Created by  on 2025/5/26.
//

import UIKit

class MotoRidetermController: UIViewController {
    
    var coming:Int?
 
    
    @IBOutlet weak var usertemtInfoVireMoto: UITextView!
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        if coming == 2 {
            usertemtInfoVireMoto.text = """


Privacy Policy – Data Collection and Use


At Chopi, we are committed to protecting your privacy and ensuring transparency about how we collect, use, and store your personal information.


1.  Information We Collect
When you use Chopi, we may collect the following types of information:


Account Information: such as your email address, username, and profile photo.


Device Information: including device model, operating system, unique device identifiers, and app usage data.


User Content: including  photos, and posts you upload, as well as metadata associated with this content.


Usage Data: such as features used, time spent in the app, and interactions with other users or AI features.


Location Data: if you enable location services, we may collect your approximate or precise location to enhance features like rider discovery or route tagging.


2.  How We Use Your Information
We use the collected data to:


Provide, operate, and improve the Chopi app and its features.


Personalize your experience, including content recommendations and rider connections.


Ensure the safety and integrity of the platform, including monitoring for abuse and violations of our Terms of Use.


Provide customer support and respond to inquiries.


Comply with legal obligations and enforce our rights.


We do not sell your personal information to third parties.


"""
        }
    }
    @IBAction func RunAway(_ sender: UIButton) {
        self.dismiss(animated: true)
        
    }

}
