//
//  FindLocation+CLLocation.swift
//  forecast
//
//  Created by Guru on 08/09/2021.
//  Copyright © 2021 SHAPE A/S. All rights reserved.
//

import Foundation
import MapKit

extension FindLocationViewController:CLLocationManagerDelegate{
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        
        if let location = locations.first {
            let span = MKCoordinateSpan(latitudeDelta: 0.05, longitudeDelta: 0.05)
            let region = MKCoordinateRegion(center: location.coordinate, span: span)
            mapView.setRegion(region, animated: true)
        }
    }
    
    func locationManager(_ manager: CLLocationManager, didFailWithError error: Error) {
        print("locationManagerFailed: \( error.localizedDescription)")
    }
}
