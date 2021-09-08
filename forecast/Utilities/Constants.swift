//
//  Constants.swift
//  forecast
//
//  Created by Guru on 01/09/2021.
//  Copyright © 2021 SHAPE A/S. All rights reserved.
//

import Foundation
import UIKit
import MapKit

struct Constants {
    static let string = Constants()
    let apiKey = "5429b6a8bee19bb06bb4ef54409fe206"
    let detailbg = "locationdetailscreen"
    let mappin = "mappin"
    let tempimage = "weather_imagee"
    let swipeImage = "swipehistory"
    let historyCellIdentifier = "historyCellIdentifier"
    let locationTableCellIdentifier = "locationTableCellIdentifier"
}


func convertPointToLocation(cgpoint:CGPoint, mapView:MKMapView) -> CLLocationCoordinate2D{
    return  mapView.convert(cgpoint, toCoordinateFrom: mapView)

}

func rotate3(imageView: UIImageView) {
    
    let animation = CAKeyframeAnimation(keyPath: "transform.rotation.z")
    animation.duration = 2
    animation.fillMode = CAMediaTimingFillMode.forwards
    animation.repeatCount = .infinity
    animation.values = [0, Double.pi/2, Double.pi, Double.pi*3/2, Double.pi*2]
    //Percentage of each key frame
    animation.keyTimes = [NSNumber(value: 0.0), NSNumber(value: 0.1),
                          NSNumber(value: 0.3), NSNumber(value: 0.8), NSNumber(value: 1.0)]
    
    imageView.layer.add(animation, forKey: "rotate")
}
