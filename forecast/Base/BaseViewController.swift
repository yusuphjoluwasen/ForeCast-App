//
//  BaseViewController.swift
//  forecast
//
//  Created by Guru on 02/09/2021.
//  Copyright © 2021 SHAPE A/S. All rights reserved.
//

import UIKit
import Entities

class BaseViewController: UIViewController {
    
    var loader:LoaderLauncher? = nil
    var failurePopUp : FFPopup? = nil
    
    override func viewDidLoad() {
        setupNavSettings()
    }
    
    public func setupNavSettings(){
        self.navigationController?.navigationBar.setBackgroundImage(UIImage(), for: UIBarMetrics.default)
        self.navigationController?.navigationBar.shadowImage = UIImage()
        self.navigationController?.navigationBar.isTranslucent = true
        self.navigationController?.view.backgroundColor = UIColor.clear
        self.navigationController?.navigationBar.tintColor = UIColor.white
        self.navigationItem.backBarButtonItem = UIBarButtonItem(title: "", style: UIBarButtonItem.Style.done, target: self, action: nil)
    }
    
    
    
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

