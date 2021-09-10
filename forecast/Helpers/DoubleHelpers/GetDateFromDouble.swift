//
//  GetDateFromString.swift
//  forecast
//
//  Created by Guru on 10/09/2021.
//  Copyright © 2021 SHAPE A/S. All rights reserved.
//

import Foundation
extension Double{
    func getDateStringFromUTC() -> String {
        let date = Date(timeIntervalSince1970: self)

        let dateFormatter = DateFormatter()
        dateFormatter.locale = Locale(identifier: "en_US")
        dateFormatter.dateStyle = .medium

        return dateFormatter.string(from: date)
    }
}

