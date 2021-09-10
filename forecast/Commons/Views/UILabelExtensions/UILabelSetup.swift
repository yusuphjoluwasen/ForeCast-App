//
//  UILabelExtensions.swift
//  forecast
//
//  Created by Guru on 10/09/2021.
//  Copyright © 2021 SHAPE A/S. All rights reserved.
//

import UIKit

extension UILabel {
    func setUpGenLabel(text:String, textColor:UIColor = .black, font:UIFont, numberOfLines:Int = 1,textAlignment:NSTextAlignment = .left){
        self.text = text
        self.font = font
        self.textColor = textColor
        self.sizeToFit()
        self.numberOfLines = numberOfLines
        self.textAlignment = textAlignment
    }
}
