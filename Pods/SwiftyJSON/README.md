#SwiftyJSON

[![Travis CI](https://travis-ci.org/SwiftyJSON/SwiftyJSON.svg?branch=master)](https://travis-ci.org/SwiftyJSON/SwiftyJSON)

SwiftyJSON makes it easy to deal with JSON data in Swift.

1. [Why is the typical JSON handling in Swift NOT good](#why-is-the-typical-json-handling-in-swift-not-good)
2. [Requirements](#requirements)
3. [Integration](#integration)
4. [Usage](#usage)
   - [Initialization](#initialization)
   - [Subscript](#subscript)
   - [Loop](#loop)
   - [Error](#error)
   - [Optional getter](#optional-getter)
   - [Non-optional getter](#non-optional-getter)
   - [Setter](#setter)
   - [Raw object](#raw-object)
   - [Literal convertibles](#literal-convertibles)
5. [Work with Alamofire](#work-with-alamofire)

> For Legacy Swift support, take a look at the [swift2 branch](https://github.com/SwiftyJSON/SwiftyJSON/tree/swift2)

> [中文介绍](http://tangplin.github.io/swiftyjson/)


##Why is the typical JSON handling in Swift NOT good?
Swift is very strict about