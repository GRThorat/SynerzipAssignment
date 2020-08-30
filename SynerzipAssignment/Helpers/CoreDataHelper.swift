//
//  CoreDataHelper.swift
//  SynerzipAssignment
//
//  Created by gaurav thorat on 30/08/20.
//  Copyright © 2020 gaurav thorat. All rights reserved.
//

import Foundation
import CoreData
import UIKit

class CoreDataHelper {
    
    func addEntryInDB(cityData: CityModel?) {
        
        guard let appDel = UIApplication.shared.delegate as? AppDelegate else { return }
        
        let managedContext = appDel.persistentContainer.viewContext
        
        guard let cityEntity = NSEntityDescription.entity(forEntityName: "CityData", in: managedContext) else { return }
        
        let city = NSManagedObject(entity: cityEntity, insertInto: managedContext)
        city.setValue(cityData?.id, forKey: "cityId")
        city.setValue(cityData?.main?.feelsLike, forKey: "feelsLike")
        city.setValue(cityData?.main?.humidity, forKey: "humidity")
        city.setValue(cityData?.main?.pressure, forKey: "pressure")
        city.setValue(cityData?.sys?.sunrise, forKey: "sunrise")
        city.setValue(cityData?.sys?.sunset, forKey: "sunset")
        city.setValue(cityData?.main?.tempMax, forKey: "tempMax")
        city.setValue(cityData?.main?.tempMin, forKey: "tempMin")
        city.setValue(cityData?.visibility, forKey: "visibility")
        city.setValue(cityData?.wind?.speed, forKey: "wind")
        city.setValue(cityData?.main?.temp, forKey: "temp")
        city.setValue(cityData?.weather?.first?.icon, forKey: "icon")
        city.setValue(cityData?.name, forKey: "name")
        city.setValue(cityData?.weather?.first?.weatherDescription, forKey: "weatherDescription")
        
        do {
            try managedContext.save()
        } catch let error {
            print("Could not save. \(error), \(error.localizedDescription)")
        }
    }
    
    func isEntryAvailable(cityName: String) -> CityData? {
        
        guard let appDel = UIApplication.shared.delegate as? AppDelegate else { return nil }
        
        let managedContext = appDel.persistentContainer.viewContext
        
        let fetchRequest = NSFetchRequest<NSFetchRequestResult>(entityName: "CityData")
        fetchRequest.predicate = NSPredicate(format: "name = %@", cityName)
        
        do {
            let result = try managedContext.fetch(fetchRequest)
            if result.count > 0 {
                let city = try managedContext.fetch(fetchRequest).first as? CityData
                if city != nil {
                    return city
                } else {
                    return nil
                }
            } else {
                return nil
            }
        } catch {
            print("Fail to fecth")
            return nil
        }
    }
    
    func deleteAllEntries() {
        
        guard let appDel = UIApplication.shared.delegate as? AppDelegate else { return }
        
        let managedContext = appDel.persistentContainer.viewContext
        
        let request = NSFetchRequest<NSFetchRequestResult>(entityName: "CityData")
        
        do {
            let allRecords = try managedContext.fetch(request)
            
            for record in allRecords {
                guard let managedObj = record as? NSManagedObject else { return }
                managedContext.delete(managedObj)
            }
        } catch {
            print("Fail to fecth")
        }
    }
}
