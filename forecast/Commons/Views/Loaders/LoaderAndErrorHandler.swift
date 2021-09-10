//
//  LoaderAndErrorHandler.swift
//  forecast
//
//  Created by Guru on 10/09/2021.
//  Copyright © 2021 SHAPE A/S. All rights reserved.
//

import Foundation
import UIKit
import Entities

class LoadingHandler: NSObject {
    
    public static var load = LoadingHandler()
    
    var loader:LoaderLauncher? = nil
   
    func createLoader(loader:LoaderLauncher?) -> LoaderLauncher{
        if(loader == nil){
            self.loader = LoaderLauncher()
        }
        return self.loader!
    }
    
    func showLauncherLoader(){
        
        let loader = createLoader(loader: self.loader)
        loader.show()
    }
    
    func dismissLauncherLoader(){
        
        loader?.dismiss()
        loader = nil
    }
   
}

