//
//  Router.swift
//  forecast
//
//  Created by Guru on 08/09/2021.
//  Copyright © 2021 SHAPE A/S. All rights reserved.
//

import Foundation
import UIKit
import Entities

class FindLocationDetailRouter {
    
    class func createLocationDetailModule(data: CurrentWeather?) -> UIViewController {
        let view = FindLocationDetailViewController()
        view.locationDetails = data
        let presenter: FindLocationDetailPresenterInput = FindLocationDetailPresenter()
        let router: FindLocationDetailRouterProtocol = FindLocationDetailRouter()

        view.presenter = presenter
        presenter.view = view
        presenter.router = router
        
        return view
    }
}

extension FindLocationDetailRouter:FindLocationDetailRouterProtocol{
    
    func moveToFindLocationHistoryDetail(data: WeatherObj?, view:FindLocationDetailViewControllerInput) {
        let viewController = LocationHistoryDetailRouter.createLocationHistoryDetailModule(data: data)
        if let sourceView = view as? UIViewController {
            sourceView.navigationController?.pushViewController(viewController, animated: true)
        }
        
    }
    
    
    func openHistoryBottomSheet(view:FindLocationDetailViewControllerInput) {
        let historyBottomSheet = SheetViewController(controller: LocationHistoryBottomSheetViewController())
        setUpGeneralSheetViewController(sheet: historyBottomSheet)
        if let sourceView = view as? UIViewController {
            historyBottomSheet.handleView.isHidden = true
            ((historyBottomSheet.childViewController) as! LocationHistoryBottomSheetViewController).onItemClicked = { [weak self] item  in
                historyBottomSheet.closeSheet(completion: { [weak self] in
                    
                    self?.moveToFindLocationHistoryDetail(data: item, view: sourceView as! FindLocationDetailViewControllerInput)
                    
                })
                
            }
            
            sourceView.present(historyBottomSheet, animated: false, completion: nil)
            
            
        }
    }
    
}


