//
//  UIImageSetUp.swift
//  forecast
//
//  Created by Guru on 10/09/2021.
//  Copyright © 2021 SHAPE A/S. All rights reserved.
//

import UIKit

extension UIImageView {
    func setUpImageView(image:String, contentMode:UIView.ContentMode = .scaleAspectFill){
        self.image = UIImage(named: image)
        self.contentMode = contentMode
        
    }
}
