//
//  SearchRequestService.swift
//  SynerzipAssignment
//
//  Created by gaurav thorat on 29/08/20.
//  Copyright © 2020 gaurav thorat. All rights reserved.
//

import Foundation

class SearchRequestService {
    
    func request(_ searchText: String, completion: @escaping (ResultType<CityModel?>) -> Void) {
        
        guard let request = SearchRequestConfig.searchRequest(searchText).value else {
            return
        }
        
        NetworkManager.shared.request(request) { (result) in
            switch result {
            case .Success(let responseData):
                if let model = self.processResponse(responseData) {
                    return completion(.Success(model))
                } else {
                    return completion(.Failure(StringConstants.errorMessage))
                }
            case .Failure(let message):
                return completion(.Failure(message))
            case .Error(let error):
                return completion(.Failure(error))
            }
        }
    }
    
    private func processResponse(_ data: Data) -> CityModel? {
        do {
            let responseModel = try JSONDecoder().decode(CityModel.self, from: data)
            return responseModel
            
        } catch {
            print("Data parsing error: \(error.localizedDescription)")
            return nil
        }
    }
}
