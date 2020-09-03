
![Alamofire: Elegant Networking in Swift](https://raw.githubusercontent.com/Alamofire/Alamofire/assets/alamofire.png)

[![Build Status](https://travis-ci.org/Alamofire/Alamofire.svg?branch=master)](https://travis-ci.org/Alamofire/Alamofire)
[![CocoaPods Compatible](https://img.shields.io/cocoapods/v/Alamofire.svg)](https://img.shields.io/cocoapods/v/Alamofire.svg)
[![Carthage Compatible](https://img.shields.io/badge/Carthage-compatible-4BC51D.svg?style=flat)](https://github.com/Carthage/Carthage)
[![Platform](https://img.shields.io/cocoapods/p/Alamofire.svg?style=flat)](http://cocoadocs.org/docsets/Alamofire)
[![Twitter](https://img.shields.io/badge/twitter-@AlamofireSF-blue.svg?style=flat)](http://twitter.com/AlamofireSF)
[![Gitter](https://badges.gitter.im/Alamofire/Alamofire.svg)](https://gitter.im/Alamofire/Alamofire?utm_source=badge&utm_medium=badge&utm_campaign=pr-badge)

Alamofire is an HTTP networking library written in Swift.

- [Features](#features)
- [Component Libraries](#component-libraries)
- [Requirements](#requirements)
- [Migration Guides](#migration-guides)
- [Communication](#communication)
- [Installation](#installation)
- [Usage](#usage)
    - **Intro -** [Making a Request](#making-a-request), [Response Handling](#response-handling), [Response Validation](#response-validation), [Response Caching](#response-caching)
	- **HTTP -** [HTTP Methods](#http-methods), [Parameter Encoding](#parameter-encoding), [HTTP Headers](#http-headers), [Authentication](#authentication)
	- **Large Data -** [Downloading Data to a File](#downloading-data-to-a-file), [Uploading Data to a Server](#uploading-data-to-a-server)
	- **Tools -** [Statistical Metrics](#statistical-metrics), [cURL Command Output](#curl-command-output)
- [Advanced Usage](#advanced-usage)
	- **URL Session -** [Session Manager](#session-manager), [Session Delegate](#session-delegate), [Request](#request)
	- **Routing -** [Routing Requests](#routing-requests), [Adapting and Retrying Requests](#adapting-and-retrying-requests)
	- **Model Objects -** [Custom Response Serialization](#custom-response-serialization)
	- **Connection -** [Security](#security), [Network Reachability](#network-reachability)
- [Open Radars](#open-radars)
- [FAQ](#faq)
- [Credits](#credits)
- [Donations](#donations)
- [License](#license)

## Features

- [x] Chainable Request / Response Methods
- [x] URL / JSON / plist Parameter Encoding
- [x] Upload File / Data / Stream / MultipartFormData
- [x] Download File using Request or Resume Data
- [x] Authentication with URLCredential
- [x] HTTP Response Validation
- [x] Upload and Download Progress Closures with Progress
- [x] cURL Command Output
- [x] Dynamically Adapt and Retry Requests
- [x] TLS Certificate and Public Key Pinning
- [x] Network Reachability
- [x] Comprehensive Unit and Integration Test Coverage
- [x] [Complete Documentation](http://cocoadocs.org/docsets/Alamofire)

## Component Libraries

In order to keep Alamofire focused specifically on core networking implementations, additional component libraries have been created by the [Alamofire Software Foundation](https://github.com/Alamofire/Foundation) to bring additional functionality to the Alamofire ecosystem.

- [AlamofireImage](https://github.com/Alamofire/AlamofireImage) - An image library including image response serializers, `UIImage` and `UIImageView` extensions, custom image filters, an auto-purging in-memory cache and a priority-based image downloading system.
- [AlamofireNetworkActivityIndicator](https://github.com/Alamofire/AlamofireNetworkActivityIndicator) - Controls the visibility of the network activity indicator on iOS using Alamofire. It contains configurable delay timers to help mitigate flicker and can support `URLSession` instances not managed by Alamofire.

## Requirements

- iOS 8.0+ / macOS 10.10+ / tvOS 9.0+ / watchOS 2.0+
- Xcode 8.1, 8.2, 8.3, and 9.0
- Swift 3.0, 3.1, 3.2, and 4.0

## Migration Guides

- [Alamofire 4.0 Migration Guide](https://github.com/Alamofire/Alamofire/blob/master/Documentation/Alamofire%204.0%20Migration%20Guide.md)
- [Alamofire 3.0 Migration Guide](https://github.com/Alamofire/Alamofire/blob/master/Documentation/Alamofire%203.0%20Migration%20Guide.md)
- [Alamofire 2.0 Migration Guide](https://github.com/Alamofire/Alamofire/blob/master/Documentation/Alamofire%202.0%20Migration%20Guide.md)

## Communication

- If you **need help**, use [Stack Overflow](http://stackoverflow.com/questions/tagged/alamofire). (Tag 'alamofire')
- If you'd like to **ask a general question**, use [Stack Overflow](http://stackoverflow.com/questions/tagged/alamofire).
- If you **found a bug**, open an issue.
- If you **have a feature request**, open an issue.
- If you **want to contribute**, submit a pull request.

## Installation

### CocoaPods

[CocoaPods](http://cocoapods.org) is a dependency manager for Cocoa projects. You can install it with the following command:

```bash
$ gem install cocoapods
```

> CocoaPods 1.1.0+ is required to build Alamofire 4.0.0+.

To integrate Alamofire into your Xcode project using CocoaPods, specify it in your `Podfile`:

```ruby
source 'https://github.com/CocoaPods/Specs.git'
platform :ios, '10.0'
use_frameworks!

target '<Your Target Name>' do
    pod 'Alamofire', '~> 4.4'
end
```

Then, run the following command:

```bash
$ pod install
```

### Carthage

[Carthage](https://github.com/Carthage/Carthage) is a decentralized dependency manager that builds your dependencies and provides you with binary frameworks.

You can install Carthage with [Homebrew](http://brew.sh/) using the following command:

```bash
$ brew update
$ brew install carthage
```

To integrate Alamofire into your Xcode project using Carthage, specify it in your `Cartfile`:

```ogdl
github "Alamofire/Alamofire" ~> 4.4
```

Run `carthage update` to build the framework and drag the built `Alamofire.framework` into your Xcode project.

### Swift Package Manager

The [Swift Package Manager](https://swift.org/package-manager/) is a tool for automating the distribution of Swift code and is integrated into the `swift` compiler. It is in early development, but Alamofire does support its use on supported platforms. 

Once you have your Swift package set up, adding Alamofire as a dependency is as easy as adding it to the `dependencies` value of your `Package.swift`.

```swift
dependencies: [
    .Package(url: "https://github.com/Alamofire/Alamofire.git", majorVersion: 4)
]
```

### Manually

If you prefer not to use any of the aforementioned dependency managers, you can integrate Alamofire into your project manually.

#### Embedded Framework

- Open up Terminal, `cd` into your top-level project directory, and run the following command "if" your project is not initialized as a git repository:

  ```bash
  $ git init
  ```

- Add Alamofire as a git [submodule](http://git-scm.com/docs/git-submodule) by running the following command:

  ```bash
  $ git submodule add https://github.com/Alamofire/Alamofire.git
  ```

- Open the new `Alamofire` folder, and drag the `Alamofire.xcodeproj` into the Project Navigator of your application's Xcode project.

    > It should appear nested underneath your application's blue project icon. Whether it is above or below all the other Xcode groups does not matter.

- Select the `Alamofire.xcodeproj` in the Project Navigator and verify the deployment target matches that of your application target.
- Next, select your application project in the Project Navigator (blue project icon) to navigate to the target configuration window and select the application target under the "Targets" heading in the sidebar.
- In the tab bar at the top of that window, open the "General" panel.
- Click on the `+` button under the "Embedded Binaries" section.
- You will see two different `Alamofire.xcodeproj` folders each with two different versions of the `Alamofire.framework` nested inside a `Products` folder.

    > It does not matter which `Products` folder you choose from, but it does matter whether you choose the top or bottom `Alamofire.framework`.

- Select the top `Alamofire.framework` for iOS and the bottom one for OS X.

    > You can verify which one you selected by inspecting the build log for your project. The build target for `Alamofire` will be listed as either `Alamofire iOS`, `Alamofire macOS`, `Alamofire tvOS` or `Alamofire watchOS`.

- And that's it!

  > The `Alamofire.framework` is automagically added as a target dependency, linked framework and embedded framework in a copy files build phase which is all you need to build on the simulator and a device.

---

## Usage

### Making a Request

```swift
import Alamofire

Alamofire.request("https://httpbin.org/get")
```

### Response Handling

Handling the `Response` of a `Request` made in Alamofire involves chaining a response handler onto the `Request`.

```swift
Alamofire.request("https://httpbin.org/get").responseJSON { response in
    print("Request: \(String(describing: response.request))")   // original url request
    print("Response: \(String(describing: response.response))") // http url response
    print("Result: \(response.result)")                         // response serialization result

    if let json = response.result.value {
        print("JSON: \(json)") // serialized json response
    }

    if let data = response.data, let utf8Text = String(data: data, encoding: .utf8) {
        print("Data: \(utf8Text)") // original server data as UTF8 string
    }
}
```

In the above example, the `responseJSON` handler is appended to the `Request` to be executed once the `Request` is complete. Rather than blocking execution to wait for a response from the server, a [callback](http://en.wikipedia.org/wiki/Callback_%28computer_programming%29) in the form of a closure is specified to handle the response once it's received. The result of a request is only available inside the scope of a response closure. Any execution contingent on the response or data received from the server must be done within a response closure.

> Networking in Alamofire is done _asynchronously_. Asynchronous programming may be a source of frustration to programmers unfamiliar with the concept, but there are [very good reasons](https://developer.apple.com/library/ios/qa/qa1693/_index.html) for doing it this way.

Alamofire contains five different response handlers by default including:

```swift
// Response Handler - Unserialized Response
func response(
    queue: DispatchQueue?,
    completionHandler: @escaping (DefaultDataResponse) -> Void)
    -> Self

// Response Data Handler - Serialized into Data
func responseData(
    queue: DispatchQueue?,
    completionHandler: @escaping (DataResponse<Data>) -> Void)
    -> Self

// Response String Handler - Serialized into String
func responseString(
    queue: DispatchQueue?,
    encoding: String.Encoding?,
    completionHandler: @escaping (DataResponse<String>) -> Void)
    -> Self

// Response JSON Handler - Serialized into Any
func responseJSON(
    queue: DispatchQueue?,
    completionHandler: @escaping (DataResponse<Any>) -> Void)
    -> Self

// Response PropertyList (plist) Handler - Serialized into Any
func responsePropertyList(
    queue: DispatchQueue?,
    completionHandler: @escaping (DataResponse<Any>) -> Void))
    -> Self
```

None of the response handlers perform any validation of the `HTTPURLResponse` it gets back from the server.

> For example, response status codes in the `400..<500` and `500..<600` ranges do NOT automatically trigger an `Error`. Alamofire uses [Response Validation](#response-validation) method chaining to achieve this.

#### Response Handler

The `response` handler does NOT evaluate any of the response data. It merely forwards on all information directly from the URL session delegate. It is the Alamofire equivalent of using `cURL` to execute a `Request`.

```swift
Alamofire.request("https://httpbin.org/get").response { response in
    print("Request: \(response.request)")
    print("Response: \(response.response)")
    print("Error: \(response.error)")

    if let data = response.data, let utf8Text = String(data: data, encoding: .utf8) {
    	print("Data: \(utf8Text)")
    }
}
```

> We strongly encourage you to leverage the other response serializers taking advantage of `Response` and `Result` types.

#### Response Data Handler

The `responseData` handler uses the `responseDataSerializer` (the object that serializes the server data into some other type) to extract the `Data` returned by the server. If no errors occur and `Data` is returned, the response `Result` will be a `.success` and the `value` will be of type `Data`.

```swift
Alamofire.request("https://httpbin.org/get").responseData { response in
    debugPrint("All Response Info: \(response)")

    if let data = response.result.value, let utf8Text = String(data: data, encoding: .utf8) {
    	print("Data: \(utf8Text)")
    }
}
```

#### Response String Handler

The `responseString` handler uses the `responseStringSerializer` to convert the `Data` returned by the server into a `String` with the specified encoding. If no errors occur and the server data is successfully serialized into a `String`, the response `Result` will be a `.success` and the `value` will be of type `String`.

```swift
Alamofire.request("https://httpbin.org/get").responseString { response in
    print("Success: \(response.result.isSuccess)")
    print("Response String: \(response.result.value)")
}
```

> If no encoding is specified, Alamofire will use the text encoding specified in the `HTTPURLResponse` from the server. If the text encoding cannot be determined by the server response, it defaults to `.isoLatin1`.

#### Response JSON Handler

The `responseJSON` handler uses the `responseJSONSerializer` to convert the `Data` returned by the server into an `Any` type using the specified `JSONSerialization.ReadingOptions`. If no errors occur and the server data is successfully serialized into a JSON object, the response `Result` will be a `.success` and the `value` will be of type `Any`.

```swift
Alamofire.request("https://httpbin.org/get").responseJSON { response in
    debugPrint(response)

    if let json = response.result.value {
        print("JSON: \(json)")
    }
}
```

> All JSON serialization is handled by the `JSONSerialization` API in the `Foundation` framework.

#### Chained Response Handlers

Response handlers can even be chained:

```swift
Alamofire.request("https://httpbin.org/get")
    .responseString { response in
        print("Response String: \(response.result.value)")
    }
    .responseJSON { response in
        print("Response JSON: \(response.result.value)")
    }
```

> It is important to note that using multiple response handlers on the same `Request` requires the server data to be serialized multiple times. Once for each response handler.

#### Response Handler Queue

Response handlers by default are executed on the main dispatch queue. However, a custom dispatch queue can be provided instead.

```swift
let utilityQueue = DispatchQueue.global(qos: .utility)

Alamofire.request("https://httpbin.org/get").responseJSON(queue: utilityQueue) { response in
    print("Executing response handler on utility queue")
}
```

### Response Validation

By default, Alamofire treats any completed request to be successful, regardless of the content of the response. Calling `validate` before a response handler causes an error to be generated if the response had an unacceptable status code or MIME type.

#### Manual Validation

```swift
Alamofire.request("https://httpbin.org/get")
    .validate(statusCode: 200..<300)
    .validate(contentType: ["application/json"])
    .responseData { response in
        switch response.result {
        case .success:
            print("Validation Successful")
        case .failure(let error):
            print(error)
        }
    }
```

#### Automatic Validation

Automatically validates status code within `200..<300` range, and that the `Content-Type` header of the response matches the `Accept` header of the request, if one is provided.

```swift
Alamofire.request("https://httpbin.org/get").validate().responseJSON { response in
    switch response.result {
    case .success:
        print("Validation Successful")
    case .failure(let error):
        print(error)
    }
}
```

### Response Caching

Response Caching is handled on the system framework level by [`URLCache`](https://developer.apple.com/reference/foundation/urlcache). It provides a composite in-memory and on-disk cache and lets you manipulate the sizes of both the in-memory and on-disk portions.

> By default, Alamofire leverages the shared `URLCache`. In order to customize it, see the [Session Manager Configurations](#session-manager) section.

### HTTP Methods

The `HTTPMethod` enumeration lists the HTTP methods defined in [RFC 7231 §4.3](http://tools.ietf.org/html/rfc7231#section-4.3):

```swift
public enum HTTPMethod: String {
    case options = "OPTIONS"
    case get     = "GET"
    case head    = "HEAD"
    case post    = "POST"
    case put     = "PUT"
    case patch   = "PATCH"
    case delete  = "DELETE"
    case trace   = "TRACE"
    case connect = "CONNECT"
}
```

These values can be passed as the `method` argument to the `Alamofire.request` API:

```swift
Alamofire.request("https://httpbin.org/get") // method defaults to `.get`

Alamofire.request("https://httpbin.org/post", method: .post)
Alamofire.request("https://httpbin.org/put", method: .put)
Alamofire.request("https://httpbin.org/delete", method: .delete)
```