//
//  ErrorHandler.swift
//  forecast
//
//  Created by Guru on 10/09/2021.
//  Copyright © 2021 SHAPE A/S. All rights reserved.
//

import Foundation
import UIKit
import Entities

class ErrorHandler: NSObject {
    
    static var error = ErrorHandler()
    
    var failurePopUp : FFPopup? = nil
    
    func createFailurePopup(loader:FFPopup?) -> FFPopup{
        
        if(loader == nil){
            failurePopUp = FFPopup()
        }
        return failurePopUp!
    }
    
    func showErrorPopUp(errorString:String){
        
        let failureLauncher = FailureLauncherView(frame: CGRect(x: 0, y: 0, width: 280, height: 230))
        failureLauncher.errorText = errorString
        let failureP = createFailurePopup(loader: failurePopUp)
        failureP.dismissType = .shrinkOut
        failureP.shouldDismissOnContentTouch = false
        failureP.showType = .growIn
        failureP.contentView = failureLauncher
        failureLauncher.onItemClickSelected = { [unowned failureP] in
       
            failureP.dismiss(animated: true)
            
       
        failureLauncher.removeFromSuperview()
        }
      
        
        failureP.show()
    }
   
}

