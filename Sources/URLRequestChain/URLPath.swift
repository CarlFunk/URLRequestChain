//
//  URLPath.swift
//  URLRequestChain
//
//  Created by Carl Funk on 6/2/22.
//  Copyright © 2022 Carl Funk. All rights reserved.
//

import Foundation

/// Protocol to define a ``URLPath`` which provides a property to return a given path of a ``URL``.
///
public protocol URLPath {
    
    /// Returns the path as a string value.
    ///
    /// - Note: Forward slash is not necessary.
    ///
    var path: String { get }
}
