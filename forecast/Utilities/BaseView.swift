//
//  BaseView.swift
//  forecast
//
//  Created by Guru on 02/09/2021.
//  Copyright © 2021 SHAPE A/S. All rights reserved.
//


import UIKit


class BaseView:UIView,UIViewDialogProtocol {
   
   
    override init(frame: CGRect) {
     super.init(frame: frame)

    }
    
    
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
          

    
     
}
