//
//  LocationConditionClass.swift
//  forecast
//
//  Created by Guru on 10/09/2021.
//  Copyright © 2021 SHAPE A/S. All rights reserved.
//

import Foundation
import UIKit

public class LocationNameView: UIView {
    lazy var locNameUIView = UIView()
    lazy var locNameIcon = UIImageView()
}

public class LocationConditionView: UIView {
    lazy var locText = UILabel()
    lazy var locTempText = UILabel()
    lazy var locWeatherDescText = UILabel()
}


public class LocationCoordinateView: UIView {
    lazy var latText = UILabel()
    lazy var longText = UILabel()
    
}

