//
//  RequestConfiguration.swift
//  SynerzipAssignment
//
//  Created by gaurav thorat on 29/08/20.
//  Copyright © 2020 gaurav thorat. All rights reserved.
//

import Foundation

class RequestConfiguration: NSMutableURLRequest {
    
    convenience init?(requestMethod: HTTPMethodType, urlString: String, bodyParams: [String: Any]? = nil) {
        
        guard let url =  URL.init(string: urlString) else {
            return nil
        }
        
        self.init(url: url)
        
        do {
            if let bodyParams = bodyParams {
                let data = try JSONSerialization.data(withJSONObject: bodyParams, options: .prettyPrinted)
                self.httpBody = data
            }
        } catch {
            
        }
        
        self.httpMethod = requestMethod.value
        
        self.addValue("application/json", forHTTPHeaderField: "Content-Type")
    }
}
