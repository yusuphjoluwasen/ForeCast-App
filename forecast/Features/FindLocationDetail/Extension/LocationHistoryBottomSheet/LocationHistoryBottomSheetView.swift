//
//  LocationHistoryBottomSheetView.swift
//  forecast
//
//  Created by Guru on 03/09/2021.
//  Copyright © 2021 SHAPE A/S. All rights reserved.
//

import UIKit

extension LocationHistoryBottomSheetViewController{
    
    func setUpConstraintsAndProperties(){
        
        addAllViews()
        setUpHandleImage()
        
    }
    
    func addAllViews(){
        view.backgroundColor = .white
        
        view.addSubview(handleImage)
        view.addSubview(collection_view)
        
        handleImage.topAnchor.constraint(equalTo: view.topAnchor, constant: 0).isActive = true
        handleImage.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        
        collection_view.topAnchor.constraint(equalTo: handleImage.bottomAnchor, constant: 20).isActive = true
        collection_view.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20).isActive = true
        collection_view.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20).isActive = true
        collection_view.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: -10).isActive = true
        
    }
    
    
    func setUpHandleImage(){
        
        handleImage.translatesAutoresizingMaskIntoConstraints = false
        handleImage.setUpImageView(image: FindLocationDetailStringConstants.string.caretdouble)
       
    }
    
}
