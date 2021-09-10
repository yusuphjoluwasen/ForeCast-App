//
//  Extension+Optionals.swift
//  forecast
//
//  Created by Guru on 10/09/2021.
//  Copyright © 2021 SHAPE A/S. All rights reserved.
//

import Foundation

extension Optional {
    func isNil<T>(value: T) -> T {
        if self != nil {
            return self as! T
        }
        return value
    }
}
