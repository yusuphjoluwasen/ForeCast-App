//
//  LocationHistoryDetailCell.swift
//  forecast
//
//  Created by Guru on 10/09/2021.
//  Copyright © 2021 SHAPE A/S. All rights reserved.
//

import Foundation
import UIKit

class LocationHistoryDetailCell:UICollectionViewCell{
    
    var infos : LocationConditionObj? {
        didSet{
            guard
                let image = infos?.image,
                let text = infos?.text,
                let label = infos?.label
            
            else{
                
                return
            }
            
            locLabel.text = label
            locText.text = text
            locImage.setUpImageView(image: image)
        }
    }
    
    lazy var locView: UIView = {
        let locView = UIView()
        locView.translatesAutoresizingMaskIntoConstraints = false
        locView.backgroundColor = .foreCastTranWhite
        locView.layer.cornerRadius = 15
        return locView
    }()
    
    lazy var locImage: UIImageView = {
        let locImage = UIImageView()
        locImage.translatesAutoresizingMaskIntoConstraints = false
        locImage.setUpImageView(image: LocationHistoryStringConstants.string.heartbeat)
        return locImage
    }()
    
    lazy var locText: UILabel = {
        let locText = UILabel()
        locText.translatesAutoresizingMaskIntoConstraints = false
        locText.setUpGenLabel(text: LocationHistoryStringConstants.string.pressure, textColor: .foreCastWhiteBlack, font: .systemFont(ofSize: 12))
        return locText
    }()
    
    lazy var locLabel: UILabel = {
        let locLabel = UILabel()
        locLabel.translatesAutoresizingMaskIntoConstraints = false
        locLabel.setUpGenLabel(text: LocationHistoryStringConstants.string.humidity.capitalized, textColor: .foreCastWhiteBlack, font: .systemFont(ofSize: 12))
        return locLabel
    }()
    
    override init(frame:CGRect) {
        super.init(frame: frame)
        
        addSubview(locView)
        locView.addSubview(locImage)
        locView.addSubview(locText)
        locView.addSubview(locLabel)
        
        backgroundColor = .clear
        setUpConstraintAndProperties()
    }
    
    
    func setUpConstraintAndProperties(){
        
        locView.topAnchor.constraint(equalTo: topAnchor, constant: 20).isActive = true
        locView.centerXAnchor.constraint(equalTo: centerXAnchor).isActive = true
        locView.widthAnchor.constraint(equalToConstant: 105).isActive = true
        locView.heightAnchor.constraint(equalToConstant: 133).isActive = true
        
        locImage.topAnchor.constraint(equalTo: locView.topAnchor, constant: 20).isActive = true
        locImage.centerXAnchor.constraint(equalTo: locView.centerXAnchor).isActive = true
        
        locText.topAnchor.constraint(equalTo: locImage.bottomAnchor, constant: 2).isActive = true
        locText.centerXAnchor.constraint(equalTo: locView.centerXAnchor).isActive = true
        
        locLabel.topAnchor.constraint(equalTo: locText.bottomAnchor, constant: 20).isActive = true
        locLabel.centerXAnchor.constraint(equalTo: locText.centerXAnchor).isActive = true
        
    }
    
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
