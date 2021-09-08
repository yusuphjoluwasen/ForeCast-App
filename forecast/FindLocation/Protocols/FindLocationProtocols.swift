//
//  FindLocationProtocols.swift
//  forecast
//
//  Created by Guru on 08/09/2021.
//  Copyright © 2021 SHAPE A/S. All rights reserved.
//

import Foundation
import Entities
import MapKit
import Client

// MARK:- PRESENTER TO VIEW
protocol FindLocationViewControllerInput: class {
    
    func getWeatherDetails(data: CurrentWeather?)
    func getError(error: String)
    func showLoader()
    func hideLoader()
    
}

// MARK:- VIEW TO PRESENTER
protocol FindLocationPresenterInput: class {
    
    var view: FindLocationViewControllerInput? { get set }
    var interactor: FindLocationInteractorInput? { get set }
    var router: FindLocationRouterProtocol? { get set }
    
    func viewIsReady()
    func locationSelected(at coordinate: CLLocationCoordinate2D)
    func moveToFindLocationDetail(data:CurrentWeather?)
    
    
}

// MARK:- PRESENTER TO INTERACTOR
protocol FindLocationInteractorInput: class {
    
    var output: FindLocationInteractorOutPut? { get set }
    
    func viewIsReady()
    func locationSelected(at coordinate: CLLocationCoordinate2D)
    
}

// MARK:- INTERACTOR TO PRESENTER
protocol FindLocationInteractorOutPut: class {
    
    func sendWeatherDetailsToView(data: CurrentWeather?)
    func sendErrorToView(error:Client.Error?)
    
}

// MARK:- PRESENTER TO ROUTER
protocol FindLocationRouterProtocol: class {
    
    func moveToFindLocationDetail(from view: FindLocationViewControllerInput, data:CurrentWeather?)
}


