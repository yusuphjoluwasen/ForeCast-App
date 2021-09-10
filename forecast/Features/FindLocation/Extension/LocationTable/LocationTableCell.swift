
//
//  LocationTableCell.swift
//  forecast
//
//  Created by Guru on 04/09/2021.
//  Copyright © 2021 SHAPE A/S. All rights reserved.
//

import UIKit

class LocationDataCell:UITableViewCell{

    lazy var titleLabel: UILabel = {
        let header = UILabel()
        header.translatesAutoresizingMaskIntoConstraints = false
        header.setUpGenLabel(text: "", textColor: .foreCastPurpleBlue, font: .systemFont(ofSize: 16))
        return header
    }()
    
    lazy var subtitleLabel: UILabel = {
        let header = UILabel()
        header.translatesAutoresizingMaskIntoConstraints = false
        header.setUpGenLabel(text: "", textColor: .foreCastColorGray2, font: .systemFont(ofSize: 12))
        return header
    }()

    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        addSubview(titleLabel)
        addSubview(subtitleLabel)
        
        backgroundColor = .clear
        setUpConstraintAndProperties()
        
       
    }
    
   
    func setUpConstraintAndProperties(){
        
        titleLabel.topAnchor.constraint(equalTo: topAnchor, constant: 20).isActive = true
        titleLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 20).isActive = true
        
        subtitleLabel.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: 5).isActive = true
        subtitleLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 20).isActive = true
        
        
        
    }
    
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
