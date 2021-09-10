//
//  LocationHistoryDetailViewController.swift
//  forecast
//
//  Created by Guru on 04/09/2021.
//  Copyright © 2021 SHAPE A/S. All rights reserved.
//


import UIKit
import Entities

class LocationHistoryDetailViewController:UIViewController{
    
    lazy var backgroundImage = UIImageView()
    lazy var locationNameView = LocationNameView()
    lazy var locationConditionView = LocationConditionView()
    
    lazy var locationCoordinateView = LocationCoordinateView()
    lazy var locWeatherDescImage = ImageLoader()
    
    lazy var collection_view : UICollectionView = {
        let flowLayout = UICollectionViewFlowLayout()
        flowLayout.minimumLineSpacing = 10
        flowLayout.minimumInteritemSpacing = 10
        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: flowLayout)
        collectionView.showsVerticalScrollIndicator = false
        collectionView.delegate = self
        collectionView.dataSource = self
        collectionView.backgroundColor = .clear
        collectionView.isScrollEnabled = true
        collectionView.translatesAutoresizingMaskIntoConstraints = false
        collectionView.register(LocationHistoryDetailCell.self, forCellWithReuseIdentifier: LocationHistoryStringConstants.string.locationhistorycell)
        return collectionView
    }()
    
    var locationDetails:WeatherObj?{
        didSet{
        }
    }
    
    var locationConditionData:[LocationConditionObj]?{
        didSet{
            
            collection_view.reloadData()
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setUpConstraintsAndProperties()
        setupNavSettings()
        
        updateItems(weather:locationDetails)
        
        
    }
    
    override func viewWillAppear(_ animated: Bool) {
        navigationController?.isNavigationBarHidden = false
    }

    
}




