//
//  FindLocationPresenter.swift
//  forecast
//
//  Created by Jakob Vinther-Larsen on 19/02/2019.
//  Copyright © 2019 SHAPE A/S. All rights reserved.
//

import Foundation
import Entities
import Client
import MapKit


final class FindLocationPresenter {
    
    weak var view: FindLocationViewControllerInput?
    var router: FindLocationRouterProtocol?
    var interactor: FindLocationInteractorInput?
    
}

extension FindLocationPresenter: FindLocationInteractorOutPut {
    
    func sendWeatherDetailsToView(data: CurrentWeather?) {
        view?.hideLoader()
        view?.getWeatherDetails(data: data)
    }

    func sendErrorToView(error: Client.Error?) {
        
        view?.hideLoader()
        
        if case let .some(error) = error?.code{

            switch error {
            case 400:
                view?.getError(error: FindLocationStringConstants.string.nodetail)
            case 404:
                view?.getError(error: FindLocationStringConstants.string.nodetail)
            case 500:
                view?.getError(error: FindLocationStringConstants.string.systemnotavailable)
            default:
                view?.getError(error: FindLocationStringConstants.string.somethingwentwrong)
            }
        }
    }
  
}


extension FindLocationPresenter:FindLocationPresenterInput{
    
    func viewIsReady() {
        interactor?.viewIsReady()
    }
    
    func locationSelected(at coordinate: CLLocationCoordinate2D) {
        view?.showLoader()
        interactor?.locationSelected(at: coordinate)
    }
    
    func moveToFindLocationDetail(data: CurrentWeather?) {
        router?.moveToFindLocationDetail(from: view!, data: data)
    }
    
}
