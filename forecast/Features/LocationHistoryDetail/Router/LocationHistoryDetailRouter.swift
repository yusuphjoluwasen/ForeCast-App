//
//  Router.swift
//  forecast
//
//  Created by Guru on 08/09/2021.
//  Copyright © 2021 SHAPE A/S. All rights reserved.
//

import Foundation
import Entities

class LocationHistoryDetailRouter {
    
    
    class func createLocationHistoryDetailModule(data: WeatherObj?) -> UIViewController {
        let view = LocationHistoryDetailViewController()
        view.locationDetails = data

        return view
    }
}


