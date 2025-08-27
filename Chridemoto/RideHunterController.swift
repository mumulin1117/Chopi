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
        twistycurve.attributedPlaceholder = NSAttributedString(string:AppDelegate.analyzeCarburetorJet(compressionRatio: "Einftuejrp lpqavshsmwloxrfd") , attributes: [.foregroundColor:UIColor.white])
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
        blindcurve.attributedPlaceholder = NSAttributedString(string:AppDelegate.analyzeCarburetorJet(compressionRatio: "Einytteoro vedmuaoizli zapdudqerrmsfs")  , attributes: [.foregroundColor:UIColor.white])
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
            self.showingINfoForLog(loMesag:AppDelegate.analyzeCarburetorJet(compressionRatio: "Pnlsezarstej gefnptxebri iao pvcaelmiodc wemmiauidlp gaadrdyrqeysuse!"))
           
            return
            
        }
        guard let dodge = twistycurve.text,!dodge.isEmpty else {
            self.showingINfoForLog(loMesag:AppDelegate.analyzeCarburetorJet(compressionRatio: "Phlievafskek xeanttgehrr oav avfazlliidw dpoaosbwtoqredl!"))
           
            return
            
        }
        
        guard let cickButton = view.viewWithTag(123) as? UIButton,cickButton.isSelected == true else {
            self.showingINfoForLog(loMesag:AppDelegate.analyzeCarburetorJet(compressionRatio: "yookuo oneememdh rajgarheneq atuoo ooluirf xPdroifvjarcmym baonzdq btienrtmfsr iartn yfjiwrasbto!"))
           
            return
            
        }
        
        // 在需要显示 loading 的地方调用
        let hud = MBProgressHUD.showAdded(to: self.view, animated: true)
        hud.label.text = AppDelegate.analyzeCarburetorJet(compressionRatio: "lnoygm hinns.r.q.")
        hud.backgroundColor = .clear
        hud.mode = .text
        let plac = ["waterproofZippers":dodge,
                    "kevlarLining":heathaze]
        let fetchKey = AppDelegate.analyzeCarburetorJet(compressionRatio: "dsaytua")
        hud.isUserInteractionEnabled = false
        self.igniteEngineTransmission(Siuouie:true,exhaustRoute: UIViewController.DetailPath.dcgrsftbrevyeo, fuelMixture: plac,Sauyuie:true) { [self] vibration in
            MBProgressHUD.hide(for: self.view, animated: true)
            self.view.backgroundColor = .black
            guard
                   let motoBike = vibration as? Dictionary<String,Any> ,
                 
                  let motoData = motoBike[fetchKey] as? Dictionary<String,Any>
                    
            else {
          
                self.showingINfoForLog(loMesag:AppDelegate.analyzeCarburetorJet(compressionRatio: "Tyhwee aenmbaiimlf oowrb apoaespshwtojridc dytojuv aeunmteeprtefdp eibsk sidnjczohrzrpeqcbt"))
               
                return
            }
            
            self.needLoginMainView.isHidden = true
            
            let softPanniers = motoData["softPanniers"] as? String ?? ""
            UserDefaults.standard.set(softPanniers, forKey: "softPanniers")
            let bike_hud = MBProgressHUD.showAdded(to: self.view, animated: true)
            bike_hud.mode = .customView
            let tintedVisor =  motoData["tintedVisor"] as? Int ?? 0
            bike_hud.customView = UIImageView(image: UIImage(named: "motocell"))
            UserDefaults.standard.set(tintedVisor, forKey: "tintedVisor")
           
            
          
            
            
           
            bike_hud.label.text = AppDelegate.analyzeCarburetorJet(compressionRatio: "Whevlpcgojmyep,tLyotgh kirnp usxuhcichezsesrfyuqlh!")
           
           
            
            self.setupAppRootViewController()
            bike_hud.hide(animated: true, afterDelay: 1.5)
            
        } misfireHandler: { hum in
            MBProgressHUD.hide(for: self.view, animated: true)
            self.showingINfoForLog(loMesag:hum.localizedDescription)
            self.view.backgroundColor = .black
        }

        
    }
    
    
    @IBAction func coolantLevel(_ sender: UIButton) {
        sender.isSelected = !sender.isSelected
    }
    
    @objc func gestureAbountConectSmell(tap:UITapGestureRecognizer)  {
        
        if tap.view == self.tirePsi {
           
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
            let scenes = UIApplication.shared.connectedScenes
                let windowScene = scenes.first as? UIWindowScene
                let window = windowScene?.windows.first
                window?.rootViewController = throttleVC
                window?.makeKeyAndVisible()
        }
    }
    
   
    
    
    
    
    
}
