//
//  Request.swift
//
//  Copyright (c) 2014-2016 Alamofire Software Foundation (http://alamofire.org/)
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
//

import Foundation

/// A type that can inspect and optionally adapt a `URLRequest` in some manner if necessary.
public protocol RequestAdapter {
    /// Inspects and adapts the specified `URLRequest` in some manner if necessary and returns the result.
    ///
    /// - parameter urlRequest: The URL request to adapt.
    ///
    /// - throws: An `Error` if the adaptation encounters an error.
    ///
    /// - returns: The adapted `URLRequest`.
    func adapt(_ urlRequest: URLRequest) throws -> URLRequest
}

// MARK: -

/// A closure executed when the `RequestRetrier` determines whether a `Request` should be retried or not.
public typealias RequestRetryCompletion = (_ shouldRetry: Bool, _ timeDelay: TimeInterval) -> Void

/// A type that determines whether a request should be retried after being executed by the specified session manager
/// and encountering an error.
public protocol RequestRetrier {
    /// Determines whether the `Request` should be retried by calling the `completion` closure.
    ///
    /// This operation is fully asynchronous. Any amount of time can be taken to determine whether the request needs
    /// to be retried. The one requirement is that the completion closure is called to ensure the request is properly
    /// cleaned up aft