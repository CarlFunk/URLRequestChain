//
//  URLRequestChainTestsConstants.swift
//  URLRequestChainTests
//
//  Created by Carl Funk on 6/2/22.
//  Copyright © 2022 Carl Funk. All rights reserved.
//

import Foundation
import URLRequestChain

final class URLRequestChainTestsConstants {
    static let baseURL = URL(string: "https://example.com")!
    
    static let pathSeparator = "/"
    static let path1 = "path1"
    static let path2 = "path2"
    
    static let header1 = URLRequestHeader(name: "header1", value: "value1")
    static let header2 = URLRequestHeader(name: "header2", value: "value2")
    
    static let queryParameterSeparator = "&"
    static let queryParameter1 = URLQueryItem(name: "queryItem1", value: "value1")
    static let queryParameter2 = URLQueryItem(name: "queryItem2", value: "value2")
}
