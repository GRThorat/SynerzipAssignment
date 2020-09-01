//
//  SynerzipAssignmentTests.swift
//  SynerzipAssignmentTests
//
//  Created by gaurav thorat on 01/09/20.
//  Copyright © 2020 gaurav thorat. All rights reserved.
//

import XCTest
@testable import SynerzipAssignment

class SynerzipAssignmentTests: XCTestCase {

    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    func testExample() throws {
        // This is an example of a functional test case.
        // Use XCTAssert and related functions to verify your tests produce the correct results.
    }

    func testPerformanceExample() throws {
        // This is an example of a performance test case.
        measure {
            // Put the code you want to measure the time of here.
        }
    }

    func testDataModel() {
        
        let viewController = ViewController()
        let viewModel = viewController.viewModel
        
        let sunset = viewModel.cityData?.sys?.sunset
        XCTAssertNotNil(sunset, "Sunset data is nil, and cannot be displayed correctly")
        
        let sunrise = viewModel.cityData?.sys?.sunrise
        XCTAssertNotNil(sunrise, "Sunrise data is nil, and cannot be displayed correctly")

        let humidity = viewModel.cityData?.main?.humidity
        XCTAssertNotNil(humidity, "Humidity data is nil, and cannot be displayed correctly")
        
        let wind = viewModel.cityData?.wind?.speed
        XCTAssertNotNil(wind, "Wind data is nil, and cannot be displayed correctly")
        
        let feelsLike = viewModel.cityData?.main?.feelsLike
        XCTAssertNotNil(feelsLike, "FeelsLike data is nil, and cannot be displayed correctly")
        
        let pressure = viewModel.cityData?.main?.pressure
        XCTAssertNotNil(pressure, "Pressure data is nil, and cannot be displayed correctly")
        
        let visibility = viewModel.cityData?.visibility
        XCTAssertNotNil(visibility, "Visibility data is nil, and cannot be displayed correctly")
        
        let tempMin = viewModel.cityData?.main?.tempMin
        XCTAssertNotNil(tempMin, "Minimum Temperature data is nil, and cannot be displayed correctly")
        
        let tempMax = viewModel.cityData?.main?.tempMax
        XCTAssertNotNil(tempMax, "Maxinum Temperature data is nil, and cannot be displayed correctly")
        
        let currentTemp = viewModel.cityData?.main?.temp
        XCTAssertNotNil(currentTemp, "Current Temperature data is nil, and cannot be displayed correctly")
        
        let cityName = viewModel.cityData?.name
        XCTAssertNotNil(cityName, "City Name data is nil, and cannot be displayed correctly")
        
        let weatherDetails = viewModel.cityData?.weather
        XCTAssertNotNil(weatherDetails, "Weather details data is nil, and cannot be displayed correctly")
        
        let weatherDescription = viewModel.cityData?.weather?.first?.weatherDescription
        XCTAssertNotNil(weatherDescription, "Weather description data is nil, and cannot be displayed correctly")
        
        let icon = viewModel.cityData?.weather?.first?.icon
        XCTAssertNotNil(icon, "Weather image data is nil, and will be displayed placeholder image")
    }
}
