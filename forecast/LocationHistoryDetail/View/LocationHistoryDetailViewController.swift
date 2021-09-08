//
//  LocationHistoryDetailViewController.swift
//  forecast
//
//  Created by Guru on 04/09/2021.
//  Copyright © 2021 SHAPE A/S. All rights reserved.
//


import UIKit
import Entities

class LocationHistoryDetailViewController:BaseViewController{
    
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

    lazy var latText = UILabel()
    lazy var longText = UILabel()

    var locationDetails:WeatherObj?{
        didSet{
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setUpConstraintsAndProperties()
        
        updateItems(weather:locationDetails)
        
        
    }
    
    override func viewWillAppear(_ animated: Bool) {
        navigationController?.isNavigationBarHidden = false
    }
    
    func updateItems(weather:WeatherObj?){
        let temp = ((weather?.temp ?? 0) - 273.15).toInt() ?? 0
        let mintemp = ((weather?.minTemp ?? 0) - 273.15).toInt() ?? 0
        let maxtemp = ((weather?.maxTemp ?? 0) - 273.15).toInt() ?? 0
        let pressure = weather?.pressure ?? 0
        let humidity = weather?.humidity ?? 0
        let lat = "Lat: \(weather?.lat?.toString() ?? "Lat: 0.0")\u{00B0}"
        let long = "Long: \(weather?.lon?.toString() ?? "Long: 0.0")\u{00B0}"
        let image = weather?.icon ?? "02d"
        let urlString = "https://openweathermap.org/img/wn/\(image)@2x.png"
        
        locTempText.text = "\(temp)\u{00B0}"
        locMinTempText.text = "\(mintemp)\u{00B0}C"
        locMaxTempText.text = "\(maxtemp)\u{00B0}C"
        locPressureText.text = "\(pressure) Pa"
        locHumidityText.text = "\(humidity) g/m3"
        locText.text = weather?.country?.capitalized
        locWeatherDescText.text = weather?.description?.capitalized
        latText.text = lat
        longText.text = long
        locWeatherDescImage.loadImageWithUrl(URL(string: urlString)!)
    }
    
}
