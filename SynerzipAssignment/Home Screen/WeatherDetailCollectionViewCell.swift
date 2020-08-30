//
//  WeatherDetailCollectionViewCell.swift
//  SynerzipAssignment
//
//  Created by gaurav thorat on 29/08/20.
//  Copyright © 2020 gaurav thorat. All rights reserved.
//

import UIKit

class WeatherDetailCollectionViewCell: UICollectionViewCell {

    @IBOutlet weak var detailNameLabel: UILabel!
    @IBOutlet weak var detailValueLabel: UILabel!
    @IBOutlet weak var cellWidthConstraint: NSLayoutConstraint!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    func configureUI(cityData: CityModel?, index: Int) {
        
        switch index {
        case 0:
            detailNameLabel.text = "SUNRISE"
            let dtFormatter = DateFormatter()
            dtFormatter.dateFormat = "h:mm a"
            detailValueLabel.text = dtFormatter.string(from: Date(timeIntervalSince1970: TimeInterval(cityData?.sys?.sunrise ?? 0)))
        case 1:
            detailNameLabel.text = "SUNSET"
            let dtFormatter = DateFormatter()
            dtFormatter.dateFormat = "h:mm a"
            detailValueLabel.text = dtFormatter.string(from: Date(timeIntervalSince1970: TimeInterval(cityData?.sys?.sunset ?? 0)))
        case 2:
            detailNameLabel.text = "HUMIDITY"
            detailValueLabel.text = "\(cityData?.main?.humidity ?? 0)%"
        case 3:
            detailNameLabel.text = "WIND"
            detailValueLabel.text = "\(cityData?.wind?.speed ?? 0.0) m/s"
        case 4:
            detailNameLabel.text = "FEELS LIKE"
            detailValueLabel.text = GlobalHelper().convertTemp(temp: cityData?.main?.feelsLike ?? 0, from: .kelvin, to: .celsius)
        case 5:
            detailNameLabel.text = "PRESSURE"
            detailValueLabel.text = "\(cityData?.main?.pressure ?? 0) hPa"
        case 6:
            detailNameLabel.text = "VISIBILITY"
            let kms = (cityData?.visibility ?? 0) / 1000
            detailValueLabel.text = "\(kms) km"
        case 7:
            detailNameLabel.text = "MIN TEMPERATURE"
            detailValueLabel.text = GlobalHelper().convertTemp(temp: cityData?.main?.tempMin ?? 0, from: .kelvin, to: .celsius)
        case 8:
            detailNameLabel.text = "MAX TEMPERATURE"
            detailValueLabel.text = GlobalHelper().convertTemp(temp: cityData?.main?.tempMax ?? 0, from: .kelvin, to: .celsius)
        default:
            break
        }
    }
    
    func configureUI(cityData: CityData?, index: Int) {
        
        switch index {
        case 0:
            detailNameLabel.text = "SUNRISE"
            let dtFormatter = DateFormatter()
            dtFormatter.dateFormat = "h:mm a"
            detailValueLabel.text = dtFormatter.string(from: Date(timeIntervalSince1970: TimeInterval(cityData?.sunrise ?? 0)))
        case 1:
            detailNameLabel.text = "SUNSET"
            let dtFormatter = DateFormatter()
            dtFormatter.dateFormat = "h:mm a"
            detailValueLabel.text = dtFormatter.string(from: Date(timeIntervalSince1970: TimeInterval(cityData?.sunset ?? 0)))
        case 2:
            detailNameLabel.text = "HUMIDITY"
            detailValueLabel.text = "\(cityData?.humidity ?? 0)%"
        case 3:
            detailNameLabel.text = "WIND"
            detailValueLabel.text = "\(cityData?.wind ?? 0.0) m/s"
        case 4:
            detailNameLabel.text = "FEELS LIKE"
            detailValueLabel.text = GlobalHelper().convertTemp(temp: Double(cityData?.feelsLike ?? 0), from: .kelvin, to: .celsius)
        case 5:
            detailNameLabel.text = "PRESSURE"
            detailValueLabel.text = "\(cityData?.pressure ?? 0) hPa"
        case 6:
            detailNameLabel.text = "VISIBILITY"
            let kms = (cityData?.visibility ?? 0) / 1000
            detailValueLabel.text = "\(kms) km"
        case 7:
            detailNameLabel.text = "MIN TEMPERATURE"
            detailValueLabel.text = GlobalHelper().convertTemp(temp: Double(cityData?.tempMin ?? 0), from: .kelvin, to: .celsius)
        case 8:
            detailNameLabel.text = "MAX TEMPERATURE"
            detailValueLabel.text = GlobalHelper().convertTemp(temp: Double(cityData?.tempMax ?? 0), from: .kelvin, to: .celsius)
        default:
            break
        }
    }
}
