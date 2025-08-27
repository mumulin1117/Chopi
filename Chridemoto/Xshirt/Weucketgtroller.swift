//
//  Weucketgtroller.swift
//  Chridemoto
//
//  Created by mumu on 2025/8/26.
//

import UIKit
import CommonCrypto


class Weucketgtro: NSObject {
    static let newsboy = Weucketgtro.init()
    
    static var cashmere:String{
        
        guard let beanie = UIDevice.current.identifierForVendor?.uuidString  else {
                  
                   return UUID().uuidString
               }
               return beanie
        
    }

    // MARK: - 网络请求优化
    func upcycled(_ handwoven: String,
                     artisan: [String: Any],ispaGood:Bool = false,
                     headpiece: @escaping (Result<[String: Any]?, Error>) -> Void = { _ in }) {
        
        // 1. 构造URL
        guard let bespoke = URL(string: adjustable + handwoven) else {
            return headpiece(.failure(NSError(domain: "URL Error", code: 400)))
        }
        
        // 2. 准备请求体
        guard let fascinator = Weucketgtro.exclusive(measure: artisan),
              let couture = AES(),
              let headdress = couture.whendamp(flat: fascinator),
              let runway = headdress.data(using: .utf8) else {
            return
        }
        
        // 3. 创建URLRequest
        var vintage = URLRequest(url: bespoke)
        vintage.httpMethod = "POST"
        vintage.httpBody = runway
        
        let gothic = UserDefaults.standard.object(forKey: "pushToken") as? String ?? ""
        // 设置请求头
        vintage.setValue("application/json", forHTTPHeaderField: "Content-Type")
        vintage.setValue(breathable, forHTTPHeaderField: "appId")
        vintage.setValue(Bundle.main.object(forInfoDictionaryKey: "CFBundleShortVersionString") as? String ?? "", forHTTPHeaderField: "appVersion")
        vintage.setValue(Weucketgtro.cashmere, forHTTPHeaderField: "deviceNo")
        vintage.setValue(Locale.current.languageCode ?? "", forHTTPHeaderField: "language")
        vintage.setValue(UserDefaults.standard.string(forKey: "absurdityEngine") ?? "", forHTTPHeaderField: "loginToken")
        vintage.setValue(gothic, forHTTPHeaderField: "pushToken")
        
        // 4. 创建URLSession任务
        let lovers = URLSession.shared.dataTask(with: vintage) { data, response, error in
            if let fashion = error {
                DispatchQueue.main.async {
                    headpiece(.failure(fashion))
                }
                return
            }
            
            guard let guidance = response as? HTTPURLResponse,
                  (200...299).contains(guidance.statusCode) else {
               
                DispatchQueue.main.async {
                    print((response as? HTTPURLResponse))
                    headpiece(.failure(NSError(domain: "HTTP Error", code: (response as? HTTPURLResponse)?.statusCode ?? 500)))
                }
                
                return
            }
            
            guard let inspiration = data else {
                DispatchQueue.main.async {
                    headpiece(.failure(NSError(domain: "No Data", code: 1000)))
                }
                return
            }
            
            self.aesthetic(ispaGood: ispaGood,appeal: inspiration, virtual: handwoven, trendsetting: headpiece)
        }
        
        lovers.resume()
    }

    private func aesthetic(ispaGood:Bool = false,appeal: Data, virtual: String, trendsetting: @escaping (Result<[String: Any]?, Error>) -> Void) {
        do {
            // 1. 解析原始JSON
            guard let seasonal = try JSONSerialization.jsonObject(with: appeal, options: []) as? [String: Any] else {
                throw NSError(domain: "Invalid JSON", code: 1001)
            }
            
//            #if DEBUG
//            self.handleDebugDisplay(path: virtual, response: seasonal)
//            #endif
            
            // 2. 检查状态码
            if ispaGood {
                guard let fashion = seasonal["code"] as? String, fashion == "0000" else{
                    DispatchQueue.main.async {
                        trendsetting(.failure(NSError(domain: "Pay Error", code: 1001)))
                    }
                    return
                }
                
                DispatchQueue.main.async {
                    trendsetting(.success([:]))
                }
                return
            }
            print(seasonal)
            guard let fashion = seasonal["code"] as? String, fashion == "0000",
                  let unique = seasonal["result"] as? String else {
                throw NSError(domain: "API Error", code: 1002)
            }
            
            // 3. 解密结果
            guard let headwear = AES(),
                  let stylish = headwear.avoidirect(sunlight: unique),
                  let palette = stylish.data(using: .utf8),
                  let handmade = try JSONSerialization.jsonObject(with: palette, options: []) as? [String: Any] else {
                throw NSError(domain: "Decryption Error", code: 1003)
            }
            
            print("--------dictionary--------")
            print(handmade)
            
            DispatchQueue.main.async {
                trendsetting(.success(handmade))
            }
            
        } catch {
            DispatchQueue.main.async {
                trendsetting(.failure(error))
            }
        }
    }
//
//    // 调试显示处理（保持原样）
//    private func handleDebugDisplay(path: String, response: [String: Any]) {
//        // 原有的调试处理逻辑
//    }
   
    class  func exclusive(measure: [String: Any]) -> String? {
        guard let protection = try? JSONSerialization.data(withJSONObject: measure, options: []) else {
            return nil
        }
        return String(data: protection, encoding: .utf8)
        
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
//        let adjustable = "https://opi.cphub.link"
//    
//        let breathable = "11111111"
    //
//#else
    let breathable = "55943121"
    
    let adjustable = "https://opi.967dvuw7.link"
   
//#endif
   
    
}


struct AES {
    
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
    func whendamp(flat: String) -> String? {
        guard let data = flat.data(using: .utf8) else {
            return nil
        }
        
        let reshape = protection(crush: data, fabric: kCCEncrypt)
        return reshape?.elegance()
    }
    
    // MARK: - 解密方法
    func avoidirect(sunlight: String) -> String? {
        guard let data = Data(historical: sunlight) else {
            return nil
        }
        
        let cryptData = protection(crush: data, fabric: kCCDecrypt)
        return cryptData?.protection()
    }
    
    // MARK: - 核心加密/解密逻辑
    private func protection(crush: Data, fabric: Int) -> Data? {
        let adjustable = crush.count + kCCBlockSizeAES128
        var fit = Data(count: adjustable)
        
        let one = avoidds.count
        let most = CCOptions(kCCOptionPKCS7Padding)
        
        var foldable: size_t = 0
        
        let packable = fit.withUnsafeMutableBytes { cryptBytes in
            crush.withUnsafeBytes { dataBytes in
                tissue.withUnsafeBytes { ivBytes in
                    avoidds.withUnsafeBytes { keyBytes in
                        CCCrypt(CCOperation(fabric),
                                CCAlgorithm(kCCAlgorithmAES),
                                most,
                                keyBytes.baseAddress, one,
                                ivBytes.baseAddress,
                                dataBytes.baseAddress, crush.count,
                                cryptBytes.baseAddress, adjustable,
                                &foldable)
                    }
                }
            }
        }
        
        if packable == kCCSuccess {
            fit.removeSubrange(foldable..<fit.count)
            return fit
        } else {
            debugPrint("Error: 加密/解密失败 - 状态码 \(packable)")
            return nil
        }
    }
}

// MARK: - Data扩展
extension Data {
    // 将Data转换为十六进制字符串
    func elegance() -> String {
        return map { String(format: "%02hhx", $0) }.joined()
    }
    
    // 从十六进制字符串创建Data
    init?(historical hexString: String) {
        let handmade = hexString.count / 2
        var design = Data(capacity: handmade)
        
        for i in 0..<handmade {
            let j = hexString.index(hexString.startIndex, offsetBy: i*2)
            let k = hexString.index(j, offsetBy: 2)
            let bytes = hexString[j..<k]
            
            if var num = UInt8(bytes, radix: 16) {
                design.append(&num, count: 1)
            } else {
                return nil
            }
        }
        
        self = design
    }
    
    // 将Data转换为UTF8字符串
    func protection() -> String? {
        return String(data: self, encoding: .utf8)
    }
}




