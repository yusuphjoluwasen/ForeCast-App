//
//  Loader.swift
//  forecast
//
//  Created by Guru on 02/09/2021.
//  Copyright © 2021 SHAPE A/S. All rights reserved.
//

import Foundation
//
//  LoaderLauncher.swift
//  KeyStone
//
//  Created by Guru on 27/05/2020.
//  Copyright © 2020 Qucoon. All rights reserved.
//

import UIKit

class LoaderLauncher: BaseView {
    
    
    let blackView : UIView = {
        let black = UIView()
        black.translatesAutoresizingMaskIntoConstraints = false
        black.backgroundColor = UIColor(white: 0, alpha: 0.7)
        return black
    }()
    
    let OkImageView:UIImageView = {
        let imageview = UIImageView()
        imageview.image = UIImage(named: "loader")
        imageview.translatesAutoresizingMaskIntoConstraints = false
        imageview.contentMode = .scaleToFill
        imageview.heightAnchor.constraint(equalToConstant: 60).isActive = true
        imageview.widthAnchor.constraint(equalToConstant: 60).isActive = true
        return imageview
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        sizeToFit()
        addSubview(blackView)
        addSubview(OkImageView)
        
        
        blackView.topAnchor.constraint(equalTo: topAnchor, constant: 0).isActive = true
        blackView.bottomAnchor.constraint(equalTo: bottomAnchor, constant: 0).isActive = true
        blackView.rightAnchor.constraint(equalTo: rightAnchor, constant: 0).isActive = true
        blackView.leftAnchor.constraint(equalTo: leftAnchor, constant: 0).isActive = true
        
        OkImageView.centerXAnchor.constraint(equalTo: centerXAnchor).isActive = true
        OkImageView.centerYAnchor.constraint(equalTo: centerYAnchor).isActive = true
       
        
        rotate3(imageView: OkImageView)
        
        
        
        blackView.isUserInteractionEnabled = false
       
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
  
}


