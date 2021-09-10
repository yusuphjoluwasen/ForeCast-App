//
//  RgbToUIColor.swift
//  forecast
//
//  Created by Guru on 10/09/2021.
//  Copyright © 2021 SHAPE A/S. All rights reserved.
//

import Foundation
import UIKit


extension UIColor{
    
    //MARK:- RgbStringToUIColor
    
    
    static func rgb( red: CGFloat, green: CGFloat, blue: CGFloat, alpha: CGFloat) -> UIColor {
        return UIColor(red: red/255, green: green/255, blue: blue/255, alpha: alpha)
    }
    static let colorLine: UIColor =  rgb(red: 153, green: 153, blue: 153, alpha: 1)
    static let lightOrange : UIColor =  rgb(red: 248, green: 167, blue: 0, alpha: 0.10)
}
