//
//  FindLocationDetailViewController.swift
//  forecast
//
//  Created by Guru on 02/09/2021.
//  Copyright © 2021 SHAPE A/S. All rights reserved.
//


import UIKit
import Entities
import AVFoundation

class FindLocationDetailViewController:UIViewController{
    
    lazy var backgroundImage = UIImageView()
    lazy var locationNameView = LocationNameView()
    lazy var locationConditionView = LocationConditionView()
    lazy var locationCoordinateView = LocationCoordinateView()
    
    lazy var locWeatherDescImage = ImageLoader()
    let swipeUpImage = UIImageView()

    let systemSoundID: SystemSoundID = 1016    
    var locationDetails:CurrentWeather?
    var presenter: FindLocationDetailPresenterInput?
    
    var locationConditionData:[LocationConditionObj]?{
        didSet{
            
            collection_view.reloadData()
        }
    }
    
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
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setUpConstraintsAndProperties()
        swipeView()
        animateAndPlaySound()
        updateItems(weather:locationDetails)
    }
    
    override func viewWillAppear(_ animated: Bool) {
        navigationController?.isNavigationBarHidden = false
    }
    
    func swipeView(){
        // Initialize Swipe Gesture Recognizer
        let swipeGestureRecognizerDown = UISwipeGestureRecognizer(target: self, action: #selector(didSwipe))
        
        // Configure Swipe Gesture Recognizer
        swipeGestureRecognizerDown.direction = .up
        
        // Add Swipe Gesture Recognizer
        swipeUpImage.addGestureRecognizer(swipeGestureRecognizerDown)
    }
    
    func animateAndPlaySound(){
    
        AudioServicesPlaySystemSound(systemSoundID)
        locWeatherDescImage.transform = CGAffineTransform(scaleX: 0.5, y: 0.5)
        UIView.animate(withDuration: 3.0,
                       delay: 0,
          usingSpringWithDamping: 0.2,
          initialSpringVelocity: 6.0,
          options: [.repeat, .autoreverse],
          animations: { [weak self] in
            self?.locWeatherDescImage.transform = .identity
            
          },
          completion: nil)
        
    }
    
    @objc private func didSwipe() {
        presenter?.openHistoryBottomSheet()
    }
    
}


extension FindLocationDetailViewController:FindLocationDetailViewControllerInput{
    
}
