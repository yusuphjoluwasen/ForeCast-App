//
//  FindLocDetailData.swift
//  forecast
//
//  Created by Guru on 10/09/2021.
//  Copyright © 2021 SHAPE A/S. All rights reserved.
//

import Entities
extension FindLocationDetailViewController{
    
    func updateItems(weather:CurrentWeather?){
        let temp = convertToCelcius(temp: weather?.main?.temp)
        let lat = "Lat: \(weather?.coord?.lat?.toString() ?? "Lat: 0.0")\u{00B0}"
        let long = "Long: \(weather?.coord?.lon?.toString() ?? "Long: 0.0")\u{00B0}"
        let image = weather?.weather?.first?.icon ?? "02d"
        let urlString = "https://openweathermap.org/img/wn/\(image)@2x.png"
        let desc = weather?.weather?.first?.description?.capitalized ?? ""
        let id = weather?.weather?.first?.id.isNil(value: 800)
        
        locationConditionView.locTempText.text = "\(temp)\u{00B0}"
        locationConditionView.locWeatherDescText.text = desc.capitalized
        locationCoordinateView.latText.text = lat
        locationCoordinateView.longText.text = long
        locationConditionData = createLocationCondtionArray(weather: weather)
        locWeatherDescImage.loadImageWithUrl(URL(string: urlString)!)
        createLocalNotification(desc: getWeatherId(id: id.isNil(value: 0)))
    }
    
    func createLocationCondtionArray(weather:CurrentWeather?) -> [LocationConditionObj]{
        
        let mintemp = convertToCelcius(temp: weather?.main?.tempMin)
        let maxtemp = convertToCelcius(temp: weather?.main?.tempMax)
        let pressure = weather?.main?.pressure.isNil(value: 0)
        let humidity = weather?.main?.humidity.isNil(value: 0)
        let locationObjOne = LocationConditionObj(image: LocationHistoryStringConstants.string.thermometer, text: "\(mintemp.toString())\u{00B0}C", label: LocationHistoryStringConstants.string.mintemp)
        let locationObjTwo = LocationConditionObj(image: LocationHistoryStringConstants.string.thermometer, text: "\(maxtemp.toString())\u{00B0}C", label: LocationHistoryStringConstants.string.mintemp)
        let locationObjThree = LocationConditionObj(image: LocationHistoryStringConstants.string.heartbeat, text: "\(pressure?.toString() ?? "") Pa", label: LocationHistoryStringConstants.string.pressure.capitalized)
        let locationObjFour = LocationConditionObj(image: LocationHistoryStringConstants.string.humidity, text: "\(humidity?.toString() ?? "") g/m3", label: LocationHistoryStringConstants.string.humidity.capitalized)
        
        return [locationObjOne, locationObjTwo, locationObjThree, locationObjFour]
    }
    
}
