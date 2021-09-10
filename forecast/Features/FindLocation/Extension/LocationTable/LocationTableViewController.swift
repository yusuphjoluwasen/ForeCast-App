//
//  LocationTableViewController.swift
//  forecast
//
//  Created by Guru on 04/09/2021.
//  Copyright © 2021 SHAPE A/S. All rights reserved.
//

import Foundation
import MapKit
import UIKit

protocol HandleMapSearch {
    func dropPinZoomIn(placemark:MKPlacemark)
}

class LocationSearchTable : UITableViewController {
    
    var matchingItems:[MKMapItem] = []
    var mapView: MKMapView? = nil
    var handleMapSearchDelegate:HandleMapSearch? = nil
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = .white
        setupTableView()
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func setupTableView(){
        //Registers a class for use in creating new table cells.
        tableView.register(LocationDataCell.self, forCellReuseIdentifier: FindLocationStringConstants.string.locationTableCellIdentifier)
    }
}

extension LocationSearchTable : UISearchResultsUpdating {

    func updateSearchResults(for searchController: UISearchController) {
        guard let mapView = mapView,
            let searchBarText = searchController.searchBar.text else { return }
        let request = MKLocalSearch.Request()
        request.naturalLanguageQuery = searchBarText
        request.region = mapView.region
        let search = MKLocalSearch(request: request)
        search.start { response, _ in
            guard let response = response else {
                return
            }
            self.matchingItems = response.mapItems
            self.tableView.reloadData()
        }
    }
    
    func updateSearchResultsForSearchController(searchController: UISearchController) {
    }
}

extension LocationSearchTable{
    override func tableView(_ tableView: UITableView?, numberOfRowsInSection section: Int) -> Int {
          return matchingItems.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: FindLocationStringConstants.string.locationTableCellIdentifier, for: indexPath) as? LocationDataCell
        cell?.selectionStyle = .none
        
        let selectedItem = matchingItems[indexPath.row].placemark
        cell?.titleLabel.text = selectedItem.locality
        cell?.subtitleLabel.text = selectedItem.title
        return cell ?? UITableViewCell()
        
    }
    
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
       return 60
    }
    
    override func tableView(_ tableView: UITableView,didSelectRowAt indexPath: IndexPath) {
        let selectedItem = matchingItems[indexPath.row].placemark
        handleMapSearchDelegate?.dropPinZoomIn(placemark: selectedItem)
        dismiss(animated: true, completion: nil)
        
    }
}
