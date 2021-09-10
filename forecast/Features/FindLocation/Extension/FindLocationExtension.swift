//
//  FindLocationExtension.swift
//  forecast
//
//  Created by Guru on 10/09/2021.
//  Copyright © 2021 SHAPE A/S. All rights reserved.
//
import MapKit

//MARK:- ConvertCGPointToCoordinates
func convertPointToLocation(cgpoint:CGPoint, mapView:MKMapView) -> CLLocationCoordinate2D{
    return  mapView.convert(cgpoint, toCoordinateFrom: mapView)

}
