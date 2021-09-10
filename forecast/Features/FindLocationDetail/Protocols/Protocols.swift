//
//  Protocols.swift
//  forecast
//
//  Created by Guru on 08/09/2021.
//  Copyright © 2021 SHAPE A/S. All rights reserved.
//

import Foundation
import Entities

// MARK:- PRESENTER TO ROUTER
protocol FindLocationDetailRouterProtocol: class {
    func openHistoryBottomSheet(view:FindLocationDetailViewControllerInput)
    func moveToFindLocationHistoryDetail(data:WeatherObj?, view:FindLocationDetailViewControllerInput)
}


// MARK:- PRESENTER TO VIEW
protocol FindLocationDetailViewControllerInput: class {
    
}

// MARK:- VIEW TO PRESENTER
protocol FindLocationDetailPresenterInput: class {
    
    var view: FindLocationDetailViewControllerInput? { get set }
    var router: FindLocationDetailRouterProtocol? { get set }

   func openHistoryBottomSheet()
    
    
}
