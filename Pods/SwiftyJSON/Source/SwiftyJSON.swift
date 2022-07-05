//  SwiftyJSON.swift
//
//  Copyright (c) 2014 Ruoyu Fu, Pinglin Tang
//
//  Permission is hereby granted, free of charge, to any person obtaining a copy
//  of this software and associated documentation files (the "Software"), to deal
//  in the Software without restriction, including without limitation the rights
//  to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
//  copies of the Software, and to permit persons to whom the Software is
//  furnished to do so, subject to the following conditions:
//
//  The above copyright notice and this permission notice shall be included in
//  all copies or substantial portions of the Software.
//
//  THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
//  IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
//  FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
//  AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
//  LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
//  OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN
//  THE SOFTWARE.

import Foundation

// MARK: - Error

///Error domain
public let ErrorDomain: String = "SwiftyJSONErrorDomain"

///Error code
public let ErrorUnsupportedType: Int = 999
public let ErrorIndexOutOfBounds: Int = 900
public let ErrorWrongType: Int = 901
public let ErrorNotExist: Int = 500
public let ErrorInvalidJSON: Int = 490

// MARK: - JSON Type

/**
 JSON's type definitions.
 
 See http://www.json.org
 */
public enum Type :Int{
    
    case number
    case string
    case bool
    case array
    case dictionary
    case null
    case unknown
}

// MARK: - JSON Base

public struct JSON {
    
    /**
     Creates a JSON using the data.
     
     - parameter data:  The NSData used to convert to json.Top level object in data is an NSArray or NSDictionary
     - parameter opt:   The JSON serialization reading options. `.AllowFragments` by default.
     - parameter error: error The NSErrorPointer used to return the error. `nil` by default.
     
     - returns: The created JSON
     */
    public init(data:Data, options opt: JSONSerialization.ReadingOptions = .allowFragments, error: NSErrorPointer? = nil) {
        do {
            let object: Any = try JSONSerialization.jsonObject(with: data, options: opt)
            self.init(object)
        } catch let aError as NSError {
            if error != nil {
                error??.pointee = aError
            }
            self.init(NSNull())
        }
    }
    
    /**
     Create a JSON from JSON string
     - parameter string: Normal json string like '{"a":"b"}'
     
     - returns: The created JSON
     */
    public static func parse(_ string:String) -> JSON {
        return string.data(using: String.Encoding.utf8)
            .flatMap({JSON(data: $0)}) ?? JSON(NSNull())
    }
    
    /**
     Creates a JSON using the object.
     
     - parameter object:  The object must have the following properties: All objects are NSString/String, NSNumber/Int/Float/Double/Bool, NSArray/Array, NSDictionary/Dictionary, or NSNull; All dictionary keys are NSStrings/String; NSNumbers are not NaN or infinity.
     
     - returns: The created JSON
     */
    public init(_ object: Any) {
        self.object = object
    }
    
    /**
     Creates a JSON from a [JSON]
     
     - parameter jsonArray: A Swift array of JSON objects
     
     - returns: The created JSON
     */
    public init(_ jsonArray:[JSON]) {
        self.init(jsonArray.map { $0.object })
    }
    
    /**
     Creates a JSON from a [String: JSON]
     
     - parameter jsonDictionary: A Swift dictionary of JSON objects
     
     - returns: The created JSON
     */
    public init(_ jsonDictionary:[String: JSON]) {
        var dictionary = [String: Any](minimumCapacity: jsonDictionary.count)
        for (key, json) in jsonDictionary {
            dictionary[key] = json.object
        }
        self.init(dictionary)
    }
    
    /// Private object
    fileprivate var rawArray: [Any] = []
    fileprivate var rawDictionary: [String : Any] = [:]
    fileprivate var rawString: String = ""
    fileprivate var rawNumber: NSNumber = 0
    fileprivate var rawNull: NSNull = NSNull()
    fileprivate var rawBool: Bool = false
    /// Private type
    fileprivate var _type: Type = .null
    /// prviate error
    fileprivate var _error: NSError? = nil
    
    /// Object in JSON
    public var object: Any {
        get {
            switch self.type {
            case .array:
                return self.rawArray
            case .dictionary:
                return self.rawDictionary
            case .string:
                return self.rawString
            case .number:
                return self.rawNumber
            case .bool:
                return self.rawBool
            default:
                return self.rawNull
            }
        }
        set {
            _error = nil
            switch newValue {
            case let number as NSNumber:
                if number.isBool {
                    _type = .bool
                    self.rawBool = number.boolValue
                } else {
                    _type = .number
                    self.rawNumber = number
                }
            case  let string as String:
                _type = .string
                self.rawString = string
            case  _ as NSNull:
                _type = .null
            case let array as [Any]:
                _type = .array
                self.rawArray = array
            case let dictionary as [String : Any]:
                _type = .dictionary
                self.rawDictionary = dictionary
            default:
                _type = .unknown
                _error = NSError(domain: ErrorDomain, code: ErrorUnsupportedType, userInfo: [NSLocalizedDescriptionKey: "It is a unsupported type"])
            }
        }
    }
    
    /// json type
    public var type: Type { get { return _type } }
    
    /// Error in JSON
    public var error: NSError? { get { return self._error } }
    
    /// The static null json
    @available(*, unavailable, renamed:"null")
    public static var nullJSON: JSON { get { return null } }
    public static var null: JSON { get { return JSON(NSNull()) } }
}

public enum JSONIndex:Comparable {
    case array(Int)
    case dictionary(DictionaryIndex<String, JSON>)
    case null
}

public func ==(lhs: JSONIndex, rhs: JSONIndex) -> Bool {
    switch (lhs, rhs) {
    case (.array(let left), .array(let right)):
        return left == right
    case (.dictionary(let left), .dictionary(let right)):
        return left == right
    default:
        return false
    }
}

public func <(lhs: JSONIndex, rhs: JSONIndex) -> Bool {
    switch (lhs, rhs) {
    case (.array(let left), .array(let right)):
        return left < right
    case (.dictionary(let left), .dictionary(let right)):
        return left < right
    default:
        return false
    }
}


extension JSON: Collection{
    
    public typealias Index = JSONIndex
    
    public var startIndex: Index{
        switch type {
        case .array:
            return .array(rawArray.startIndex)
        case .dictionary:
            return .dictionary(dictionaryValue.startIndex)
        default:
            return .null
        }
    }
    
    public var endIndex: Index{
        switch type {
        case .array:
            return .array(rawArray.endIndex)
        case .dictionary:
            return .dictionary(dictionaryValue.endIndex)
        default:
            return .null
        }
    }
    
    public func index(after i: Index) -> Index {
        switch i {
        case .array(let idx):
            return .array(rawArray.index(after: idx))
        case .dictionary(let idx):
            return .dictionary(dictionaryValue.index(after: idx)