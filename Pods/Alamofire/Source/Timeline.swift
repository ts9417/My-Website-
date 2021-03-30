//
//  Timeline.swift
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

/// Responsible for computing the timing metrics for the complete lifecycle of a `Request`.
public struct Timeline {
    /// The time the request was initialized.
    public let requestStartTime: CFAbsoluteTime

    /// The time the first bytes were received from or sent to the server.
    public let initialResponseTime: CFAbsoluteTime

    /// The time when the request was completed.
    public let requestCompletedTime: CFAbsoluteTime

    /// The time when the response serialization was completed.
    public let serializationCompletedTime: CFAbsoluteTime

    /// The time interval in seconds from the time the request started to the initial response from the server.
    public let latency: TimeInterval

    /// The time interval in seconds from the time the request started to the time the request completed.
    public let requestDuration: TimeInterval

    /// The time interval in seconds from the time the request completed to the time response serialization completed.
    public let serializationDuration: TimeInterval

    /// The time interval in seconds from the time the request started to the time response serialization completed.
    public let totalDuration: TimeInterval

    /// Creates a new `Timeline` instance wi