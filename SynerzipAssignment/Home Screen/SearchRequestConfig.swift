//
//  SearchRequestConfig.swift
//  SynerzipAssignment
//
//  Created by gaurav thorat on 29/08/20.
//  Copyright © 2020 gaurav thorat. All rights reserved.
//

import Foundation
import UIKit

enum SearchRequestConfig {
    
    case searchRequest(String)
    
    var value: RequestConfiguration? {
        
        switch self {
            
        case .searchRequest(let searchText):
            let urlString = StringConstants.getSearchUrl(cityName: searchText).replacingOccurrences(of: " ", with: "%20")
            let reqConfig = RequestConfiguration.init(requestMethod: .get, urlString: urlString ?? "")
            return reqConfig
        }
    }
}
