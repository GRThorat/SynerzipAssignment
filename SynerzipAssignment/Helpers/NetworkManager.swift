//
//  NetworkManager.swift
//  SynerzipAssignment
//
//  Created by gaurav thorat on 29/08/20.
//  Copyright © 2020 gaurav thorat. All rights reserved.
//

import Foundation
import UIKit

class NetworkManager: NSObject {
    
    static let shared = NetworkManager()
    
    func request(_ request: RequestConfiguration, completion: @escaping (ResultType<Data>) -> Void) {
        
        guard (Reachability.currentReachabilityStatus != .notReachable) else {
            return completion(.Failure(StringConstants.noInternetConnection))
        }
        
        URLSession.shared.dataTask(with: request as URLRequest) { (data, response, error) in
            
            guard error == nil else {
                return completion(.Failure(error!.localizedDescription))
            }
            
            guard let data = data else {
                return completion(.Failure(error?.localizedDescription ?? StringConstants.errorMessage))
            }
            
            guard let stringResponse = String(data: data, encoding: String.Encoding.utf8) else {
                return completion(.Failure(error?.localizedDescription ?? StringConstants.errorMessage))
            }
            
            print("Respone: \(stringResponse)")
            
            return completion(.Success(data))
            
        }.resume()
    }
}
