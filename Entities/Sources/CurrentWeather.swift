//
//  CurrentWeather.swift
//  Entities
//
//  Created by Jakob Vinther-Larsen on 19/02/2019.
//  Copyright © 2019 SHAPE A/S. All rights reserved.
//

//import Foundation
//
//public struct CurrentWeather: Codable {
//    enum CodingKeys: String, CodingKey {
//        case date = "dt"
//        case name
//    }
//
//    public let date: Date
//    public let name: String
//}
// MARK: - CurrentWeather
public struct CurrentWeather: Codable {
    public let coord: Coord?
    public let weather: [Weather]?
    public let base: String?
    public let main: Main?
    public let visibility:Int?
    public let wind: Wind?
    public let clouds: Clouds?
    public let date: Int?
    public let sys: Sys?
    public let timezone: Date?
    public let id: Int?
    public let name: String?
    public let cod: Int?
    enum CodingKeys: String, CodingKey {
        case date = "dt"
        case name
        case base
        case id
        case visibility
        case weather
        case coord
        case clouds
        case timezone
        case cod
        case main
        case wind
        case sys
    }
    
    
    
    
}

// MARK: - Clouds
public struct Clouds: Codable {
    let all: Int?
}

// MARK: - Coord
public struct Coord: Codable {
    public let lon:Double?
    public let lat: Double?
}

// MARK: - Main
public struct Main: Codable {
    public let temp, feelsLike, tempMin, tempMax: Double?
    public let pressure, humidity, seaLevel, grndLevel: Int?
    
    enum CodingKeys: String, CodingKey {
        case temp
        case feelsLike = "feels_like"
        case tempMin = "temp_min"
        case tempMax = "temp_max"
        case pressure, humidity
        case seaLevel = "sea_level"
        case grndLevel = "grnd_level"
    }
}

// MARK: - Sys
public struct Sys: Codable {
    public let country: String?
    public let sunrise, sunset: Int?
}

// MARK: - Weather
public struct Weather: Codable {
    public let id: Int?
    public let main, description, icon: String?
    
    enum CodingKeys: String, CodingKey {
        case id, main
        case description
        case icon
    }
}

// MARK: - Wind
public struct Wind: Codable {
    let speed: Double?
    let deg: Int?
    let gust: Double?
}



