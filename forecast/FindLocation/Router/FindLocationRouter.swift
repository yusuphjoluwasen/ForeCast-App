
//
//  FindLocationRouter.swift
//  forecast
//
//  Created by Jakob Vinther-Larsen on 19/02/2019.
//  Copyright © 2019 SHAPE A/S. All rights reserved.
//

import MapKit
import API
import Entities

final class FindLocationRouter{
    let api: ForecastClient
    
    init(api apiClient: ForecastClient) {
        self.api = apiClient
    }
    
}

extension FindLocationRouter:FindLocationRouterProtocol{
    func moveToFindLocationDetail(from view: FindLocationViewControllerInput, data: CurrentWeather?) {
        let detail = FindLocationDetailRouter.createLocationDetailModule(data:data)
        if let sourceView = view as? UIViewController {

           sourceView.navigationController?.pushViewController(detail, animated: true)
        }
    }
}
