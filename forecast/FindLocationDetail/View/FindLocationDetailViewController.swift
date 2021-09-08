//
//  FindLocationDetailViewController.swift
//  forecast
//
//  Created by Guru on 02/09/2021.
//  Copyright © 2021 SHAPE A/S. All rights reserved.
//

import Foundation
import UIKit
import Entities
import AVFoundation

class FindLocationDetailViewController:BaseViewController{
    
    lazy var backgroundImage = UIImageView()
    lazy var locNameUIView = UIView()
    lazy var locNameIcon = UIImageView()
    lazy var locText = UILabel()
    lazy var locTempText = UILabel()
    lazy var locWeatherDescText = UILabel()
    lazy var locWeatherDescImage = ImageLoader()
    
    lazy var stackView1 = UIStackView()
    lazy var stackView2 = UIStackView()
    
    lazy var locMinTempView = UIView()
    lazy var locMinTempImage = UIImageView()
    lazy var locMinTempText = UILabel()
    lazy var locMinTempLabel = UILabel()
    
    lazy var locMaxTempView = UIView()
    lazy var locMaxTempImage = UIImageView()
    lazy var locMaxTempText = UILabel()
    lazy var locMaxTempLabel = UILabel()
    
    lazy var locPressureView = UIView()
    lazy var locPressureImage = UIImageView()
    lazy var locPressureText = UILabel()
    lazy var locPressureLabel = UILabel()
    
    lazy var locHumidityView = UIView()
    lazy var locHumidityImage = UIImageView()
    lazy var locHumidityText = UILabel()
    lazy var locHumidityLabel = UILabel()
    
    lazy var swipeUpImage = UIImageView()
    lazy var latText = UILabel()
    lazy var longText = UILabel()
    let systemSoundID: SystemSoundID = 1016
    
    var locationDetails:CurrentWeather?
    var presenter: FindLocationDetailPresenterInput?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setUpConstraintsAndProperties()
        swipeView()
        
        updateItems(weather:locationDetails)
        
        locWeatherDescImage.transform = CGAffineTransform(scaleX: 0.5, y: 0.5)
       
        AudioServicesPlaySystemSound(systemSoundID)
        
        UIView.animate(withDuration: 3.0,
                       delay: 0,
          usingSpringWithDamping: 0.2,
          initialSpringVelocity: 6.0,
          options: [.repeat, .autoreverse],
          animations: { [weak self] in
            self?.locWeatherDescImage.transform = .identity
            
          },
          completion: nil)
        
            
    }
    
    override func viewWillAppear(_ animated: Bool) {
        navigationController?.isNavigationBarHidden = false
    }
    
    func swipeView(){
        // Initialize Swipe Gesture Recognizer
        let swipeGestureRecognizerDown = UISwipeGestureRecognizer(target: self, action: #selector(didSwipe))
        
        // Configure Swipe Gesture Recognizer
        swipeGestureRecognizerDown.direction = .up
        
        // Add Swipe Gesture Recognizer
        swipeUpImage.addGestureRecognizer(swipeGestureRecognizerDown)
    }
    
    @objc private func didSwipe() {
        presenter?.openHistoryBottomSheet()
    }
    
    func updateItems(weather:CurrentWeather?){
        let temp = ((weather?.main?.temp ?? 0) - 273.15).toInt() ?? 0
        let mintemp = ((weather?.main?.tempMin ?? 0) - 273.15).toInt() ?? 0
        let maxtemp = ((weather?.main?.tempMax ?? 0) - 273.15).toInt() ?? 0
        let pressure = weather?.main?.pressure ?? 0
        let humidity = weather?.main?.humidity ?? 0
        let lat = "Lat: \(weather?.coord?.lat?.toString() ?? "Lat: 0.0")\u{00B0}"
        let long = "Long: \(weather?.coord?.lon?.toString() ?? "Long: 0.0")\u{00B0}"
        let image = weather?.weather?.first?.icon ?? "02d"
        let urlString = "https://openweathermap.org/img/wn/\(image)@2x.png"
        let desc = weather?.weather?.first?.description?.capitalized ?? ""
        
        locTempText.text = "\(temp)\u{00B0}"
        locMinTempText.text = "\(mintemp)\u{00B0}C"
        locMaxTempText.text = "\(maxtemp)\u{00B0}C"
        locPressureText.text = "\(pressure) Pa"
        locHumidityText.text = "\(humidity) g/m3"
        locText.text = weather?.name?.capitalized
        locWeatherDescText.text = desc
        latText.text = lat
        longText.text = long
        locWeatherDescImage.loadImageWithUrl(URL(string: urlString)!)
        testingLocalNotification(desc: desc)
    }
    
}


extension FindLocationDetailViewController:FindLocationDetailViewControllerInput{
    
}
