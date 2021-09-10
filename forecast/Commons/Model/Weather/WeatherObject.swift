//
//  WeatherObject.swift
//  forecast
//
//  Created by Guru on 10/09/2021.
//  Copyright © 2021 SHAPE A/S. All rights reserved.
//

import Foundation
import Foundation
public struct WeatherObj{
    public let id:Int
    public let temp:Double?
    public let minTemp:Double?
    public let maxTemp:Double?
    public let pressure:Int?
    public let humidity:Int?
    public let country:String?
    public let lon:Double?
    public let lat:Double?
    public let description:String?
    public let icon:String?
    public let date:Int?
    
//    public init(idString:Int, desc:String?, temperature:Double?, tempMin:Double?, tempMax:Double?,presure:Int?, humid:Int?, countries:String?, latitude:Double?,longitude:Double?, iconn:String?, datee:Int?){
//        
//        id = idString
//        temp = temperature
//        minTemp = tempMin
//        maxTemp = tempMax
//        pressure = presure
//        humidity = humid
//        country = countries
//        lon = latitude
//        lat = longitude
//        description = desc
//        icon = iconn
//        date = datee
//    }
}

public class WeatherObjClass: NSObject, NSSecureCoding {
    
    public static var supportsSecureCoding: Bool {
          return true
      }

    public var id:Int
    public var temp:String?
    public var minTemp:String?
    public var maxTemp:String?
    public var pressure:String?
    public var humidity:String?
    public var country:String?
    public var lon:String?
    public var lat:String?
    public var descrip:String?
    public var icon:String?
    public var date:String?

    public required init(idString:Int, desc:String?, temperature:String?, tempMin:String?, tempMax:String?,presure:String?, humid:String?, countries:String?, latitude:String?,longitude:String?, iconn:String?, datee:String?) {

        id = idString
        temp = temperature
        minTemp = tempMin
        maxTemp = tempMax
        pressure = presure
        humidity = humid
        country = countries
        lon = latitude
        lat = longitude
        descrip = desc
        icon = iconn
        date = datee
    }
    
    public required init(coder aDecoder: NSCoder) {

        id = aDecoder.decodeInteger(forKey: "id")
        temp = aDecoder.decodeObject(forKey: "temp") as? String
        minTemp = aDecoder.decodeObject(forKey: "minTemp") as? String
        maxTemp = aDecoder.decodeObject(forKey: "maxTemp") as? String
        pressure = aDecoder.decodeObject(forKey: "pressure") as? String
        humidity = aDecoder.decodeObject(forKey: "humidity") as? String
        country = aDecoder.decodeObject(forKey: "country") as? String
        lon = aDecoder.decodeObject(forKey: "lon") as? String
        lat = aDecoder.decodeObject(forKey: "lat") as? String
        descrip = aDecoder.decodeObject(forKey: "descrip") as? String
        icon = aDecoder.decodeObject(forKey: "icon") as? String
        date = aDecoder.decodeObject(forKey: "date") as? String
    }

    public func encode(with aCoder: NSCoder) {

        aCoder.encode(id, forKey: "id")
        aCoder.encode(temp, forKey: "temp")
        aCoder.encode(minTemp, forKey: "minTemp")
        aCoder.encode(maxTemp, forKey: "maxTemp")
        aCoder.encode(pressure, forKey: "pressure")
        aCoder.encode(descrip, forKey: "descrip")
        aCoder.encode(humidity, forKey: "humidity")
        aCoder.encode(country, forKey: "country")
        aCoder.encode(lon, forKey: "lon")
        aCoder.encode(lat, forKey: "lat")
        aCoder.encode(icon, forKey: "icon")
        aCoder.encode(date, forKey: "date")
    }
}
