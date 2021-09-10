//
//  LocationHistoryData.swift
//  forecast
//
//  Created by Guru on 10/09/2021.
//  Copyright © 2021 SHAPE A/S. All rights reserved.
//

import Foundation
extension LocationHistoryDetailViewController{
    func updateItems(weather:WeatherObj?){
        let temp = ((weather?.temp ?? 0) - 273.15).toInt() ?? 0
        
        let lat = "Lat: \(weather?.lat?.toString() ?? "Lat: 0.0")\u{00B0}"
        let long = "Long: \(weather?.lon?.toString() ?? "Long: 0.0")\u{00B0}"
        let image = weather?.icon.isNil(value: "02d")
        let urlString = "https://openweathermap.org/img/wn/\(image.isNil(value: ""))@2x.png"
        
        locationConditionView.locTempText.text = "\(temp)\u{00B0}"
        locationConditionView.locWeatherDescText.text = weather?.description?.capitalized
        locationCoordinateView.latText.text = lat
        locationCoordinateView.longText.text = long
        locationConditionData = createLocationCondtionArray(weather: weather)
        locWeatherDescImage.loadImageWithUrl(URL(string: urlString)!)
    }
    
    
    
    func createLocationCondtionArray(weather:WeatherObj?) -> [LocationConditionObj]{
        
        let mintemp = convertToCelcius(temp: weather?.minTemp)
        let maxtemp = convertToCelcius(temp: weather?.maxTemp)
        let pressure = weather?.pressure.isNil(value: 0)
        let humidity = weather?.humidity.isNil(value: 0)
        let locationObjOne = LocationConditionObj(image: LocationHistoryStringConstants.string.thermometer, text: "\(mintemp.toString())\u{00B0}C", label: LocationHistoryStringConstants.string.mintemp)
        let locationObjTwo = LocationConditionObj(image: LocationHistoryStringConstants.string.thermometer, text: "\(maxtemp.toString())\u{00B0}C", label: LocationHistoryStringConstants.string.mintemp)
        let locationObjThree = LocationConditionObj(image: LocationHistoryStringConstants.string.heartbeat, text: "\(pressure?.toString() ?? "") Pa", label: LocationHistoryStringConstants.string.pressure.capitalized)
        let locationObjFour = LocationConditionObj(image: LocationHistoryStringConstants.string.humidity, text: "\(humidity?.toString() ?? "") g/m3", label: LocationHistoryStringConstants.string.humidity.capitalized)
        
        return [locationObjOne, locationObjTwo, locationObjThree, locationObjFour]
    }
    
}
