//
//  Extension+SheetViewController.swift
//  forecast
//
//  Created by Guru on 10/09/2021.
//  Copyright © 2021 SHAPE A/S. All rights reserved.
//

import Foundation

func setUpGeneralSheetViewController(sheet:SheetViewController){
    
    sheet.blurBottomSafeArea = true
    sheet.setSizes([.halfScreen])
    sheet.adjustForBottomSafeArea = true
    sheet.topCornersRadius = 15
    sheet.dismissOnBackgroundTap = true
    sheet.dismissOnBackgroundTap = true
    sheet.extendBackgroundBehindHandle = true
}
