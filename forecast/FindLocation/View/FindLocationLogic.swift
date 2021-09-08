//
//  FindLocationLogic.swift
//  forecast
//
//  Created by Guru on 08/09/2021.
//  Copyright © 2021 SHAPE A/S. All rights reserved.
//

import Foundation
import MapKit

extension FindLocationViewController{
    
    func clickMapToFetchLocation(){
        
        let gesture = UITapGestureRecognizer(target: self, action: #selector(findLocation(_:)))
        mapView.addGestureRecognizer(gesture)
    }
    
    
    @objc private func findLocation(_ gesture: UITapGestureRecognizer) {
        
        let point = gesture.location(in: mapView)
        let location = convertPointToLocation(cgpoint: point, mapView: mapView)
        //Talk to Presenter
        presenter?.locationSelected(at: location)
        
    }
    
    func setUpSearchBar(){
        isOpen = false
        navigationController?.isNavigationBarHidden = false
        let locationSearchTable = LocationSearchTable()
        resultSearchController = UISearchController(searchResultsController: locationSearchTable)
        resultSearchController?.searchResultsUpdater = locationSearchTable
        let searchBar = resultSearchController?.searchBar
        searchBar?.sizeToFit()
        searchBar?.placeholder = "Search for places"
        navigationItem.titleView = resultSearchController?.searchBar
        navigationItem.searchController = resultSearchController
        navigationItem.hidesSearchBarWhenScrolling = true
        resultSearchController?.obscuresBackgroundDuringPresentation  = true
        searchBar?.clipsToBounds = true
        definesPresentationContext = true
        
        locationSearchTable.mapView = mapView
        locationSearchTable.handleMapSearchDelegate = self
    }
    
    func setUpLocations(){
        locationManager.delegate = self
        locationManager.desiredAccuracy = kCLLocationAccuracyBest
        locationManager.requestWhenInUseAuthorization()
        locationManager.requestAlwaysAuthorization()
        locationManager.requestLocation()
    }
    
    func clickOnSearchNewLocation(){
        
        let gestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(didSelectButton))
        chooseLocationBtn.addGestureRecognizer(gestureRecognizer)
    }
    
    @objc private func didSelectButton() {
        
        setUpSearchBar()
    }
}
