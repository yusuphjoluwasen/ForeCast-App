//
//  FindLocationConfig.swift
//  forecast
//
//  Created by Jakob Vinther-Larsen on 19/02/2019.
//  Copyright © 2019 SHAPE A/S. All rights reserved.
//

import UIKit
import API

struct FindLocationConfig {
    static func setup(api apiClient: ForecastClient) -> UIViewController {
        let viewController = FindLocationViewController()
        let interactor:FindLocationInteractorInput = FindLocationInteractor(api: apiClient)
        let presenter:FindLocationPresenterInput & FindLocationInteractorOutPut = FindLocationPresenter()
        let router = FindLocationRouter(api: apiClient)
        
        viewController.presenter = presenter
        presenter.view = viewController
        presenter.router = router
        presenter.interactor = interactor
        interactor.output = presenter
  
        return viewController
    }
}
