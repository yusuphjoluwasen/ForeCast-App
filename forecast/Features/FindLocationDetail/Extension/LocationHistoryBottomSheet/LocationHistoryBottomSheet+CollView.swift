//
//  LocationHistoryBottomSheet+CollView.swift
//  forecast
//
//  Created by Guru on 04/09/2021.
//  Copyright © 2021 SHAPE A/S. All rights reserved.
//

import UIKit
import Entities

extension LocationHistoryBottomSheetViewController:UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        
        if arrayData.count < 20{
            return arrayData.count
        }else{
            return 20
        }
        
       
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: FindLocationDetailStringConstants.string.historyCellIdentifier, for: indexPath) as? LocationHistoryCell
        
        let item = arrayData[indexPath.item]
        updateCell(cell: cell ?? LocationHistoryCell(), infos: item)
        return cell ?? LocationHistoryCell()
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        
        return CGSize(width: collection_view.frame.width, height: 55)
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        
        let item = arrayData[indexPath.item]
        onItemClicked!(item)
    }
    
     func collectionView(_ collectionView: UICollectionView, performAction action: Selector, forItemAt indexPath: IndexPath, withSender sender: Any?) {
        
       
        let item = arrayData[indexPath.item]
        deleteObjectById(id: item.id)
        arrayData.remove(at: indexPath.row)
        collectionView.deleteItems(at: [indexPath])
        
      }
    
    func updateCell(cell:LocationHistoryCell, infos:WeatherObj){
        
        let name = infos.country
        let date = infos.date ?? 0
        let desc = infos.description
        let temp = ((infos.temp ?? 0) - 273.15).toInt() ?? 0
        let icon = infos.icon
        let urlString = "https://openweathermap.org/img/wn/\(icon ?? "02d")@2x.png"
        cell.locationLabel.text = name?.capitalized
        cell.tempLabel.text = "\(temp)\u{00B0}C"
        cell.dateLabel.text = date.toString().toDouble()?.getDateStringFromUTC()
        cell.descLabel.text = desc?.capitalized
        cell.descImage.loadImageWithUrl(URL(string: urlString)!)
    }

}
