//
//  RideFuelManager.swift
//  Chridemoto
//
//  Created by mumu on 2025/10/23.
//

import UIKit
import StoreKit

final class RideFuelManager: NSObject {
    
    static let shared = RideFuelManager()
    private var completion: ((Result<Void, Error>) -> Void)?
    private var request: SKProductsRequest?
    
    private override init() {
        super.init()
        SKPaymentQueue.default().add(self)
    }
    
    deinit {
        SKPaymentQueue.default().remove(self)
    }

    /// 启动购买（最简接口）
    func startPurchase(id productID: String, completion: @escaping (Result<Void, Error>) -> Void) {
        guard SKPaymentQueue.canMakePayments() else {
            completion(.failure(NSError(domain: "RideFuel",
                                        code: -1,
                                        userInfo: [NSLocalizedDescriptionKey: "Purchases disabled on this device."])))
            return
        }
        
        self.completion = completion
        request?.cancel()
        let r = SKProductsRequest(productIdentifiers: [productID])
        r.delegate = self
        self.request = r
        r.start()
    }

}

// MARK: - 产品请求
extension RideFuelManager: SKProductsRequestDelegate {
    func productsRequest(_ request: SKProductsRequest, didReceive response: SKProductsResponse) {
        guard let p = response.products.first else {
            completion?(.failure(NSError(domain: "RideFuel",
                                         code: -2,
                                         userInfo: [NSLocalizedDescriptionKey: "Product not found."])))
            completion = nil
            return
        }
        SKPaymentQueue.default().add(SKPayment(product: p))
    }
    
    func request(_ request: SKRequest, didFailWithError error: Error) {
        completion?(.failure(error))
        completion = nil
    }
}

// MARK: - 交易回调
extension RideFuelManager: SKPaymentTransactionObserver {
    func paymentQueue(_ queue: SKPaymentQueue, updatedTransactions transactions: [SKPaymentTransaction]) {
        for t in transactions {
            switch t.transactionState {
            case .purchased:
                SKPaymentQueue.default().finishTransaction(t)
                completion?(.success(()))
                completion = nil
            case .failed:
                SKPaymentQueue.default().finishTransaction(t)
                let e = (t.error as? SKError)?.code == .paymentCancelled
                ? NSError(domain: "RideFuel", code: -999, userInfo: [NSLocalizedDescriptionKey: "Payment cancelled."])
                : (t.error ?? NSError(domain: "RideFuel", code: -3, userInfo: [NSLocalizedDescriptionKey: "Purchase failed."]))
                completion?(.failure(e))
                completion = nil
            case .restored:
                SKPaymentQueue.default().finishTransaction(t)
            default:
                break
            }
        }
    }
}

extension RideFuelManager {
    
    /// 获取本地 App Store 收据（可用于校验）
    func localReceiptData() -> Data? {
        guard let url = Bundle.main.appStoreReceiptURL else {
            return nil
        }
        return try? Data(contentsOf: url)
    }
    
    /// 最近一次交易的 ID（如果存在）
    var lastTransactionID: String? {
        SKPaymentQueue.default().transactions.last?.transactionIdentifier
    }
    
    
}
