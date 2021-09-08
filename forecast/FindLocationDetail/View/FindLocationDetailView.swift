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
        setUpStackView1()
        setUpLocMinTemp()
        setUpLocMinText()
        setUpLocMinLabel()
        setUpMinTempImage()
        setUpLocMaxTemp()
        setUpMaxTempImage()
        setUpLocMaxText()
        setUpLocMaxLabel()
        setUpStackView2()
        setUpLocPresureView()
        setUpLocPressureImage()
        setUpLocPressureText()
        setUpLocPressureLabel()
        setUpLocHumidityView()
        setUpLocHumidityImage()
        setUpLocHumidityText()
        setUpLocHumidityLabel()
        setUpSwipeUpImage()
        setUpLatText()
        setUpLongText()
    }
    
    func addAllViews(){
        
        view.backgroundColor = .yellow
        
        view.addSubview(backgroundImage)
        view.addSubview(latText)
        view.addSubview(longText)
        view.addSubview(locNameUIView)
        view.addSubview(locText)
        view.addSubview(locNameIcon)
        view.addSubview(locTempText)
        view.addSubview(locWeatherDescImage)
        view.addSubview(locWeatherDescText)
        view.addSubview(stackView1)
        view.addSubview(locMinTempView)
        view.addSubview(locMinTempImage)
        view.addSubview(locMinTempText)
        view.addSubview(locMinTempLabel)
        view.addSubview(locMaxTempView)
        view.addSubview(locMaxTempImage)
        view.addSubview(locMaxTempText)
        view.addSubview(locMaxTempLabel)
        view.addSubview(stackView2)
        view.addSubview(locPressureView)
        view.addSubview(locPressureImage)
        view.addSubview(locPressureText)
        view.addSubview(locPressureLabel)
        view.addSubview(locHumidityView)
        view.addSubview(locHumidityImage)
        view.addSubview(locHumidityText)
        view.addSubview(locHumidityLabel)
        view.addSubview(swipeUpImage)
        
        backgroundImage.topAnchor.constraint(equalTo: view.topAnchor, constant: 0).isActive = true
        backgroundImage.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: 0).isActive = true
        backgroundImage.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 0).isActive = true
        backgroundImage.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: 0).isActive = true
 
        latText.bottomAnchor.constraint(equalTo: locNameUIView.topAnchor, constant: -10).isActive = true
        latText.trailingAnchor.constraint(equalTo: locNameUIView.centerXAnchor, constant: -5).isActive = true
        
        longText.bottomAnchor.constraint(equalTo: locNameUIView.topAnchor, constant: -10).isActive = true
        longText.leadingAnchor.constraint(equalTo: locNameUIView.centerXAnchor, constant: 5).isActive = true
        
        locNameUIView.topAnchor.constraint(equalTo: locText.topAnchor, constant: -10).isActive = true
        locNameUIView.bottomAnchor.constraint(equalTo: locText.bottomAnchor, constant: 10).isActive = true
        locNameUIView.leadingAnchor.constraint(equalTo: locNameIcon.leadingAnchor, constant: -20).isActive = true
        locNameUIView.trailingAnchor.constraint(equalTo: locText.trailingAnchor, constant: 20).isActive = true
        
        locText.topAnchor.constraint(equalTo: view.topAnchor, constant: view.frame.height/6 + 10).isActive = true
        locText.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        
        locNameIcon.trailingAnchor.constraint(equalTo: locText.leadingAnchor, constant: -5).isActive = true
        locNameIcon.centerYAnchor.constraint(equalTo: locText.centerYAnchor).isActive = true
        
        locTempText.trailingAnchor.constraint(equalTo: locNameUIView.centerXAnchor, constant: 20).isActive = true
        locTempText.topAnchor.constraint(equalTo: locNameUIView.bottomAnchor, constant: 10).isActive = true
        
        locWeatherDescImage.leadingAnchor.constraint(equalTo: locTempText.trailingAnchor, constant: -10).isActive = true
        locWeatherDescImage.centerYAnchor.constraint(equalTo: locTempText.centerYAnchor).isActive = true
        locWeatherDescImage.widthAnchor.constraint(equalToConstant: 100).isActive = true
        locWeatherDescImage.heightAnchor.constraint(equalToConstant: 100).isActive = true

        locWeatherDescText.topAnchor.constraint(equalTo: locTempText.bottomAnchor, constant: 1).isActive = true
        locWeatherDescText.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        
        stackView1.topAnchor.constraint(equalTo: locWeatherDescText.bottomAnchor, constant: 20).isActive = true
        stackView1.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        
        locMinTempView.widthAnchor.constraint(equalToConstant: 105).isActive = true
        locMinTempView.heightAnchor.constraint(equalToConstant: 133).isActive = true
        
        locMinTempImage.topAnchor.constraint(equalTo: locMinTempView.topAnchor, constant: 20).isActive = true
        locMinTempImage.centerXAnchor.constraint(equalTo: locMinTempView.centerXAnchor).isActive = true
        
        locMinTempText.topAnchor.constraint(equalTo: locMinTempImage.bottomAnchor, constant: 2).isActive = true
        locMinTempText.leadingAnchor.constraint(equalTo: locMinTempView.leadingAnchor, constant: 10).isActive = true
        locMinTempText.trailingAnchor.constraint(equalTo: locMinTempView.trailingAnchor, constant: -10).isActive = true
        
        locMinTempLabel.topAnchor.constraint(equalTo: locMinTempText.bottomAnchor, constant: 20).isActive = true
        locMinTempLabel.centerXAnchor.constraint(equalTo: locMinTempText.centerXAnchor).isActive = true
        
        locMaxTempView.widthAnchor.constraint(equalToConstant: 105).isActive = true
        locMaxTempView.heightAnchor.constraint(equalToConstant: 133).isActive = true
        
        locMaxTempImage.topAnchor.constraint(equalTo: locMaxTempView.topAnchor, constant: 20).isActive = true
        locMaxTempImage.centerXAnchor.constraint(equalTo: locMaxTempView.centerXAnchor).isActive = true
        
        locMaxTempText.topAnchor.constraint(equalTo: locMaxTempImage.bottomAnchor, constant: 2).isActive = true
        locMaxTempText.leadingAnchor.constraint(equalTo: locMaxTempView.leadingAnchor, constant: 10).isActive = true
        locMaxTempText.trailingAnchor.constraint(equalTo: locMaxTempView.trailingAnchor, constant: -10).isActive = true
        
        locMaxTempLabel.topAnchor.constraint(equalTo: locMaxTempText.bottomAnchor, constant: 20).isActive = true
        locMaxTempLabel.centerXAnchor.constraint(equalTo: locMaxTempText.centerXAnchor).isActive = true
        
        stackView2.topAnchor.constraint(equalTo: stackView1.bottomAnchor, constant: 20).isActive = true
        stackView2.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        
        locPressureView.widthAnchor.constraint(equalToConstant: 105).isActive = true
        locPressureView.heightAnchor.constraint(equalToConstant: 133).isActive = true
        
        locPressureImage.topAnchor.constraint(equalTo: locPressureView.topAnchor, constant: 20).isActive = true
        locPressureImage.centerXAnchor.constraint(equalTo: locPressureView.centerXAnchor).isActive = true
        
        locPressureText.topAnchor.constraint(equalTo: locPressureImage.bottomAnchor, constant: 5).isActive = true
        locPressureText.leadingAnchor.constraint(equalTo: locPressureView.leadingAnchor, constant: 10).isActive = true
        locPressureText.trailingAnchor.constraint(equalTo: locPressureView.trailingAnchor, constant: -10).isActive = true
        
        locPressureLabel.topAnchor.constraint(equalTo: locPressureText.bottomAnchor, constant: 20).isActive = true
        locPressureLabel.centerXAnchor.constraint(equalTo: locPressureText.centerXAnchor).isActive = true
        
        locHumidityView.widthAnchor.constraint(equalToConstant: 105).isActive = true
        locHumidityView.heightAnchor.constraint(equalToConstant: 133).isActive = true
        
        locHumidityImage.topAnchor.constraint(equalTo: locHumidityView.topAnchor, constant: 20).isActive = true
        locHumidityImage.centerXAnchor.constraint(equalTo: locHumidityView.centerXAnchor).isActive = true
        
        locHumidityText.topAnchor.constraint(equalTo: locHumidityImage.bottomAnchor, constant: 2).isActive = true
        locHumidityText.leadingAnchor.constraint(equalTo: locHumidityView.leadingAnchor, constant: 10).isActive = true
        locHumidityText.trailingAnchor.constraint(equalTo: locHumidityView.trailingAnchor, constant: -10).isActive = true
        
        locHumidityLabel.topAnchor.constraint(equalTo: locHumidityText.bottomAnchor, constant: 20).isActive = true
        locHumidityLabel.centerXAnchor.constraint(equalTo: locHumidityText.centerXAnchor).isActive = true
        
        swipeUpImage.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: -20).isActive = true
        swipeUpImage.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true

    }
    
    func setUpBackgroundImage(){
        backgroundImage.translatesAutoresizingMaskIntoConstraints = false
        backgroundImage.setUpImageView(image: Constants.string.detailbg)
    }
    
    func setUpLocUIView(){
        locNameUIView.translatesAutoresizingMaskIntoConstraints = false
        locNameUIView.backgroundColor = .foreCastTranWhite
        locNameUIView.layer.borderWidth = 0.9
        locNameUIView.layer.borderColor = UIColor.foreCastTranWhite.cgColor
        locNameUIView.layer.cornerRadius = 15
    }
    
    func setUpLocNameLabel(){
        locText.translatesAutoresizingMaskIntoConstraints = false
        locText.setUpGenLabel(text: "Lagos", textColor: .white, font: .systemFont(ofSize: 14))
    }
    
    func setUpLocNameImage(){
        locNameIcon.translatesAutoresizingMaskIntoConstraints = false
        locNameIcon.setUpImageView(image: Constants.string.mappin)
    }
    
    func setUpLocTempText(){
        locTempText.translatesAutoresizingMaskIntoConstraints = false
        locTempText.setUpGenLabel(text: "36\u{00B0}", textColor: .foreCastWhiteBlack, font: .boldSystemFont(ofSize: 60))
    }
    
    func setUpLocTempImage(){
        locWeatherDescImage.translatesAutoresizingMaskIntoConstraints = false
        locWeatherDescImage.setUpImageView(image: Constants.string.tempimage, contentMode: .scaleToFill)
        
    }
    
    func setUpLocWeatherDesc(){
        locWeatherDescText.translatesAutoresizingMaskIntoConstraints = false
        locWeatherDescText.setUpGenLabel(text: "Clear Sky", textColor: .foreCastColorGray, font: .systemFont(ofSize: 15, weight: .regular))

    }
    
    func setUpLatText(){
        latText.translatesAutoresizingMaskIntoConstraints = false
        latText.setUpGenLabel(text: "Lat: 5.4567\u{00B0}", textColor: .foreCastWhiteBlack, font: .systemFont(ofSize: 12))
    }
    
    func setUpLongText(){
        longText.translatesAutoresizingMaskIntoConstraints = false
        longText.setUpGenLabel(text: "Long: 5.4567\u{00B0}", textColor: .foreCastWhiteBlack, font: .systemFont(ofSize: 12))
    }
    
    func setUpStackView1(){
        stackView1.translatesAutoresizingMaskIntoConstraints = false
        stackView1.addArrangedSubview(locMinTempView)
        stackView1.addArrangedSubview(locMaxTempView)
        stackView1.axis = .horizontal
        stackView1.distribution = .fillEqually
        stackView1.spacing = 30
    }
    
    func setUpLocMinTemp(){
        locMinTempView.translatesAutoresizingMaskIntoConstraints = false
        locMinTempView.backgroundColor = .foreCastTranWhite
        locMinTempView.layer.cornerRadius = 15
    }
    
    func setUpMinTempImage(){
        locMinTempImage.translatesAutoresizingMaskIntoConstraints = false
        locMinTempImage.setUpImageView(image: "thermometer")
    }
    
    func setUpLocMinText(){
        locMinTempText.translatesAutoresizingMaskIntoConstraints = false
        locMinTempText.setUpGenLabel(text: "39.5\u{00B0}", textColor: .foreCastWhiteBlack, font: .systemFont(ofSize: 18),textAlignment: .center)
    }
    
    func setUpLocMinLabel(){
        locMinTempLabel.translatesAutoresizingMaskIntoConstraints = false
        locMinTempLabel.setUpGenLabel(text: "Min. Temp", textColor: .foreCastWhiteBlack, font: .systemFont(ofSize: 12))
    }
    
    func setUpLocMaxTemp(){
        locMaxTempView.translatesAutoresizingMaskIntoConstraints = false
        locMaxTempView.backgroundColor = .foreCastTranWhite
        locMaxTempView.layer.cornerRadius = 15
    }
    
    func setUpMaxTempImage(){
        locMaxTempImage.translatesAutoresizingMaskIntoConstraints = false
        locMaxTempImage.setUpImageView(image: "thermometer")
    }
    
    func setUpLocMaxText(){
        locMaxTempText.translatesAutoresizingMaskIntoConstraints = false
        locMaxTempText.setUpGenLabel(text: "39.5\u{00B0}", textColor: .foreCastWhiteBlack, font: .systemFont(ofSize: 18),textAlignment: .center)
    }
    
    func setUpLocMaxLabel(){
        locMaxTempLabel.translatesAutoresizingMaskIntoConstraints = false
        locMaxTempLabel.setUpGenLabel(text: "Max. Temp", textColor: .foreCastWhiteBlack, font: .systemFont(ofSize: 12))
    }

    
    func setUpStackView2(){
        stackView2.translatesAutoresizingMaskIntoConstraints = false
        stackView2.addArrangedSubview(locPressureView)
        stackView2.addArrangedSubview(locHumidityView)
        stackView2.axis = .horizontal
        stackView2.distribution = .fillEqually
        stackView2.spacing = 30
    }
    
    func setUpLocPresureView(){
        locPressureView.translatesAutoresizingMaskIntoConstraints = false
        locPressureView.backgroundColor = .foreCastTranWhite
        locPressureView.layer.cornerRadius = 15
    }
    
    func setUpLocPressureImage(){
        locPressureImage.translatesAutoresizingMaskIntoConstraints = false
        locPressureImage.setUpImageView(image: "heartbeat")
    }
    
    func setUpLocPressureText(){
        locPressureText.translatesAutoresizingMaskIntoConstraints = false
        locPressureText.setUpGenLabel(text: "39 Pa", textColor: .foreCastWhiteBlack, font: .systemFont(ofSize: 18),textAlignment: .center)
    }
    
    func setUpLocPressureLabel(){
        locPressureLabel.translatesAutoresizingMaskIntoConstraints = false
        locPressureLabel.setUpGenLabel(text: "Pressure", textColor: .foreCastWhiteBlack, font: .systemFont(ofSize: 12))
    }
    
    func setUpLocHumidityView(){
        locHumidityView.translatesAutoresizingMaskIntoConstraints = false
        locHumidityView.backgroundColor = .foreCastTranWhite
        locHumidityView.layer.cornerRadius = 15
    }
    
    func setUpLocHumidityImage(){
        locHumidityImage.translatesAutoresizingMaskIntoConstraints = false
        locHumidityImage.setUpImageView(image: "humidity")
    }
    
    func setUpLocHumidityText(){
        locHumidityText.translatesAutoresizingMaskIntoConstraints = false
        locHumidityText.setUpGenLabel(text: "39 Pa", textColor: .foreCastWhiteBlack, font: .systemFont(ofSize: 18),textAlignment: .center)
    }
    
    func setUpLocHumidityLabel(){
        locHumidityLabel.translatesAutoresizingMaskIntoConstraints = false
        locHumidityLabel.setUpGenLabel(text: "Humidity", textColor: .foreCastWhiteBlack, font: .systemFont(ofSize: 12))
    }
    
    func setUpSwipeUpImage(){
        swipeUpImage.translatesAutoresizingMaskIntoConstraints = false
        swipeUpImage.setUpImageView(image: Constants.string.swipeImage)
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



