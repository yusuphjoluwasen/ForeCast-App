//
//  FindLocationView.swift
//  forecast
//
//  Created by Guru on 04/09/2021.
//  Copyright © 2021 SHAPE A/S. All rights reserved.
//

import Foundation
extension FindLocationViewController{
    
    func setUpConstraintsAndProperties(){
        
        addAllViews()
        setUpLocationBtn()
        
    }
    
    func addAllViews(){
        
        view.addSubview(mapView)
        view.addSubview(chooseLocationBtn)
        
        mapView.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            mapView.topAnchor.constraint(equalTo: view.topAnchor),
            mapView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            mapView.bottomAnchor.constraint(equalTo: view.bottomAnchor),
            mapView.trailingAnchor.constraint(equalTo: view.trailingAnchor)
        ])
        
        NSLayoutConstraint.activate([
            chooseLocationBtn.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: -5),
            chooseLocationBtn.trailingAnchor.constraint(equalTo: view.trailingAnchor)
        ])
     
    }
    
    
    func setUpLocationBtn(){
        
        chooseLocationBtn.contentMode = .scaleAspectFill
        let buttonImage = UIImage(named: "locationchoosebtn")
        chooseLocationBtn.setImage(buttonImage, for: .normal)
        chooseLocationBtn.translatesAutoresizingMaskIntoConstraints = false
    }
    
}
