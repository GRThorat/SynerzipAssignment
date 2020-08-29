//
//  GlobalHelper.swift
//  SynerzipAssignment
//
//  Created by gaurav thorat on 29/08/20.
//  Copyright © 2020 gaurav thorat. All rights reserved.
//

import Foundation
import UIKit

class GlobalHelper {
    
    static let shared = GlobalHelper()
    
    func showToast(message: String) {
        let toastAlert = UIAlertController(title: String(), message: message, preferredStyle: .alert)
        UIApplication.shared.windows.first?.rootViewController?.present(toastAlert, animated: true, completion: nil)
        Timer.scheduledTimer(withTimeInterval: 2, repeats: false) { (_) in
            toastAlert.dismiss(animated: true, completion: nil)
        }
    }
    
    func convertTemp(temp: Double, from inputTempType: UnitTemperature, to outputTempType: UnitTemperature) -> String {
        
        let formatter = MeasurementFormatter()
        formatter.numberFormatter.maximumFractionDigits = 0
        formatter.unitOptions = .providedUnit
        let input = Measurement(value: temp, unit: inputTempType)
        let output = input.converted(to: outputTempType)
        return formatter.string(from: output)
    }
}
