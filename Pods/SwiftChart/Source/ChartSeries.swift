//
//  ChartSeries.swift
//
//  Created by Giampaolo Bellavite on 07/11/14.
//  Copyright (c) 2014 Giampaolo Bellavite. All rights reserved.
//

import UIKit

/**
Represent a series to draw in the line chart. Each series is defined with a dataset and appareance settings.
*/
open class ChartSeries {
    open var data: [(x: Float, y: Float)]
    open var area: Bool = false
    open var line: Bool = true
    open var color: UIColor = ChartColors.blueColor() {
        didSet {
            colors = (above: color, below: col