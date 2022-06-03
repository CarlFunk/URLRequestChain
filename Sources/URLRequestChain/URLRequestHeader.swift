//
//  URLRequestHeader.swift
//  URLRequestChain
//
//  Created by Carl Funk on 6/2/22.
//  Copyright © 2022 Carl Funk. All rights reserved.
//

import Foundation

/// A header associated with a ``URLRequest``.
///
public struct URLRequestHeader {
    
    /// The name of the header represented as a string value.
    ///
    public let name: String
    
    /// The value of the header represented as a string value.
    ///
    public let value: String
    
    /// Initialize a new request header.
    ///
    /// - Parameters:
    ///   - name: The name of the header
    ///   - value: The value of the header
    /// 
    public init(
        name: String,
        value: String
    ) {
        self.name = name
        self.value = value
    }
}

// MARK: Commonly used headers

public extension URLRequestHeader {
    static func authorization(_ value: String) -> URLRequestHeader {
        URLRequestHeader(
            name: "Authorization",
            value: value)
    }
    
    static func contentType(_ value: String) -> URLRequestHeader {
        URLRequestHeader(
            name: "Content-Type",
            value: value)
    }
}
