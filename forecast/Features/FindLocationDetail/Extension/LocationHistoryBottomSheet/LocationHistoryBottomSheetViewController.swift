//
//  LocationHistoryBottomSheetViewController.swift
//  forecast
//
//  Created by Guru on 03/09/2021.
//  Copyright © 2021 SHAPE A/S. All rights reserved.
//

import UIKit
import Entities

class LocationHistoryBottomSheetViewController:UIViewController{
    
    let handleImage = UIImageView()
    
    var onItemClicked: ((WeatherObj) -> ())?
    
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
        collectionView.register(LocationHistoryCell.self, forCellWithReuseIdentifier: FindLocationDetailStringConstants.string.historyCellIdentifier)
        return collectionView
    }()
    
    var arrayData = getArrayFromUserDefault().sorted(by: { $0.id > $1.id })
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setUpConstraintsAndProperties()
        
    }
}

