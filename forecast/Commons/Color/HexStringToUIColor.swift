//
//  ColorConversions.swift
//  forecast
//
//  Created by Guru on 10/09/2021.
//  Copyright © 2021 SHAPE A/S. All rights reserved.
//

import UIKit


extension UIColor{
    
    //MARK:- HEXStringToUIColor
    static func hexStringToUIColor (hex:String, alpha:CGFloat = 1.0) -> UIColor {
        var cString:String = hex.trimmingCharacters(in: .whitespacesAndNewlines).uppercased()
        
        if (cString.hasPrefix("#")) {
            cString.remove(at: cString.startIndex)
        }
        
        if ((cString.count) != 6) {
            return UIColor.gray
        }
        
        var rgbValue:UInt64 = 0
        Scanner(string: cString).scanHexInt64(&rgbValue)
        
        return UIColor(
            red: CGFloat((rgbValue & 0xFF0000) >> 16) / 255.0,
            green: CGFloat((rgbValue & 0x00FF00) >> 8) / 255.0,
            blue: CGFloat(rgbValue & 0x0000FF) / 255.0,
            alpha: alpha
        )
    }
    
    static let foreCastBlue : UIColor = hexStringToUIColor(hex: "#0B60B5")
    static let foreCastTranWhite : UIColor = hexStringToUIColor(hex: "#FFFFFF", alpha: 0.09)
    static let foreCastWhiteBlack : UIColor = hexStringToUIColor(hex: "#F0F0F0", alpha: 1)
    static let foreCastColorGray : UIColor = hexStringToUIColor(hex: "#E3DEDE", alpha: 1)
    static let foreCastColorGray2 : UIColor = hexStringToUIColor(hex: "#8A8A8A", alpha: 1)
    static let foreCastPurpleBlue : UIColor = hexStringToUIColor(hex: "#0C2382", alpha: 1)
}
