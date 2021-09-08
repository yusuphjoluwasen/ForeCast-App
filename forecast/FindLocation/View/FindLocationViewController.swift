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

final class FindLocationViewController: BaseViewController {
    
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
        
    }
    
    //MARK:- VIEWDIDAPPEAR
    override func viewWillAppear(_ animated: Bool) {
        resultSearchController = nil
        navigationItem.searchController?.isActive = false
        navigationController?.navigationItem.searchController = nil
        if isOpen == true{
            navigationController?.isNavigationBarHidden = true
        }
    }
}

extension FindLocationViewController: FindLocationViewControllerInput {
    func hideLoader() {
        DispatchQueue.main.sync {
            
            dismissLauncherLoader()
        }
    }
    
    func showLoader() {
        
        showLauncherLoader()
    }
    
    func getError(error: String) {
        
        DispatchQueue.main.sync {
            
            showErrorPopUp(errorString: error)
        }
    }
    
    func getWeatherDetails(data: CurrentWeather?) {
        
        DispatchQueue.main.sync {
            
            //save weather details
            saveWeatherArrayToUserDefault(weather:data)
            presenter?.moveToFindLocationDetail(data: data)
            dump(data)
            isOpen = true
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















