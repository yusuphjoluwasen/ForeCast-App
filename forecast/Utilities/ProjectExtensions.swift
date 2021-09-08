//
//  ProjectExtensions.swift
//  forecast
//
//  Created by Guru on 04/09/2021.
//  Copyright © 2021 SHAPE A/S. All rights reserved.
//

import Foundation
import UIKit
import Entities

let userDefaults = UserDefaults.standard

func saveWeatherArrayToUserDefault(weather:CurrentWeather?){
    
    var arrayOfWeather = retrieveWeatherArray()
    if arrayOfWeather?.count == 0{
        let weatherObj = mapCurrentWeather(currentWeather: weather, id: 1)
        
        saveWeatherArray(array: [weatherObj])
    }else{
        let weatherObj = mapCurrentWeather(currentWeather: weather, id: getGreatestId(array: arrayOfWeather ?? []) + 1)
        arrayOfWeather?.append(weatherObj)
        saveWeatherArray(array: arrayOfWeather ?? [])
    }
}

func mapCurrentWeather(currentWeather:CurrentWeather?, id:Int) -> WeatherObj{
    return WeatherObj(id:id,temp: currentWeather?.main?.temp, minTemp: currentWeather?.main?.tempMax, maxTemp: currentWeather?.main?.tempMax, pressure: currentWeather?.main?.pressure, humidity: currentWeather?.main?.humidity, country: currentWeather?.name, lon: currentWeather?.coord?.lat, lat: currentWeather?.coord?.lon, description: currentWeather?.weather?.first?.description, icon: currentWeather?.weather?.first?.icon, date: currentWeather?.date)
}

func getGreatestId(array:[WeatherObj]) -> Int{
    return array.lazy.map { $0.id }.max() ?? 0
}

func getArrayFromUserDefault() -> [WeatherObj]{
    
   return retrieveWeatherArray() ?? []
}

func deleteObjectById(id:Int) {
    
   let array = retrieveWeatherArray() ?? []
    let newarr = array.filter{$0.id != id}
   saveWeatherArray(array: newarr)
}

func saveWeatherArray(array:[WeatherObj]){
   
    do {
         let newarray = convertWeatherObjToWeather2(objList: array)
        let encodedData = try NSKeyedArchiver.archivedData(withRootObject: newarray as Array, requiringSecureCoding: false) as Data
        userDefaults.set(encodedData, forKey: "myWeatherList")

    } catch {
        print("Couldn't save data")
    }
   
}

func retrieveWeatherArray() -> [WeatherObj]?{
    var array:[WeatherObj] = []
    do {
       
        let data  = userDefaults.object(forKey: "myWeatherList") as? Data
        if data != nil{
            let objList = try NSKeyedUnarchiver.unarchiveTopLevelObjectWithData(data!) as? [WeatherObj2]
            array = convertWeatherObj2ToWeather(objList: objList ?? [] )
        }else{
            array = []
        }
        
       
    } catch {
        print(error)
        print("Couldn't read data")
    }
   return array
}

func convertWeatherObjToWeather2(objList:[WeatherObj]) -> [WeatherObj2]{
    return objList.map{ obj in  WeatherObj2(idString: obj.id, desc: obj.description, temperature: obj.temp?.toString(), tempMin: obj.minTemp?.toString(), tempMax: obj.maxTemp?.toString(), presure: obj.pressure?.toString(), humid: obj.humidity?.toString(), countries: obj.country, latitude: obj.lat?.toString(), longitude: obj.lon?.toString(), iconn: obj.icon, datee: obj.date?.toString())}
}

func convertWeatherObj2ToWeather(objList:[WeatherObj2]) -> [WeatherObj]{
    return objList.map{ obj in  WeatherObj(id: obj.id, temp: obj.temp?.toDouble(), minTemp: obj.minTemp?.toDouble(), maxTemp: obj.maxTemp?.toDouble(), pressure: obj.pressure?.toInt(), humidity: obj.humidity?.toInt(), country: obj.country, lon: obj.lon?.toDouble(), lat: obj.lat?.toDouble(), description: obj.descrip, icon: obj.icon, date: obj.date?.toInt())
        
    }
}

func setUpGeneralSheetViewController(sheet:SheetViewController){
    
    sheet.blurBottomSafeArea = true
    sheet.setSizes([.halfScreen])
    sheet.adjustForBottomSafeArea = true
    sheet.topCornersRadius = 15
    sheet.dismissOnBackgroundTap = true
    sheet.dismissOnBackgroundTap = true
    sheet.extendBackgroundBehindHandle = true
}

func testingLocalNotification(desc:String){
    
    let content = UNMutableNotificationContent()
    content.title = NSString.localizedUserNotificationString(forKey: "Forecase App", arguments: nil)
    content.body = NSString.localizedUserNotificationString(forKey: "Feeling like \(desc)", arguments: nil)
    content.sound = UNNotificationSound.default
    content.categoryIdentifier = "notify-test"
    let trigger = UNTimeIntervalNotificationTrigger.init(timeInterval: 3, repeats: false)
    let request = UNNotificationRequest.init(identifier: "notify-test", content: content, trigger: trigger)
    let center = UNUserNotificationCenter.current()
    center.add(request)
}


