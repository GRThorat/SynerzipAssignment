//
//  ViewModel.swift
//  SynerzipAssignment
//
//  Created by gaurav thorat on 29/08/20.
//  Copyright © 2020 gaurav thorat. All rights reserved.
//

import Foundation

protocol ViewModelDelegate: class {
    func viewModelDidUpdate(_ viewModel: ViewModel)
}

class ViewModel {
    
    var cityData: CityModel?
    weak var delegate: ViewModelDelegate?
    
    init() {
        
    }
    
    func getCityData(searchText: String) {
        SearchRequestService().request(searchText) { (response) in
            
            DispatchQueue.main.async {
                switch response {
                case .Success(let results):
                    self.cityData = results
                    self.delegate?.viewModelDidUpdate(self)
                case .Failure(let message):
                    GlobalHelper.shared.showToast(message: message)
                case .Error(let error):
                        GlobalHelper.shared.showToast(message: error)
                }
            }
        }
    }
}
