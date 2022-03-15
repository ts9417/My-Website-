//
//  Chart.swift
//
//  Created by Giampaolo Bellavite on 07/11/14.
//  Copyright (c) 2014 Giampaolo Bellavite. All rights reserved.
//

import UIKit

public protocol ChartDelegate: class {

    /**
    Tells the delegate that the specified chart has been touched.

    - parameter chart: The chart that has been touched.
    - parameter indexes: Each element of this array contains the index of the data that has been touched, one for each 
      series. If the series hasn't been touched, its index will be nil.
    - parameter x: The value on the x-axis that has been touched.
    - parameter left: The distance from the left side of the chart.

    */
    func didTouchChart(_ chart: Chart, indexes: [Int?], x: Float, left: CGFloat)

    /**
    Tells the delegate that the user finished touching the chart. The user will 
    "finish" touching the chart only swiping left/right outside the chart.

    - parameter chart: The chart that has been touched.

    */
    func didFinishTouchingChart(_ chart: Chart)
    /**
     Tells the delegate that the user ended touching the chart. The user 
     will "end" touching the chart whenever the touchesDidEnd method is 
     being called.
     
     - parameter chart: The chart that has been touched.
     
     */
    func didEndTouchingChart(_ chart: Chart)
}

/**
Represent the x- and the y-axis values for each point in a chart series.
*/
typealias ChartPoint = (x: Float, y: Float)

public enum ChartLabelOrientation {
    case horizontal
    case vertical
}

@IBDesignable
open class Chart: UIControl {

    // MARK: Options

    @IBInspectable
    open var identifier: String?

    /**
    Series to display in the chart.
    */
    open var series: [ChartSeries] = [] {
        didSet {
            setNeedsDisplay()
        }
    }

    /**
    The values to display as labels on the x-axis. You can format these values  with the `xLabelFormatter` attribute. 
    As default, it will display the values of the series which has the most data.
    */
    open var xLabels: [Float]?

    /**
    Formatter for the labels on the x-axis. The `index` represents the `xLabels` index, `value` its value:
    */
    open var xLabelsFormatter = { (labelIndex: Int, labelValue: Float) -> String in
        String(Int(labelValue))
    }

    /**
    Text alignment for the x-labels
    */
    open var xLabelsTextAlignment: NSTextAlignment = .left

    /**
     Orientation for the x-labels
     */
    open var xLabelsOrientation: ChartLabelOrientation = .horizontal

    /**
     Skip the last x-label. Setting this to false may make the label overflow the frame width.
     */
    open var xLabelsSkipLast: Bool = true

    /**
    Values to display as labels of the y-axis. If not specified, will display the
    lowest, the middle and the highest values.
    */
    open var yLabels: [Float]?

    /**
    Formatter for the labels on the y-axis.
    */
    open var yLabelsFormatter = { (labelIndex: Int, labelValue: Float) -> String in
        String(Int(labelValue))
    }

    /**
    Displays the y-axis labels on the right side of the chart.
    */
    open var yLabelsOnRightSide: Bool = false

    /**
    Font used for the labels.
    */
    open var labelFont: UIFont? = UIFont.systemFont(ofSize: 12)

    /**
    Font used for the labels.
    */
    @IBInspectable
    open var labelColor: UIColor = UIColor.black

    /**
    Color for the axes.
    */
    @IBInspectable
    open var axesColor: UIColor = UIColor.gray.withAlphaComponent(0.3)

    /**
    Color for the grid.
    */
    @IBInspectable
    open var gridColor: UIColor = UIColor.gray.withAlphaComponent(0.3)
    /**
     Should draw lines for labels on X axis.
     */
    open var showXLabelsAndGrid: Bool = true
    /**
     Should draw lines for labels on Y axis.
     */
    open var showYLabelsAndGrid: Bool = true

    /**
    Height of the area 