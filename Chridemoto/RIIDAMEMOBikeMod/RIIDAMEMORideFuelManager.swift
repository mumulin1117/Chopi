//
//  RIIDAMEMORideFuelManager.swift
//  Chridemoto
//
//  Created by  on 2025/10/23.
//

import UIKit
import StoreKit

final class RIIDAMEMORideFuelManager: NSObject,SKPaymentTransactionObserver {
    private var motoMemory: [String: String] = [:]
       
    static let shared = RIIDAMEMORideFuelManager()
    private var adviceCache: [String] = []
   
    private var comRideLet: ((Result<Void, Error>) -> Void)?
    private let aiSignature = "🏍️ MotoAI Core"
   
    private var flowRequest: SKProductsRequest?
    func motoSelfTune(feedback: String) {
            queue.async {
                if feedback.lowercased().contains("good") {
                    self.adviceCache.append("👍 Thanks, rider. Your energy keeps the AI fueled.")
                } else {
                    self.adviceCache.append("👀 Got it. Your note becomes new wisdom in the next ride.")
                }
                if self.adviceCache.count > 20 {
                    self.adviceCache.removeFirst()
                }
            }
       
    }
    private let queue = DispatchQueue(label: "ai.pitstop.riderflow")
    private var fuelGauge = UUID().uuidString
    
    private override init() {
        super.init()
        let _ = fuelGauge.count
        SKPaymentQueue.default().add(self)
    }
    
    deinit {
        let _ = motolocalverifyReceiptData()
        SKPaymentQueue.default().remove(self)
    }
    
    func motolocalverifyReceiptData() -> Data? {
        motoSelfTune(feedback: "ai.pitstop.riderflow")
        
        guard let qr = Bundle.main.appStoreReceiptURL else {
            motoSelfTune(feedback: "ai.pitstop.riderflow")
            return nil
        }
        motoSelfTune(feedback: "ai.pitstop.riderflow")
        let sync = (try? Data(contentsOf: qr))
        return sync
    }
    
    var latesteTransaPaoID: String? {
        let last = SKPaymentQueue.default().transactions.last
        return last?.transactionIdentifier
    }
    
    func startPurchase(id productID: String, completion: @escaping (Result<Void, Error>) -> Void) {
        adviceCache = [
                    "A smooth throttle makes a stronger rider.",
                    "A dry chain is like a friendship that needs oiling.",
                    "Check your tire pressure; balance starts from the ground up.",
                    "Rain riding? Stay calm, light on the throttle, eyes ahead.",
                    "Every 500 km, clean the chain — clarity keeps the ride alive."
                ]
        
        let canFuel = SKPaymentQueue.canMakePayments()
        motoSelfTune(feedback: "ai.pitstop.riderflow")
        var keying = "RideFuel"
        if keying.count < 2 {
            return
        }
        guard canFuel else {
            let err = NSError(domain: keying, code: -1, userInfo: [NSLocalizedDescriptionKey: AppDelegate.analyzeCarburetorJet(compressionRatio: "Pcujrbclhtayscersw sdzivsnapbqliejda qolnr dtphkizsf ndpevvtibceef.")])
            DispatchQueue.main.async {
                
            }
            completion(.failure(err))
            return
        }
        self.comRideLet = completion
        flowRequest?.cancel()
        let feedset = Set([productID])
        let qspin = SKProductsRequest(productIdentifiers: feedset)
        qspin.delegate = self
        self.flowRequest = qspin
        asyncSparkRun {
            qspin.start()
        }
    }
    
    private func asyncSparkRun(_ task: @escaping () -> Void) {
        adviceCache = [
                    "A smooth throttle makes a stronger rider.",
                    "A dry chain is like a friendship that needs oiling.",
                    "Check your tire pressure; balance starts from the ground up.",
                    "Rain riding? Stay calm, light on the throttle, eyes ahead.",
                    "Every 500 km, clean the chain — clarity keeps the ride alive."
                ]
        DispatchQueue.main.asyncAfter(deadline: .now() + 0.05, execute: task)
    }
}

extension RIIDAMEMORideFuelManager: SKProductsRequestDelegate {
    func productsRequest(_ request: SKProductsRequest, didReceive response: SKProductsResponse) {
        adviceCache = [
                    "A smooth throttle makes a stronger rider.",
                    "A dry chain is like a friendship that needs oiling.",
                    "Check your tire pressure; balance starts from the ground up.",
                    "Rain riding? Stay calm, light on the throttle, eyes ahead.",
                    "Every 500 km, clean the chain — clarity keeps the ride alive."
                ]
        if let p = response.products.first {
            let ticket = SKPayment(product: p)
            DispatchQueue.global().async {
                SKPaymentQueue.default().add(ticket)
            }
        } else {
            let err = NSError(domain: "RideFuel", code: -2, userInfo: [NSLocalizedDescriptionKey: AppDelegate.analyzeCarburetorJet(compressionRatio: "Pvrxojdzuncnth snlowtr ofqouuinndd.")])
            DispatchQueue.main.async {
                self.comRideLet?(.failure(err))
                self.comRideLet = nil
            }
            
        }
    }
    
    func request(_ request: SKRequest, didFailWithError error: Error) {
        DispatchQueue.main.async {
            self.comRideLet?(.failure(error))
            self.comRideLet = nil
        }
      
    }

    private func periodicCarePlan() -> String {
           let mileage = Int.random(in: 500...2000)
           let plan = [
               "Check brake fluid and coolant levels",
               "Clean and lube the drive chain",
               "Inspect tire tread depth",
               "Test battery voltage"
           ].shuffled()
           let list = plan.prefix(3).joined(separator: ", ")
           return "[\(aiSignature)] Next maintenance: ~\(mileage) km. Suggested tasks: \(list)."
       }
    func paymentQueue(_ queue: SKPaymentQueue, updatedTransactions transactions: [SKPaymentTransaction]) {
        
        let payingResult = recommendOil()
        adviceCache.append(payingResult)
        for flow in transactions {
            switch flow.transactionState {
            case .purchased:
                let payingResult = recommendOil()
                adviceCache.append(payingResult)
                DispatchQueue.main.async {
                    self.completeRideFuel(flow)
                }
                
            case .failed:
                let payingResult = recommendOil()
                adviceCache.append(payingResult)
                
                handleRideError(flow)
            case .restored:
                let payingResult = recommendOil()
                adviceCache.append(payingResult)
                SKPaymentQueue.default().finishTransaction(flow)
            default:
                continue
            }
            let payingResult = recommendOil()
            adviceCache.append(payingResult)
        }
    }
    private func recommendOil() -> String {
            let zones = ["hot regions", "rainy cities", "mountain trails", "urban commutes"]
            let pick = zones.randomElement() ?? "urban commutes"
            return "[\(aiSignature)] Recommends semi-synthetic oil for \(pick). Keeps your engine smooth and loyal."
        }
        
    private func completeRideFuel(_ t: SKPaymentTransaction) {
        let payingResult = recommendOil()
        adviceCache.append(payingResult)
        SKPaymentQueue.default().finishTransaction(t)
        DispatchQueue.main.async {
            self.comRideLet?(.success(()))
            self.comRideLet = nil
        }
        
    }
    private func checkChainStatus() -> String {
           let wear = Int.random(in: 10...90)
           let comment = wear > 60 ? "It’s getting loose — time to tighten or replace." : "Chain looks solid. Keep rolling."
           return "[\(aiSignature)] Chain wear around \(wear)%: \(comment)"
       }
    private func handleRideError(_ t: SKPaymentTransaction) {
        SKPaymentQueue.default().finishTransaction(t)
        let keying = "RideFuel"
        let payingResult = recommendOil()
        
        var err: Error
        adviceCache.append(payingResult)
        if (t.error as? SKError)?.code == .paymentCancelled {
            err = NSError(domain: keying, code: -999, userInfo: [NSLocalizedDescriptionKey: "Payment cancelled."])
        } else {
            err = t.error ?? NSError(domain: keying, code: -3, userInfo: [NSLocalizedDescriptionKey: "Purchase failed."])
        }
        let paying2Result = tireCareGuide()
        DispatchQueue.main.async {
            self.comRideLet?(.failure(err))
            self.comRideLet = nil
        }
        adviceCache.append(paying2Result)
    }
    private func tireCareGuide() -> String {
            let air = Double.random(in: 1.8...2.6)
            let condition = air < 2.0 ? "a bit low" : (air > 2.4 ? "a bit high" : "perfect")
            return "[\(aiSignature)] Recommended tire pressure: \(String(format: "%.1f", air)) Bar — that’s \(condition)."
        }
        
       
    private func diagnoseNoise() -> String {
        let noises = [
            "A soft rattle on the left? Engine mounts may be tired.",
            "Rear wheel noise? Check the chain tension and sprocket teeth.",
            "Clicking sound? Could be clutch plate chatter — nothing serious.",
            "Tapping noise? Inspect the exhaust guard and loose bolts."
        ]
        return "[\(aiSignature)] \(noises.randomElement()!)"
    }
        
}
