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
Swift is very strict about types. But although explicit typing is good for saving us from mistakes, it becomes painful when dealing with JSON and other areas that are, by nature, implicit about types.

Take the Twitter API for example. Say we want to retrieve a user's "name" value of some tweet in Swift (according to Twitter's API https://dev.twitter.com/docs/api/1.1/get/statuses/home_timeline).

The code would look like this:

```swift

if let statusesArray = try? NSJSONSerialization.JSONObjectWithData(data, options: .AllowFragments) as? [[String: AnyObject]],
    let user = statusesArray[0]["user"] as? [String: AnyObject],
    let username = user["name"] as? String {
    // Finally we got the username
}

```

It's not good.

Even if we use optional chaining, it would be messy:

```swift

if let JSONObject = try NSJSONSerialization.JSONObjectWithData(data, options: .AllowFragments) as? [[String: AnyObject]],
    let username = (JSONObject[0]["user"] as? [String: AnyObject])?["name"] as? String {
        // There's our username
}

```
An unreadable mess--for something that should really be simple!

With SwiftyJSON all you have to do is:

```swift

let json = JSON(data: dataFromNetworking)
if let userName = json[0]["user"]["name"].string {
  //Now you got your value
}

```

And don't worry about the Optional Wrapping thing. It's done for you automatically.

```swift

let json = JSON(data: dataFromNetworking)
if let userName = json[999999]["wrong_key"]["wrong_name"].string {
    //Calm down, take it easy, the ".string" property still produces the correct Optional String type with safety
} else {
    //Print the error
    print(json[999999]["wrong_key"]["wrong_name"])
}

```

## Requirements

- iOS 7.0+ / OS X 10.9+
- Xcode 8

##Integration

####CocoaPods (iOS 8+, OS X 10.9+)
You can use [Cocoapods](http://cocoapods.org/) to install `SwiftyJSON`by adding it to your `Podfile`:
```ruby
platform :ios, '8.0'
use_frameworks!

target 'MyApp' do
	pod 'SwiftyJSON'
end
```
Note that this requires CocoaPods version 36, and your iOS deployment target to be at least 8.0:


####Carthage (iOS 8+, OS X 10.9+)
You can use [Carthage](https://github.com/Carthage/Carth