//
//  UIViewExtension.swift
//  forecast
//
//  Created by Guru on 02/09/2021.
//  Copyright © 2021 SHAPE A/S. All rights reserved.
//

import Foundation
import UIKit

protocol UIViewDialogProtocol {
    func show(_ rect: CGRect?)
    func dismiss(_ rect : CGRect?)
    
    
}

extension UIViewDialogProtocol where Self: UIView {
    
    func show (_ rect: CGRect? = nil) {
        if let keyWindow = UIApplication.shared.keyWindow {
            keyWindow.addSubview(self)
            if rect == nil {
                self.frame = keyWindow.frame
            }
            else {
                self.frame = rect!
            }
            self.alpha = 0
            
            UIView.animate(withDuration: 0.5, delay: 0, usingSpringWithDamping: 1, initialSpringVelocity: 1, options: .curveEaseOut, animations: {
                
                self.alpha = 1
                
            }, completion: nil)
        }
    }
    
    func dismiss (_ rect: CGRect? = nil) {
        self.removeFromSuperview()
    }
}

extension UILabel {
    func setUpGenLabel(text:String, textColor:UIColor = .black, font:UIFont, numberOfLines:Int = 1,textAlignment:NSTextAlignment = .left){
        self.text = text
        self.font = font
        self.textColor = textColor
        self.sizeToFit()
        self.numberOfLines = numberOfLines
        self.textAlignment = textAlignment
    }
}

extension UIImageView {
    func setUpImageView(image:String, contentMode:UIView.ContentMode = .scaleAspectFill){
        self.image = UIImage(named: image)
        self.contentMode = contentMode
        
    }
}

extension Double {
    func toString() -> String{
        return  String(self)
    }
    
    func roundToPlaces(places:Int) -> Double {
        let divisor = pow(10.0, Double(places))
        return (self * divisor).rounded() / divisor
        }
    
    func toInt() -> Int? {
            if self >= Double(Int.min) && self < Double(Int.max) {
                return Int(self)
            } else {
                return nil
            }
        }
}


extension String {
        //Converts String to Int
        public func toInt() -> Int? {
            if let num = NumberFormatter().number(from: self) {
                return num.intValue
            } else {
                return nil
            }
        }

        //Converts String to Double
        public func toDouble() -> Double? {
            if let num = NumberFormatter().number(from: self) {
                return num.doubleValue
            } else {
                return nil
            }
        }

        /// EZSE: Converts String to Float
        public func toFloat() -> Float? {
            if let num = NumberFormatter().number(from: self) {
                return num.floatValue
            } else {
                return nil
            }
        }

        //Converts String to Bool
        public func toBool() -> Bool? {
            return (self as NSString).boolValue
        }
    }

extension Int
{
    func toString() -> String
    {
        let myString = String(self)
        return myString
    }
}

public struct WeatherObj{
    public let id:Int
    public let temp:Double?
    public let minTemp:Double?
    public let maxTemp:Double?
    public let pressure:Int?
    public let humidity:Int?
    public let country:String?
    public let lon:Double?
    public let lat:Double?
    public let description:String?
    public let icon:String?
    public let date:Int?
}

class WeatherObj2: NSObject, NSSecureCoding {
    
    static var supportsSecureCoding: Bool {
          return true
      }

    public var id:Int
    public var temp:String?
    public var minTemp:String?
    public var maxTemp:String?
    public var pressure:String?
    public var humidity:String?
    public var country:String?
    public var lon:String?
    public var lat:String?
    public var descrip:String?
    public var icon:String?
    public var date:String?

    required init(idString:Int, desc:String?, temperature:String?, tempMin:String?, tempMax:String?,presure:String?, humid:String?, countries:String?, latitude:String?,longitude:String?, iconn:String?, datee:String?) {

        id = idString
        temp = temperature
        minTemp = tempMin
        maxTemp = tempMax
        pressure = presure
        humidity = humid
        country = countries
        lon = latitude
        lat = longitude
        descrip = desc
        icon = iconn
        date = datee
    }


    required init(coder aDecoder: NSCoder) {

        id = aDecoder.decodeInteger(forKey: "id")
        temp = aDecoder.decodeObject(forKey: "temp") as? String
        minTemp = aDecoder.decodeObject(forKey: "minTemp") as? String
        maxTemp = aDecoder.decodeObject(forKey: "maxTemp") as? String
        pressure = aDecoder.decodeObject(forKey: "pressure") as? String
        humidity = aDecoder.decodeObject(forKey: "humidity") as? String
        country = aDecoder.decodeObject(forKey: "country") as? String
        lon = aDecoder.decodeObject(forKey: "lon") as? String
        lat = aDecoder.decodeObject(forKey: "lat") as? String
        descrip = aDecoder.decodeObject(forKey: "descrip") as? String
        icon = aDecoder.decodeObject(forKey: "icon") as? String
        date = aDecoder.decodeObject(forKey: "date") as? String
    }


    public func encode(with aCoder: NSCoder) {

        aCoder.encode(id, forKey: "id")
        aCoder.encode(temp, forKey: "temp")
        aCoder.encode(minTemp, forKey: "minTemp")
        aCoder.encode(maxTemp, forKey: "maxTemp")
        aCoder.encode(pressure, forKey: "pressure")
        aCoder.encode(descrip, forKey: "descrip")
        aCoder.encode(humidity, forKey: "humidity")
        aCoder.encode(country, forKey: "country")
        aCoder.encode(lon, forKey: "lon")
        aCoder.encode(lat, forKey: "lat")
        aCoder.encode(icon, forKey: "icon")
        aCoder.encode(date, forKey: "date")
    }
}
