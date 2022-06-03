//
//  URLRequestNetworkOptions.swift
//  URLRequestChain
//
//  Created by Carl Funk on 6/2/22.
//  Copyright © 2022 Carl Funk. All rights reserved.
//

import Foundation

/// Options which expose the ability to change certain properties on a request through this
/// defined enum and an extension on ``URLRequest``.
///
/// See Apple documentation for a ``URLRequest`` for the following properties -
/// - allowsCellularAccess
/// - allowsConstrainedNetworkAccess
/// - allowsExpensiveNetworkAccess
/// - httpShouldHandleCookies
/// - httpShouldUsePipelining
///
public enum URLRequestNetworkOptions: CaseIterable {
    case disableAllowsCellularAccess
    case enableAllowsCellularAccess
    
    case disableAllowsConstrainedNetworkAccess
    case enableAllowsConstrainedNetworkAccess
    
    case disableAllowsExpensiveNetworkAccess
    case enableAllowsExpensiveNetworkAccess
    
    case disableHttpShouldHandleCookies
    case enableHttpShouldHandleCookies
    
    case disableHttpShouldUsePipelining
    case enableHttpShouldUsePipelining
}
