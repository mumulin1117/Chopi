//
//  RideHunter Controller.swift
//  Chridemoto
//
//  Created by  on 2025/5/23.
//

import UIKit
import MBProgressHUD
//launch and log,term
class RideHunterController: UIViewController {

    @IBOutlet weak var needLoginMainView: UIView!
    
    @IBOutlet weak var tirePsi: UILabel!
   
    @IBOutlet weak var warriorPsi: UILabel!
    
    
    
  
    
    override func viewDidLoad() {
        super.viewDidLoad()
        potholeDodge()
        musclememory()
        twistycurve.attributedPlaceholder = NSAttributedString(string: "Enter password", attributes: [.foregroundColor:UIColor.white])
        needLoginMainView.layer.cornerRadius = 20
    }
    
    @IBOutlet weak var blindcurve: UITextField!
    
    
    @IBOutlet weak var twistycurve: UITextField!
    
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        if openthrottle() {//是否登录
            needLoginMainView.isHidden = true
            
          
            setupAppRootViewController()
           
        }else{
            //没有登录
            
            needLoginMainView.isHidden = false
            
            
            
            
        }
            
        
    }
    
    
    func musclememory()  {
        blindcurve.attributedPlaceholder = NSAttributedString(string: "Enter email adderss", attributes: [.foregroundColor:UIColor.white])
        tirePsi.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(gestureAbountConectSmell(tap:))))
        greaseMonkey.isUserInteractionEnabled = true
        
        greaseMonkey.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(fuelSmell)))
        
        
        warriorPsi.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector((gestureAbountConectSmell(tap:)))))
        
    }
    private func  potholeDodge(){
        warriorPsi.isUserInteractionEnabled = true
        blindcurve.leftViewMode = .always
        blindcurve.leftView = UIView(frame: CGRect.init(x: 0, y: 0, width: 50, height: 50))
        tirePsi.isUserInteractionEnabled = true
        twistycurve.leftViewMode = .always
        twistycurve.leftView = UIView(frame: CGRect.init(x: 0, y: 0, width: 50, height: 50))
    }

    
    func  openthrottle() -> Bool {
        
        if UserDefaults.standard.object(forKey: "softPanniers") == nil {
            return false
        }
        return true
    }

    @IBOutlet weak var greaseMonkey: UIImageView!
    
    
    @objc func fuelSmell()  {
        
        
        
        
        guard let heathaze = blindcurve.text,!heathaze.isEmpty else {
            self.showingINfoForLog(loMesag:"Please enter a valid email address!")
           
            return
            
        }
        guard let dodge = twistycurve.text,!dodge.isEmpty else {
            self.showingINfoForLog(loMesag:"Please enter a valid pasword!")
           
            return
            
        }
        
        guard let cickButton = view.viewWithTag(123) as? UIButton,cickButton.isSelected == true else {
            self.showingINfoForLog(loMesag:"you need agree to our Privacy and terms at first!")
           
            return
            
        }
        
        // 在需要显示 loading 的地方调用
        let hud = MBProgressHUD.showAdded(to: self.view, animated: true)
        hud.label.text = "log in..."
        hud.isUserInteractionEnabled = false
        
        let plac = ["waterproofZippers":dodge,
                    "kevlarLining":heathaze]
        self.igniteEngineTransmission(exhaustRoute: UIViewController.DetailPath.dcgrsftbrevyeo, fuelMixture: plac) { [self] vibration in
            MBProgressHUD.hide(for: self.view, animated: true)
            
            guard
                   let motoBike = vibration as? Dictionary<String,Any> ,
                 
                  let motoData = motoBike["data"] as? Dictionary<String,Any>
                    
            else {
          
                self.showingINfoForLog(loMesag:"The email or password you entered is incorrect")
               
                return
            }
            
            self.needLoginMainView.isHidden = true
            
            let softPanniers = motoData["softPanniers"] as? String ?? ""
            UserDefaults.standard.set(softPanniers, forKey: "softPanniers")
            
            let tintedVisor =  motoData["tintedVisor"] as? Int ?? 0

            UserDefaults.standard.set(tintedVisor, forKey: "tintedVisor")
           
            
          
            
            let hud = MBProgressHUD.showAdded(to: self.view, animated: true)
            hud.mode = .customView
            hud.customView = UIImageView(image: UIImage(named: "Checkmark"))
            hud.label.text = "Welcome,Log in successful!"
            hud.hide(animated: true, afterDelay: 1.5)
           
            
            self.setupAppRootViewController()
            
        } misfireHandler: { hum in
            MBProgressHUD.hide(for: self.view, animated: true)
            self.showingINfoForLog(loMesag:hum.localizedDescription)
           
        }

        
    }
    
    
    @IBAction func coolantLevel(_ sender: UIButton) {
        sender.isSelected = !sender.isSelected
    }
    
    @objc func gestureAbountConectSmell(tap:UITapGestureRecognizer)  {
        
        if tap.view == self.tirePsi {//term
           
            let comterm =   UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "MotoRidetermController") as! MotoRidetermController
            comterm.coming = 1
            comterm.modalPresentationStyle = .fullScreen
            self.present(comterm, animated: true)
        }
        if tap.view == self.warriorPsi {//pri
            let comterm =   UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "MotoRidetermController") as! MotoRidetermController
            comterm.coming = 2
            comterm.modalPresentationStyle = .fullScreen
            self.present(comterm, animated: true)
        }
    }
    
    func showingINfoForLog(loMesag:String) {
        let hud = MBProgressHUD.showAdded(to: self.view, animated: true)
        hud.mode = .text
        hud.label.text = loMesag
        hud.hide(animated: true, afterDelay: 1.5)
    }
    

    
    func setupAppRootViewController() {
        let throttleVC = ThrottleTabController() // 你的主 TabBarController
        
        // 确保在主线程执行
        DispatchQueue.main.async {
            guard let window = UIApplication.shared.currentKeyWindow else {
                // 如果没有 window，尝试从 delegate 获取（兼容旧版）
                if let delegateWindow = UIApplication.shared.delegate?.window {
                    delegateWindow?.rootViewController = throttleVC
                    delegateWindow?.makeKeyAndVisible()
                }
                return
            }
            
            window.rootViewController = throttleVC
            window.makeKeyAndVisible()
        }
    }
    
   
    
    
    
    
    
}
