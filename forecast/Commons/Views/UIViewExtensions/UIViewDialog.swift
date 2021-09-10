//
//  UIViewDialog.swift
//  forecast
//
//  Created by Guru on 10/09/2021.
//  Copyright © 2021 SHAPE A/S. All rights reserved.
//

import Foundation
import UIKit

protocol UIViewDialogProtocol {
    func show(_ rect: CGRect?)
    func dismiss(_ rect : CGRect?)
    
    
}

extension UIViewDialogProtocol where Self: UIView {
    
    // Show a view
    func show (_ rect: CGRect? = nil) {
        if let keyWindow = UIApplication.shared.keyWindow {
            keyWindow.addSubview(self)
            if rect == nil {
                self.frame = keyWindow.frame
            }
            else {
                self.frame = rect!
            }
            self.alpha = 0
            
            UIView.animate(withDuration: 0.5, delay: 0, usingSpringWithDamping: 1, initialSpringVelocity: 1, options: .curveEaseOut, animations: {
                
                self.alpha = 1
                
            }, completion: nil)
        }
    }
    
    //Dismiss A View
    func dismiss (_ rect: CGRect? = nil) {
        self.removeFromSuperview()
    }
}
