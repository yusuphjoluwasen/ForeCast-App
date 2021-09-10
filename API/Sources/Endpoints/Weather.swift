//
//  Weather.swift
//  API
//
//  Created by Jakob Vinther-Larsen on 19/02/2019.
//  Copyright © 2019 SHAPE A/S. All rights reserved.
//

import Entities
import Client
import MapKit

extension CurrentWeather {
    public static func getCurrent(for query: String) -> Request<CurrentWeather, APIError> {
        return Request(
            url: URL(string: WebConstants.string.weatherendpoint)!,
            method: .get,
            parameters: [QueryParameters([URLQueryItem(name: "q", value: query)])],
            resource: decodeResource(CurrentWeather.self),
            error: APIError.init,
            needsAuthorization: true
        )
    }
    
    public static func getCurrentByCoordinates(for query: CLLocationCoordinate2D) -> Request<CurrentWeather, APIError> {
        return Request(
            url: URL(string: WebConstants.string.weatherendpoint)!,
            method: .get,
            parameters: [QueryParameters([URLQueryItem(name: WebConstants.string.lat, value: String(query.latitude)), URLQueryItem(name: WebConstants.string.long, value: String(query.longitude))])],
            resource: decodeResource(CurrentWeather.self),
            error: APIError.init,
            needsAuthorization: true
        )
    }
}
