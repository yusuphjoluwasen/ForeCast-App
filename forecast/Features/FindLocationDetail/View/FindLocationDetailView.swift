//
//  FindLocationDetailView.swift
//  forecast
//
//  Created by Guru on 02/09/2021.
//  Copyright © 2021 SHAPE A/S. All rights reserved.
//

import UIKit

extension FindLocationDetailViewController {
    
    func setUpConstraintsAndProperties(){
        
        addAllViews()
        setUpBackgroundImage()
        setUpLocUIView()
        setUpLocNameLabel()
        setUpLocNameImage()
        setUpLocTempText()
        setUpLocTempImage()
        setUpLocWeatherDesc()
        setUpSwipeUpImage()
        setUpLatText()
        setUpLongText()
    }
    
    func addAllViews(){
        
        view.backgroundColor = .yellow
        
        view.addSubview(backgroundImage)
        view.addSubview(locationCoordinateView.latText)
        view.addSubview(locationCoordinateView.longText)
        view.addSubview(locationNameView.locNameUIView)
        view.addSubview(locationNameView.locNameIcon)
        view.addSubview(locationConditionView.locText)
        view.addSubview(locationConditionView.locTempText)
        view.addSubview(locWeatherDescImage)
        view.addSubview(locationConditionView.locWeatherDescText)
        view.addSubview(collection_view)
        view.addSubview(swipeUpImage)
        
        backgroundImage.topAnchor.constraint(equalTo: view.topAnchor, constant: 0).isActive = true
        backgroundImage.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: 0).isActive = true
        backgroundImage.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 0).isActive = true
        backgroundImage.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: 0).isActive = true
 
        locationCoordinateView.latText.bottomAnchor.constraint(equalTo: locationNameView.locNameUIView.topAnchor, constant: -10).isActive = true
        locationCoordinateView.latText.trailingAnchor.constraint(equalTo: locationNameView.locNameUIView.centerXAnchor, constant: -5).isActive = true

        locationCoordinateView.longText.bottomAnchor.constraint(equalTo: locationNameView.locNameUIView.topAnchor, constant: -10).isActive = true
        locationCoordinateView.longText.leadingAnchor.constraint(equalTo: locationNameView.locNameUIView.centerXAnchor, constant: 5).isActive = true

        locationNameView.locNameUIView.topAnchor.constraint(equalTo: locationConditionView.locText.topAnchor, constant: -10).isActive = true
        locationNameView.locNameUIView.bottomAnchor.constraint(equalTo: locationConditionView.locText.bottomAnchor, constant: 10).isActive = true
        locationNameView.locNameUIView.leadingAnchor.constraint(equalTo: locationNameView.locNameIcon.leadingAnchor, constant: -20).isActive = true
        locationNameView.locNameUIView.trailingAnchor.constraint(equalTo: locationConditionView.locText.trailingAnchor, constant: 20).isActive = true
////
        locationConditionView.locText.topAnchor.constraint(equalTo: view.topAnchor, constant: view.frame.height/6 + 10).isActive = true
        locationConditionView.locText.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true

        locationNameView.locNameIcon.trailingAnchor.constraint(equalTo: locationConditionView.locText.leadingAnchor, constant: -5).isActive = true
        locationNameView.locNameIcon.centerYAnchor.constraint(equalTo: locationConditionView.locText.centerYAnchor).isActive = true

        locationConditionView.locTempText.trailingAnchor.constraint(equalTo: locationNameView.locNameUIView.centerXAnchor, constant: 20).isActive = true
        locationConditionView.locTempText.topAnchor.constraint(equalTo: locationNameView.locNameUIView.bottomAnchor, constant: 10).isActive = true

        locWeatherDescImage.leadingAnchor.constraint(equalTo: locationConditionView.locTempText.trailingAnchor, constant: -10).isActive = true
        locWeatherDescImage.centerYAnchor.constraint(equalTo: locationConditionView.locTempText.centerYAnchor).isActive = true
        locWeatherDescImage.widthAnchor.constraint(equalToConstant: 100).isActive = true

        locationConditionView.locWeatherDescText.topAnchor.constraint(equalTo: locationConditionView.locTempText.bottomAnchor, constant: 1).isActive = true
        locationConditionView.locWeatherDescText.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true

        collection_view.topAnchor.constraint(equalTo: locationConditionView.locWeatherDescText.bottomAnchor, constant: 20).isActive = true
        collection_view.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        collection_view.heightAnchor.constraint(equalToConstant: 330).isActive = true
        collection_view.widthAnchor.constraint(equalToConstant: 250).isActive = true
        
        swipeUpImage.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: -20).isActive = true
        swipeUpImage.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true

    }
    
    func setUpBackgroundImage(){
        backgroundImage.translatesAutoresizingMaskIntoConstraints = false
        backgroundImage.setUpImageView(image: StringConstants.string.detailbg)
    }
    
    func setUpLocUIView(){
        locationNameView.locNameUIView.translatesAutoresizingMaskIntoConstraints = false
        locationNameView.locNameUIView.backgroundColor = .foreCastTranWhite
        locationNameView.locNameUIView.layer.borderWidth = 0.9
        locationNameView.locNameUIView.layer.borderColor = UIColor.foreCastTranWhite.cgColor
        locationNameView.locNameUIView.layer.cornerRadius = 15
    }
    
    func setUpLocNameLabel(){
        locationConditionView.locText.translatesAutoresizingMaskIntoConstraints = false
        locationConditionView.locText.setUpGenLabel(text: "Lagos", textColor: .white, font: .systemFont(ofSize: 14))
    }
    
    func setUpLocNameImage(){
        locationNameView.locNameIcon.translatesAutoresizingMaskIntoConstraints = false
        locationNameView.locNameIcon.setUpImageView(image: LocationHistoryStringConstants.string.mappin)
    }
    
    func setUpLocTempText(){
        locationConditionView.locTempText.translatesAutoresizingMaskIntoConstraints = false
        locationConditionView.locTempText.setUpGenLabel(text: "", textColor: .foreCastWhiteBlack, font: .boldSystemFont(ofSize: 60))
    }
    
    func setUpLocTempImage(){
        locWeatherDescImage.translatesAutoresizingMaskIntoConstraints = false
        locWeatherDescImage.setUpImageView(image: LocationHistoryStringConstants.string.tempimage, contentMode: .scaleToFill)
        
    }
    
    func setUpLocWeatherDesc(){
        locationConditionView.locWeatherDescText.translatesAutoresizingMaskIntoConstraints = false
        locationConditionView.locWeatherDescText.setUpGenLabel(text: "", textColor: .foreCastColorGray, font: .systemFont(ofSize: 15, weight: .regular))

    }
    
    func setUpLatText(){
        locationCoordinateView.latText.translatesAutoresizingMaskIntoConstraints = false
        locationCoordinateView.latText.setUpGenLabel(text: "", textColor: .foreCastWhiteBlack, font: .systemFont(ofSize: 12))
    }
    
    func setUpLongText(){
        locationCoordinateView.longText.translatesAutoresizingMaskIntoConstraints = false
        locationCoordinateView.longText.setUpGenLabel(text: "", textColor: .foreCastWhiteBlack, font: .systemFont(ofSize: 12))
    }
    
    func setUpSwipeUpImage(){
        swipeUpImage.translatesAutoresizingMaskIntoConstraints = false
        swipeUpImage.setUpImageView(image: StringConstants.string.swipeImage)
        swipeUpImage.isUserInteractionEnabled = true
        let origin:CGPoint = CGPoint(x: swipeUpImage.center.x, y: view.frame.height - 80)
        let target:CGPoint = CGPoint(x: swipeUpImage.center.x, y: view.frame.height - 50)
        let bounce = CABasicAnimation(keyPath: "position.y")
        bounce.duration = 1.2
        bounce.fromValue = origin.y
        bounce.toValue = target.y
        bounce.repeatCount = .greatestFiniteMagnitude
        bounce.autoreverses = true
        self.swipeUpImage.layer.add(bounce, forKey: "position")
    }
    
    
    
 

}



