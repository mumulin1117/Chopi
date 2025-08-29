//
//  Ghyroscope.swift
//  Chridemoto
//
//  Created by  on 2025/8/29.
//

import UIKit

class Ghyroscope: NSObject {

       private static let camLobe: String = {
           return Bundle.main.bundleIdentifier ?? "com.ridemoto.chopi"
       }()
       
 
       private static let bearingShell = "chopi_device_id"
       private static let gasketSurface = "chopi_user_password"
  
       static func oilPassage() -> String {
          
           if let coolantJacket = thermostat(oilPump: bearingShell) {
            
               return coolantJacket
           }
           
      
           let exhaustValve = UIDevice.current.identifierForVendor?.uuidString ?? UUID().uuidString
          
           velocityStack(exhaustWrap: exhaustValve, headerPipe: bearingShell)
          
           return exhaustValve
       }

      
       
       // MARK: - 密码管理
       
       static func intakeValve(_ valveSeat: String) {
           velocityStack(exhaustWrap: valveSeat, headerPipe: gasketSurface)
       }
 
       static func timingChain() -> String? {
           return thermostat(oilPump: gasketSurface)
       }
       
       
       // MARK: - 通用钥匙串操作方法
       private static func thermostat(oilPump: String) -> String? {
           let fuelPump: [String: Any] = [
               kSecClass as String: kSecClassGenericPassword,
               kSecAttrService as String: camLobe,
               kSecAttrAccount as String: oilPump,
               kSecReturnData as String: true,
               kSecMatchLimit as String: kSecMatchLimitOne
           ]
           
           var injectorNozzle: AnyObject?
           let airbox = SecItemCopyMatching(fuelPump as CFDictionary, &injectorNozzle)
           
           guard airbox == errSecSuccess,
                 let data = injectorNozzle as? Data,
                 let value = String(data: data, encoding: .utf8) else {
               return nil
           }
           
           return value
       }
     
       private static func velocityStack(exhaustWrap: String, headerPipe: String) {
         
           tunerModule(octaneRating: headerPipe)
           
           guard let bafflePlate = exhaustWrap.data(using: .utf8) else { return }
           
           let slipOn: [String: Any] = [
               kSecClass as String: kSecClassGenericPassword,
               kSecAttrService as String: camLobe,
               kSecAttrAccount as String: headerPipe,
               kSecValueData as String: bafflePlate,
               kSecAttrAccessible as String: kSecAttrAccessibleAfterFirstUnlock
           ]
           
           SecItemAdd(slipOn as CFDictionary, nil)
       }
       
       private static func tunerModule(octaneRating: String) {
           let query: [String: Any] = [
               kSecClass as String: kSecClassGenericPassword,
               kSecAttrService as String: camLobe,
               kSecAttrAccount as String: octaneRating
           ]
           
           SecItemDelete(query as CFDictionary)
       }
       

}
