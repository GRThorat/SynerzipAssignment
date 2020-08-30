//
//  ViewModel.swift
//  SynerzipAssignment
//
//  Created by gaurav thorat on 29/08/20.
//  Copyright © 2020 gaurav thorat. All rights reserved.
//

import Foundation
import UIKit
import CoreData

protocol ViewModelDelegate: class {
    func viewModelDidUpdate(_ viewModel: ViewModel)
}

class ViewModel {
    
    var cityData: CityModel?
    var cityDBModel: CityData?
    
    weak var delegate: ViewModelDelegate?
    
    init() {
        
    }
    
    func getCityData(searchText: String) {
        SearchRequestService().request(searchText) { (response) in
            
            DispatchQueue.main.async {
                switch response {
                case .Success(let results):
                    self.cityData = results
                    CoreDataHelper().addEntryInDB(cityData: self.cityData)
                    self.delegate?.viewModelDidUpdate(self)
                case .Failure(let message):
                    GlobalHelper.shared.showToast(message: message)
                case .Error(let error):
                        GlobalHelper.shared.showToast(message: error)
                }
            }
        }
    }
    
    func isCityNotAvailable(searchText: String) -> Bool {
        let data = CoreDataHelper().isEntryAvailable(cityName: searchText)
        if data != nil {
            self.cityDBModel = data
            return true
        } else {
            return false
        }
    }
}
