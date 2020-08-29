//
//  Constants.swift
//  SynerzipAssignment
//
//  Created by gaurav thorat on 29/08/20.
//  Copyright © 2020 gaurav thorat. All rights reserved.
//

import Foundation
import UIKit

enum HTTPMethodType: String {
    case get    = "GET"
    case post   = "POST"
    case put    = "PUT"
    
    var value: String {
        return self.rawValue
    }
}

enum ResultType <T> {
    case Success(T)
    case Failure(String)
    case Error(String)
}

let api_key = "74eb6a7f586dfa9721600c04e2eb2d2e"

class StringConstants {
    static let noDataMessage = "No Data found"
    static let errorMessage = "Something went wrong"
    static let noInternetConnection = "No Internet Connection"
    
    static func getSearchUrl(cityName: String) -> String {
        return "http://api.openweathermap.org/data/2.5/weather?q=\(cityName)&appid=\(api_key)"
    }
}
