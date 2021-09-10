//
//  FindLocationDetailExtension.swift
//  forecast
//
//  Created by Guru on 10/09/2021.
//  Copyright © 2021 SHAPE A/S. All rights reserved.
//

import Foundation
extension FindLocationDetailViewController{
    
     func getWeatherId(id:Int) -> String{
        let firstrange = 200...233
        let secondrange = 300...322
        let thirdrange = 500...532
        let fourthrange = 600...623
        let fifthrange = 701...782
        let sixthrange = 800
        let seventhrange = 801...805
        if firstrange.contains(id){
            return FindLocationDetailStringConstants.string.thunderstorm
        }else if secondrange.contains(id){
            return FindLocationDetailStringConstants.string.drizzling
        }else if thirdrange.contains(id){
            return FindLocationDetailStringConstants.string.rain
        }
        else if fourthrange.contains(id){
            return FindLocationDetailStringConstants.string.snow
        }
        else if fifthrange.contains(id){
            return FindLocationDetailStringConstants.string.smoke
        }
        else if sixthrange == id{
            return FindLocationDetailStringConstants.string.clear
        }
        else if seventhrange.contains(id){
            return FindLocationDetailStringConstants.string.cloudy
        }else {
            return FindLocationDetailStringConstants.string.greatweather
        }
    }
}
