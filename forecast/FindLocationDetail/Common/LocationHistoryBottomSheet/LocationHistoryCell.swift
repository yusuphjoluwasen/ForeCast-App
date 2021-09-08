//
//  LocationHistoryCell.swift
//  forecast
//
//  Created by Guru on 04/09/2021.
//  Copyright © 2021 SHAPE A/S. All rights reserved.
//

import UIKit

class LocationHistoryCell:UICollectionViewCell, UIGestureRecognizerDelegate{
    var pan: UIPanGestureRecognizer?
    
    var deleteLabel1: UILabel!
    var deleteLabel2: UILabel!
    
    
    lazy var locationLabel: UILabel = {
        let header = UILabel()
        header.translatesAutoresizingMaskIntoConstraints = false
        header.setUpGenLabel(text: "London", textColor: .foreCastPurpleBlue, font: .systemFont(ofSize: 16))
        return header
    }()
    
    lazy var dateLabel: UILabel = {
        let header = UILabel()
        header.translatesAutoresizingMaskIntoConstraints = false
        header.setUpGenLabel(text: "02 Sept 21", textColor: .foreCastColorGray2, font: .systemFont(ofSize: 12))
        return header
    }()
    
    lazy var descLabel: UILabel = {
        let header = UILabel()
        header.translatesAutoresizingMaskIntoConstraints = false
        header.setUpGenLabel(text: "Clear Sky", textColor: .foreCastColorGray2, font: .systemFont(ofSize: 12, weight: .regular))
        return header
    }()
    
    lazy var tempLabel: UILabel = {
        let header = UILabel()
        header.translatesAutoresizingMaskIntoConstraints = false
        header.setUpGenLabel(text: "39.5\u{00B0}", textColor: .foreCastPurpleBlue, font: .systemFont(ofSize: 18, weight: .bold))
        return header
    }()
    
    lazy var descImage: ImageLoader = {
        let header = ImageLoader()
        header.translatesAutoresizingMaskIntoConstraints = false
        header.setUpImageView(image: "weather_imagee", contentMode: .scaleToFill)
        return header
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        contentView.addSubview(locationLabel)
        contentView.addSubview(dateLabel)
        contentView.addSubview(descLabel)
        contentView.addSubview(descImage)
        contentView.addSubview(tempLabel)
        
        self.contentView.backgroundColor = UIColor.white
        self.backgroundColor = UIColor.foreCastPurpleBlue
        setUpConstraintAndProperties()
        
        pan = UIPanGestureRecognizer(target: self, action: #selector(onPan))
        pan?.delegate = self
        self.addGestureRecognizer(pan!)
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        
        if (pan?.state == UIGestureRecognizer.State.changed) {
            let p: CGPoint = (pan?.translation(in: self))!
            let width = self.contentView.frame.width
            let height = self.contentView.frame.height
            self.contentView.frame = CGRect(x: p.x,y: 0, width: width, height: height);
            self.deleteLabel1.frame = CGRect(x: p.x - deleteLabel1.frame.size.width-10, y: 0, width: 100, height: height)
            self.deleteLabel2.frame = CGRect(x: p.x + width + deleteLabel2.frame.size.width, y: 0, width: 100, height: height)
        }
        
    }
   
    
    func setUpConstraintAndProperties(){
      
        locationLabel.topAnchor.constraint(equalTo: topAnchor, constant: 0).isActive = true
        locationLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 0).isActive = true
        
        dateLabel.topAnchor.constraint(equalTo: locationLabel.bottomAnchor, constant: 2).isActive = true
        dateLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 0).isActive = true
        
        tempLabel.centerYAnchor.constraint(equalTo: descImage.centerYAnchor).isActive = true
        tempLabel.trailingAnchor.constraint(equalTo: trailingAnchor, constant: 0).isActive = true
        
        descLabel.topAnchor.constraint(equalTo: locationLabel.bottomAnchor, constant: -8).isActive = true
        descLabel.centerXAnchor.constraint(equalTo: centerXAnchor, constant: 20).isActive = true
        
        descImage.centerYAnchor.constraint(equalTo: descLabel.centerYAnchor).isActive = true
        descImage.trailingAnchor.constraint(equalTo: descLabel.leadingAnchor, constant: -5).isActive = true
        descImage.heightAnchor.constraint(equalToConstant: 30).isActive = true
        descImage.widthAnchor.constraint(equalToConstant: 30).isActive = true
        
        deleteLabel1 = UILabel()
        deleteLabel1.text = "delete"
        deleteLabel1.textColor = UIColor.white
        self.insertSubview(deleteLabel1, belowSubview: self.contentView)
        
        deleteLabel2 = UILabel()
        deleteLabel2.text = "delete"
        deleteLabel2.textColor = UIColor.white
        self.insertSubview(deleteLabel2, belowSubview: self.contentView)
        
    }
    
    @objc func onPan(_ pan: UIPanGestureRecognizer) {
        if pan.state == UIGestureRecognizer.State.began {
            
        } else if pan.state == UIGestureRecognizer.State.changed {
            self.setNeedsLayout()
        } else {
            if abs(pan.velocity(in: self).x) > 500 {
                let collectionView: UICollectionView = self.superview as! UICollectionView
                let indexPath: IndexPath = collectionView.indexPathForItem(at: self.center)!
                collectionView.delegate?.collectionView!(collectionView, performAction: #selector(onPan(_:)), forItemAt: indexPath, withSender: nil)
            } else {
                UIView.animate(withDuration: 0.2, animations: {
                    self.setNeedsLayout()
                    self.layoutIfNeeded()
                })
            }
        }
    }
    
    func gestureRecognizer(_ gestureRecognizer: UIGestureRecognizer, shouldRecognizeSimultaneouslyWith otherGestureRecognizer: UIGestureRecognizer) -> Bool {
        return true
    }
    
    override func gestureRecognizerShouldBegin(_ gestureRecognizer: UIGestureRecognizer) -> Bool {
        return abs((pan?.velocity(in: pan?.view))!.x) > abs((pan?.velocity(in: pan?.view))!.y)
    }
    
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
