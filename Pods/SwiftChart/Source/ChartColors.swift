//
//  ChartColors.swift
//
//  Created by Giampaolo Bellavite on 07/11/14.
//  Copyright (c) 2014 Giampaolo Bellavite. All rights reserved.
//

import UIKit

/**
Shorthands for various colors to use freely in the charts.
*/
public struct ChartColors {
    static fileprivate func colorFromHex(_ hex: Int) -> UIColor {
        let red = CGFloat((hex & 0xFF0000) >> 16) / 255.0
        let green = CGFloat((hex & 0xFF00) >> 8) / 255.0
        let blue = CGFloat((hex & 0xFF)) / 255.0

        return UIColor(red: red, green: green, blue: blue, alpha: 1)
    }

    static public func blueColor() -> UIColor {
        return color