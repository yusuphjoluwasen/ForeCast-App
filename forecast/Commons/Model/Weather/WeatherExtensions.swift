//
//  WeatherExtensions.swift
//  forecast
//
//  Created by Guru on 10/09/2021.
//  Copyright © 2021 SHAPE A/S. All rights reserved.
//

import Foundation
import Entities

let userDefaults = UserDefaults.standard

//MARK:- Save WeatherArrayToUserDefault
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

//MARK:- Convert CurrentWeather Model To Weather Obj Model
func mapCurrentWeather(currentWeather:CurrentWeather?, id:Int) -> WeatherObj{
    return WeatherObj(id:id,temp: currentWeather?.main?.temp, minTemp: currentWeather?.main?.tempMax, maxTemp: currentWeather?.main?.tempMax, pressure: currentWeather?.main?.pressure, humidity: currentWeather?.main?.humidity, country: currentWeather?.name, lon: currentWeather?.coord?.lat, lat: currentWeather?.coord?.lon, description: currentWeather?.weather?.first?.description, icon: currentWeather?.weather?.first?.icon, date: currentWeather?.date)
}

//MARK:- Get Greatest Id
func getGreatestId(array:[WeatherObj]) -> Int{
    return array.lazy.map { $0.id }.max() ?? 0
}

//MARK:- GetWeatherObjArrayFromUserDefault
func getArrayFromUserDefault() -> [WeatherObj]{
    
   return retrieveWeatherArray() ?? []
}

//MARK:- Delete Weather By ID
func deleteObjectById(id:Int) {
    
   let array = retrieveWeatherArray() ?? []
    let newarr = array.filter{$0.id != id}
   saveWeatherArray(array: newarr)
}

//MARK:- Save Weather Array
func saveWeatherArray(array:[WeatherObj]){
   
    do {
         let newarray = convertWeatherObjToWeather2(objList: array)
        let encodedData = try NSKeyedArchiver.archivedData(withRootObject: newarray as Array, requiringSecureCoding: false) as Data
        userDefaults.set(encodedData, forKey: "myWeatherList")

    } catch {
        print("Couldn't save data")
    }
   
}

//MARK:- Retrieve Weather Array From User Default
func retrieveWeatherArray() -> [WeatherObj]?{
    var array:[WeatherObj] = []
    do {
       
        let data  = userDefaults.object(forKey: "myWeatherList") as? Data
        if data != nil{
            let objList = try NSKeyedUnarchiver.unarchiveTopLevelObjectWithData(data!) as? [WeatherObjClass]
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

//MARK:- Convert Weather Object To Weather Object2
func convertWeatherObjToWeather2(objList:[WeatherObj]) -> [WeatherObjClass]{
    return objList.map{ obj in  WeatherObjClass(idString: obj.id, desc: obj.description, temperature: obj.temp?.toString(), tempMin: obj.minTemp?.toString(), tempMax: obj.maxTemp?.toString(), presure: obj.pressure?.toString(), humid: obj.humidity?.toString(), countries: obj.country, latitude: obj.lat?.toString(), longitude: obj.lon?.toString(), iconn: obj.icon, datee: obj.date?.toString())}
}

//MARK:- Convert Weather Object2 To Weather Object
func convertWeatherObj2ToWeather(objList:[WeatherObjClass]) -> [WeatherObj]{
    return objList.map{ obj in  WeatherObj(id: obj.id, temp: obj.temp?.toDouble(), minTemp: obj.minTemp?.toDouble(), maxTemp: obj.maxTemp?.toDouble(), pressure: obj.pressure?.toInt(), humidity: obj.humidity?.toInt(), country: obj.country, lon: obj.lon?.toDouble(), lat: obj.lat?.toDouble(), description: obj.descrip, icon: obj.icon, date: obj.date?.toInt())
        
    }
}


