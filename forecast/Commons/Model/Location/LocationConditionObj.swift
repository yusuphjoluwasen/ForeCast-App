//
//  LocationConditionObj.swift
//  forecast
//
//  Created by Guru on 10/09/2021.
//  Copyright © 2021 SHAPE A/S. All rights reserved.
//

import Foundation
struct LocationConditionObj{
    let image:String?
    let text:String?
    let label:String?
}

func convertToCelcius(temp:Double?) -> Int{
    return (temp.isNil(value: 0) - 273.15).toInt().isNil(value: 0)
}
