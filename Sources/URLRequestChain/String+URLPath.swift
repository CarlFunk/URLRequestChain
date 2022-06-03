//
//  String+URLPath.swift
//  URLRequestChain
//
//  Created by Carl Funk on 6/2/22.
//  Copyright © 2022 Carl Funk. All rights reserved.
//

import Foundation

/// String conformance to URLPath
/// 
extension String: URLPath {
    public var path: String {
        self
    }
}
