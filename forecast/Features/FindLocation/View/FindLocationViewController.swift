//
//  FindLocationViewController.swift
//  forecast
//
//  Created by Jakob Vinther-Larsen on 19/02/2019.
//  Copyright © 2019 SHAPE A/S. All rights reserved.
//

import UIKit
import MapKit
import Entities
import Client

final class FindLocationViewController: UIViewController {
    
    lazy var mapView: MKMapView = MKMapView(frame: .zero)
    lazy var chooseLocationBtn = UIButton()
    lazy var resultSearchController:UISearchController? = nil
    lazy var locationManager = CLLocationManager()
    lazy var selectedPin:MKPlacemark? = nil
    var isOpen = false
    
    var presenter: FindLocationPresenterInput?
    
    //MARK:- VIEWDIDLOAD
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setUpConstraintsAndProperties()
        clickMapToFetchLocation()
        setUpLocations()
        clickOnSearchNewLocation()
        setupNavSettings()
        
    }
    
    //MARK:- VIEWDIDAPPEAR
    override func viewWillAppear(_ animated: Bool) {
        hideSearchController()
    }
}

extension FindLocationViewController: FindLocationViewControllerInput {
    func hideLoader() {
        DispatchQueue.main.async {
            
            LoadingHandler.load.dismissLauncherLoader()
        }
    }
    
    func showLoader() {
        
        LoadingHandler.load.showLauncherLoader()
    }
    
    func getError(error: String) {
        
        DispatchQueue.main.async {
            
            ErrorHandler.error.showErrorPopUp(errorString: error)
        }
    }
    
    func getWeatherDetails(data: CurrentWeather?) {
        
        DispatchQueue.main.async { [weak self] in
            
            //save weather details
            saveWeatherArrayToUserDefault(weather:data)
            self?.presenter?.moveToFindLocationDetail(data: data)
            dump(data)
            self?.isOpen = true
        }
    }
}

//Drops Cutsom Pin Annotation In the mapView
extension FindLocationViewController: HandleMapSearch {
    func dropPinZoomIn(placemark:MKPlacemark){
        // cache the pin
        selectedPin = placemark
        // clear existing pins
        mapView.removeAnnotations(mapView.annotations)
        let annotation = MKPointAnnotation()
        annotation.coordinate = placemark.coordinate
        annotation.title = placemark.name
        if let city = placemark.locality,
           let state = placemark.administrativeArea {
            annotation.subtitle = "\(city) \(state)"
        }
        mapView.addAnnotation(annotation)
        let span = MKCoordinateSpan(latitudeDelta: 0.05, longitudeDelta: 0.05)
        let region = MKCoordinateRegion(center: placemark.coordinate, span: span)
        mapView.setRegion(region, animated: true)
        
        resultSearchController = nil
        navigationItem.searchController?.isActive = false
        navigationItem.searchController = nil
        
    }
}















