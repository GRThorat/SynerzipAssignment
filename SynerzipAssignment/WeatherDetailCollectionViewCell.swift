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
            detailValueLabel.text = "\(cityData?.sys?.sunrise ?? 0)"
        case 1:
            detailNameLabel.text = "SUNSET"
            detailValueLabel.text = "\(cityData?.sys?.sunset ?? 0)"
        case 2:
            detailNameLabel.text = "HUMIDITY"
            detailValueLabel.text = "\(cityData?.main?.humidity ?? 0)"
        case 3:
            detailNameLabel.text = "WIND"
            detailValueLabel.text = "\(cityData?.wind?.speed ?? 0.0)"
        case 4:
            detailNameLabel.text = "FEELS LIKE"
            detailValueLabel.text = "\(cityData?.main?.feelsLike ?? 0.0)"
        case 5:
            detailNameLabel.text = "PRESSURE"
            detailValueLabel.text = "\(cityData?.main?.pressure ?? 0)"
        case 6:
            detailNameLabel.text = "VISIBILITY"
            detailValueLabel.text = "\(cityData?.visibility ?? 0)"
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
}
