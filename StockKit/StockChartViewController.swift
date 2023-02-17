//
//  StockChartViewController.swift
//  SwiftChart
//
//  Created by Giampaolo Bellavite on 07/11/14.
//  Copyright (c) 2014 Giampaolo Bellavite. All rights reserved.
//

import UIKit
import SwiftChart

class StockChartViewController: UIViewController, ChartDelegate {
    
    var selectedChart = 0
    
    var labelLeadingMarginConstraint: NSLayoutConstraint!
    var label: UILabel = UILabel()
    var chart: Chart = Chart()
    
    fileprivate var labelLeadingMarginInitialConstant: CGFloat!
    
    override func viewDidLoad() {
        
        view.backgroundColor = .white
        
        view.addSubview(chart)
        chart.anchor(view.topAnchor, left: view.leftAnchor, bottom: nil, right: view.rightAnchor, topConstant: 40, leftConstant: 16, bottomConstant: 0, rightConstant: 16, widthConstant: 0, heightConstant: 300)
        view.addSubview(label)
        labelLeadingMarginConstraint = label.anchorWithReturnAnchors(view.topAnchor, left: view.leftAnchor, bottom: nil, right: nil, topConstant: 20, leftConstant: 0, bottomConstant: 0, rightConstant: 0, widthConstant: 0, heightConstant: 20)[1]
        
        labelLeadingMarginInitialConstant = labelLeadingMarginConstraint.constant
        initializeChart()
        
    }
    
    func initializeChart() {
        chart.delegate