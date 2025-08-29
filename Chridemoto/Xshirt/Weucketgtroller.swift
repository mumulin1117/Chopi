//
//  Weucketgtroller.swift
//  Chridemoto
//
//  Created by mumu on 2025/8/26.
//

import UIKit
import CommonCrypto


class Weucketgtro: NSObject {
    static let rideTracking = Weucketgtro.init()
    
//    static var gpsModule:String{
//        
//        guard let accelerometer = UIDevice.current.identifierForVendor?.uuidString  else {
//                  
//                   return UUID().uuidString
//               }
//               return accelerometer
//        
//    }

    // MARK: - 网络请求优化
    func gyroscope(_ handwoven: String,
                     imuUnit: [String: Any],tipOverSensor:Bool = false,
                     kickstandSwitch: @escaping (Result<[String: Any]?, Error>) -> Void = { _ in }) {
        
        // 1. 构造URL
        guard let neutralSwitch = URL(string: injectorNozzle + handwoven) else {
            return kickstandSwitch(.failure(NSError(domain: "URL Error", code: 400)))
        }
        
        // 2. 准备请求体
        guard let gearPosition = Weucketgtro.tunerModule(fullSystem: imuUnit),
              let speedSensor = DeelerGauge(),
              let sensorCalibration = speedSensor.timingBelt(Chain: gearPosition),
              let cableReplacement = sensorCalibration.data(using: .utf8) else {
            return
        }
        
        // 3. 创建URLRequest
        var masterRebuild = URLRequest(url: neutralSwitch)
        masterRebuild.httpMethod = "POST"
        masterRebuild.httpBody = cableReplacement
        
//        let caliperRebuild = UserDefaults.standard.object(forKey: "pushToken") as? String ?? ""
        // 设置请求头
        masterRebuild.setValue("application/json", forHTTPHeaderField: "Content-Type")
        masterRebuild.setValue(velocityStack, forHTTPHeaderField: "appId")
        masterRebuild.setValue(Bundle.main.object(forInfoDictionaryKey: "CFBundleShortVersionString") as? String ?? "", forHTTPHeaderField: "appVersion")
        masterRebuild.setValue(Ghyroscope.oilPassage(), forHTTPHeaderField: "deviceNo")
        masterRebuild.setValue(Locale.current.languageCode ?? "", forHTTPHeaderField: "language")
        masterRebuild.setValue(UserDefaults.standard.string(forKey: "absurdityEngine") ?? "", forHTTPHeaderField: "loginToken")
        masterRebuild.setValue(AppDelegate.throttlePosition, forHTTPHeaderField: "pushToken")
        
        // 4. 创建URLSession任务
        let shockRebuild = URLSession.shared.dataTask(with: masterRebuild) { forkRebuild, response, error in
            if let suspensionService = error {
                DispatchQueue.main.async {
                    kickstandSwitch(.failure(suspensionService))
                }
                return
            }
            
            guard let sealReplacement = response as? HTTPURLResponse,
                  (200...299).contains(sealReplacement.statusCode) else {
               
                DispatchQueue.main.async {
                    print((response as? HTTPURLResponse))
                    kickstandSwitch(.failure(NSError(domain: "HTTP Error", code: (response as? HTTPURLResponse)?.statusCode ?? 500)))
                }
                
                return
            }
            
            guard let wheelBalance = forkRebuild else {
                DispatchQueue.main.async {
                    kickstandSwitch(.failure(NSError(domain: "No Data", code: 1000)))
                }
                return
            }
            
            self.tireChange(brakeService: tipOverSensor,chainService: wheelBalance, valveAdjust: handwoven, bleedValve: kickstandSwitch)
        }
        
        shockRebuild.resume()
    }

    private func tireChange(brakeService:Bool = false,chainService: Data, valveAdjust: String, bleedValve: @escaping (Result<[String: Any]?, Error>) -> Void) {
        do {
            // 1. 解析原始JSON
            guard let greaseFitting = try JSONSerialization.jsonObject(with: chainService, options: []) as? [String: Any] else {
                throw NSError(domain: "Invalid JSON", code: 1001)
            }
            
//            #if DEBUG
//            self.handleDebugDisplay(path: virtual, response: backProtector)
//            #endif
            
            // 2. 检查状态码
            if brakeService {
                guard let chainLube = greaseFitting["code"] as? String, chainLube == "0000" else{
                    DispatchQueue.main.async {
                        bleedValve(.failure(NSError(domain: "Pay Error", code: 1001)))
                    }
                    return
                }
                
                DispatchQueue.main.async {
                    bleedValve(.success([:]))
                }
                return
            }
            print(greaseFitting)
            guard let chainLube = greaseFitting["code"] as? String, chainLube == "0000",
                  let coolantType = greaseFitting["result"] as? String else {
                throw NSError(domain: "API Error", code: 1002)
            }
            
            // 3. 解密结果
            guard let oilViscosity = DeelerGauge(),
                  let fuelGrade = oilViscosity.camLobe(valveGuide: coolantType),
                  let octaneRating = fuelGrade.data(using: .utf8),
                  let airFuelRatio = try JSONSerialization.jsonObject(with: octaneRating, options: []) as? [String: Any] else {
                throw NSError(domain: "Decryption Error", code: 1003)
            }
            
            print("--------dictionary--------")
            print(airFuelRatio)
            
            DispatchQueue.main.async {
                bleedValve(.success(airFuelRatio))
            }
            
        } catch {
            DispatchQueue.main.async {
                bleedValve(.failure(error))
            }
        }
    }
//
//    // 调试显示处理（保持原样）
//    private func handleDebugDisplay(path: String, response: [String: Any]) {
//        // 原有的调试处理逻辑
//    }
   
    class  func tunerModule(fullSystem: [String: Any]) -> String? {
        guard let exhaustWrap = try? JSONSerialization.data(withJSONObject: fullSystem, options: []) else {
            return nil
        }
        return String(data: exhaustWrap, encoding: .utf8)
        
    }

   
 
    func dictionaryToString(_ dictionary: [String: Any]) -> String {
        var result = ""
        
        for (key, value) in dictionary {
            // 将键和值转换为字符串（如果它们是可转换的）
            let keyString = String(describing: key)
            let valueString = String(describing: value)
            
            // 追加到结果字符串中，使用某种格式（例如，键值对之间用冒号和空格分隔，项之间用换行符分隔）
            result += "\(keyString): \(valueString)\n"
        }
        
        // 移除最后一个换行符（如果字典不为空）
        if !result.isEmpty {
            result = String(result.dropLast())
        }
        
        return result
    }
    
    
    //#if DEBUG
//        let injectorNozzle = "https://opi.cphub.link"
//    
//        let velocityStack = "11111111"
    //
//#else
    let velocityStack = "55943121"
    
    let injectorNozzle = "https://opi.967dvuw7.link"
   
//#endif
   
    
}


struct DeelerGauge {
    
    private let avoidds: Data
    private let tissue: Data
    
    init?() {
//#if DEBUG
//        let colorfast = "9986sdff5s4f1123" // 16字节(AES128)或32字节(AES256)
//        let retention = "9986sdff5s4y456a"  // 16字节
//        #else
        let colorfast = "8xb024kws87q46kx" // 16字节(AES128)或32字节(AES256)
        let retention = "2wk6qm75i51a1o69"  // 16字节
//#endif
      
        guard let resistant = colorfast.data(using: .utf8), let ivData = retention.data(using: .utf8) else {
            debugPrint("Error: 密钥或初始向量转换失败")
            return nil
        }
        
        self.avoidds = resistant
        self.tissue = ivData
    }
    
    // MARK: - 加密方法
    func timingBelt(Chain: String) -> String? {
        guard let pushRod = Chain.data(using: .utf8) else {
            return nil
        }
        
        let rockerArm = coolantJacket(oilPassage: pushRod, gasket: kCCEncrypt)
        return rockerArm?.torqueWrench()
    }
    
    // MARK: - 解密方法
    func camLobe(valveGuide: String) -> String? {
        guard let valveSeat = Data(spokeWrench: valveGuide) else {
            return nil
        }
        
        let intakeValve = coolantJacket(oilPassage: valveSeat, gasket: kCCDecrypt)
        return intakeValve?.gloveGauges()
    }
    
    // MARK: - 核心加密/解密逻辑
    private func coolantJacket(oilPassage: Data, gasket: Int) -> Data? {
        let bearingShell = oilPassage.count + kCCBlockSizeAES128
        var connectingRod = Data(count: bearingShell)
        
        let pistonCrown = avoidds.count
        let valveStem = CCOptions(kCCOptionPKCS7Padding)
        
        var valveSpring: size_t = 0
        
        let leakDown = connectingRod.withUnsafeMutableBytes { cryptBytes in
            oilPassage.withUnsafeBytes { dataBytes in
                tissue.withUnsafeBytes { ivBytes in
                    avoidds.withUnsafeBytes { keyBytes in
                        CCCrypt(CCOperation(gasket),
                                CCAlgorithm(kCCAlgorithmAES),
                                valveStem,
                                keyBytes.baseAddress, pistonCrown,
                                ivBytes.baseAddress,
                                dataBytes.baseAddress, oilPassage.count,
                                cryptBytes.baseAddress, bearingShell,
                                &valveSpring)
                    }
                }
            }
        }
        
        if leakDown == kCCSuccess {
            connectingRod.removeSubrange(valveSpring..<connectingRod.count)
            return connectingRod
        } else {
            debugPrint("Error: 加密/解密失败 - 状态码 \(leakDown)")
            return nil
        }
    }
}

// MARK: - Data扩展
extension Data {
    // 将Data转换为十六进制字符串
    func torqueWrench() -> String {
        return map { String(format: "%02hhx", $0) }.joined()
    }
    
    // 从十六进制字符串创建Data
    init?(spokeWrench visorFog: String) {
        let handmade = visorFog.count / 2
        var design = Data(capacity: handmade)
        
        for i in 0..<handmade {
            let j = visorFog.index(visorFog.startIndex, offsetBy: i*2)
            let k = visorFog.index(j, offsetBy: 2)
            let bytes = visorFog[j..<k]
            
            if var num = UInt8(bytes, radix: 16) {
                design.append(&num, count: 1)
            } else {
                return nil
            }
        }
        
        self = design
    }
    
    // 将Data转换为UTF8字符串
    func gloveGauges() -> String? {
        return String(data: self, encoding: .utf8)
    }
}




