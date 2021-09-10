//
//  FailureLauncherView.swift
//  forecast
//
//  Created by Guru on 02/09/2021.
//  Copyright © 2021 SHAPE A/S. All rights reserved.
//

import UIKit


class FailureLauncherView:UIView,UIViewDialogProtocol{
    
        var errorText = "Something went wrong"{
            didSet{
                infoLabel.text = errorText.capitalized
            }
        }
    
    var onItemClickSelected: (() -> ())?
  
    
    let roundView:UIView = {
        let view = UIView()
        view.layer.cornerRadius = 31.5
        view.backgroundColor = .lightOrange
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    let headerImage:UIImageView = {
        let image = UIImageView()
        image.image = UIImage(named: "error_icon")
        image.contentMode = .scaleAspectFill
        image.translatesAutoresizingMaskIntoConstraints = false
        return image
    }()
    
    
    let infoLabel: UILabel = {
        let step_one_text = UILabel()
        step_one_text.text = "TRANSACTION FAILED"
        step_one_text.font = .boldSystemFont(ofSize: 15)
        step_one_text.textColor = .foreCastBlue
        step_one_text.textAlignment = .center
        step_one_text.sizeToFit()
        step_one_text.translatesAutoresizingMaskIntoConstraints = false
        step_one_text.numberOfLines = 3
        return step_one_text
    }()
    
    let infoButton:UIButton = {
        let OAEnterPin = UIButton()
        OAEnterPin.backgroundColor = .foreCastBlue
        OAEnterPin.titleLabel?.font = .systemFont(ofSize: 15)
        OAEnterPin.setTitle("CLOSE", for: .normal)
        OAEnterPin.setTitleColor(.white, for: .normal)
        OAEnterPin.layer.cornerRadius = 5.0
        OAEnterPin.translatesAutoresizingMaskIntoConstraints = false
        return OAEnterPin
    }()
  
    
    lazy var holderView : UIView = {
        let stepOneWhiteView = UIView()
        stepOneWhiteView.backgroundColor = .white
        stepOneWhiteView.translatesAutoresizingMaskIntoConstraints = false
        stepOneWhiteView.layer.cornerRadius = 20
        
        stepOneWhiteView.addSubview(roundView)
        stepOneWhiteView.addSubview(headerImage)
        stepOneWhiteView.addSubview(infoLabel)
        stepOneWhiteView.addSubview(infoButton)
        
        
        roundView.topAnchor.constraint(equalTo: stepOneWhiteView.topAnchor, constant: 30).isActive = true
        roundView.topAnchor.constraint(equalTo: stepOneWhiteView.topAnchor, constant: 30).isActive = true
        roundView.widthAnchor.constraint(equalToConstant: 63).isActive = true
        roundView.heightAnchor.constraint(equalToConstant: 63).isActive = true
        roundView.centerXAnchor.constraint(equalTo: stepOneWhiteView.centerXAnchor).isActive = true
        
        headerImage.centerXAnchor.constraint(equalTo: roundView.centerXAnchor).isActive = true
        headerImage.centerYAnchor.constraint(equalTo: roundView.centerYAnchor).isActive = true
        
        infoLabel.topAnchor.constraint(equalTo: roundView.bottomAnchor, constant: 15).isActive = true
        infoLabel.leadingAnchor.constraint(equalTo: stepOneWhiteView.leadingAnchor, constant: 20).isActive = true
        infoLabel.trailingAnchor.constraint(equalTo: stepOneWhiteView.trailingAnchor, constant: -20).isActive = true
        
        infoButton.topAnchor.constraint(equalTo: infoLabel.bottomAnchor, constant: 25).isActive = true
        infoButton.centerXAnchor.constraint(equalTo: stepOneWhiteView.centerXAnchor).isActive = true
        infoButton.leadingAnchor.constraint(equalTo: stepOneWhiteView.leadingAnchor, constant: 20).isActive = true
        infoButton.trailingAnchor.constraint(equalTo: stepOneWhiteView.trailingAnchor, constant: -20).isActive = true
        infoButton.heightAnchor.constraint(equalToConstant: 40).isActive = true
        
        return  stepOneWhiteView
    }()
    
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        addSubview(holderView)
        setUpObserver()
        
        holderView.centerXAnchor.constraint(equalTo: centerXAnchor).isActive = true
        holderView.widthAnchor.constraint(equalToConstant: 280).isActive = true
        holderView.heightAnchor.constraint(equalToConstant: 230).isActive = true
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setUpObserver(){
        
        let gesture = UITapGestureRecognizer(target: self, action: #selector(clickOnButton))
        infoButton.addGestureRecognizer(gesture)
    
    }
    
    @objc func clickOnButton(){
        onItemClickSelected!()
    }
    
}

