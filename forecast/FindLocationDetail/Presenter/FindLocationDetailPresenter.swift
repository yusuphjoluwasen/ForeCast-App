//
//  Presenter.swift
//  forecast
//
//  Created by Guru on 08/09/2021.
//  Copyright © 2021 SHAPE A/S. All rights reserved.
//

import Foundation
final class FindLocationDetailPresenter {
    
    weak var view: FindLocationDetailViewControllerInput?
    var router: FindLocationDetailRouterProtocol?
    
}

extension FindLocationDetailPresenter:FindLocationDetailPresenterInput{
    func openHistoryBottomSheet() {
        router?.openHistoryBottomSheet(view: view!)
    }
 
    
}
