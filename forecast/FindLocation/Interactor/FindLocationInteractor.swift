//
//  FindLocationInteractor.swift
//  forecast
//
//  Created by Jakob Vinther-Larsen on 19/02/2019.
//  Copyright © 2019 SHAPE A/S. All rights reserved.
//

import MapKit
import API
import Entities
import Client


final class FindLocationInteractor {
    weak var output: FindLocationInteractorOutPut?
    
    let api: ForecastClient
    
    init(api apiClient: ForecastClient) {
        self.api = apiClient
    }
}

extension FindLocationInteractor:FindLocationInteractorInput {
    
    
    func viewIsReady() {
        
        _ = api.perform(CurrentWeather.getCurrent(for: "london,uk")) { (result) in
            dump(result)
        }
        
    }
    
    func locationSelected(at coordinate: CLLocationCoordinate2D) {
        print("locationn oo",coordinate)
        _ = api.perform(CurrentWeather.getCurrentByCoordinates(for: coordinate)) { [weak self] result in
            
            switch result{
            case .success(let data):
                self?.output?.sendWeatherDetailsToView(data: data)
                
            case .failure(let error):
                self?.output?.sendErrorToView(error: error)
            }
            
        }
        
    }
}
