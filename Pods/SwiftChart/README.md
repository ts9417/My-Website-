SwiftChart
===========

[![Version](https://img.shields.io/cocoapods/v/SwiftChart.svg?style=flat)](http://cocoapods.org/pods/SwiftChart)
[![License](https://img.shields.io/cocoapods/l/SwiftChart.svg?style=flat)](http://cocoapods.org/pods/SwiftChart)
[![Platform](https://img.shields.io/cocoapods/p/SwiftChart.svg?style=flat)](http://cocoapods.org/pods/SwiftChart)

A simple line / area charting library for iOS, written in Swift.

📈 Line and area charts  
🌞 Multiple series  
🌒 Partially filled series  
🏊 Works with signed floats  
🖖 Touch events

<p align="center">
<img src="https://cloud.githubusercontent.com/assets/120693/11602670/57ef6b26-9adc-11e5-9f95-b226a2491654.png" height="180"><img src="https://cloud.githubusercontent.com/assets/120693/11602672/5c303ac6-9adc-11e5-9006-3275a16b7ec8.png" height="180">
<img src="https://cloud.githubusercontent.com/assets/120693/11602674/5ed8a808-9adc-11e5-9e30-f55beacf9a94.png" height="180"><img src="https://cloud.githubusercontent.com/assets/120693/11602678/660d660e-9adc-11e5-8a67-0c3036c20862.gif" height="180">
</p>

## Installation

### CocoaPods

SwiftChart is available through [CocoaPods](http://cocoapods.org). To install
it, simply add the following line to your Podfile:

```ruby
pod "SwiftChart"
```

### Manually

1. Download **SwiftChart.zip** from the [last release](https://github.com/gpbl/SwiftChart/releases/latest) and extract its content in your project's folder.
2. From the Xcode project, choose *Add Files to <ProjectName>...* from the *File* menu and add the extracted files.

## Usage

The library includes:

- the [Chart](Source/Chart.swift#L40) main class, to initialize and configure the chart’s content, e.g. for adding series or setting up the its appearance
- the [ChartSeries](Source/ChartSeries.swift) class, for creating datasets and configure their appearance
- the [ChartDelegate](Source/Chart.swift#L10-L32) protocol, which tells other objects about th