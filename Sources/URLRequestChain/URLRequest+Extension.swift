//
//  URLRequest+Extension.swift
//  URLRequestChain
//
//  Created by Carl Funk on 6/2/22.
//  Copyright © 2022 Carl Funk. All rights reserved.
//

import Foundation

public extension URLRequest {
    
    /// Add one or many headers to a ``URLRequest``.
    ///
    /// - Important: Adding headers with the same name will cause overriding. The last header
    /// to be added with a given name will have its value associated with the name.
    ///
    /// - Parameters:
    ///   - headers: ``URLRequestHeader`` objects to add to a request.
    ///
    func addHeaders(_ headers: URLRequestHeader...) -> URLRequest {
        var request = self
        headers
            .filter { !$0.name.isEmpty && !$0.value.isEmpty }
            .forEach { header in
                let hasHeader = request.allHTTPHeaderFields?.keys.contains(header.name) ?? false
                if hasHeader {
                    request.setValue(header.value, forHTTPHeaderField: header.name)
                } else {
                    request.addValue(header.value, forHTTPHeaderField: header.name)
                }
            }
        
        return request
    }
    
    /// Convenience function to add an authorization header. The same can be done by using the
    /// ``addHeaders(_ headers: URLRequestHeader...)`` function instead.
    ///
    /// - Important: In some cases such as OAuth, a token will be passed in a header with the
    /// format of `Bearer ...`.  This is the responsibility of the developer to pass the correct format
    /// in the `value` parameter.
    ///
    /// - Parameters:
    ///   - value: The value of the authorization header as a string value.
    ///
    func setAuthorization(_ value: String) -> URLRequest {
        return self.addHeaders(.authorization(value))
    }
    
    /// Set the body of the request.
    ///
    /// - Parameters:
    ///   - data: The body as a ``Data`` type.
    ///
    func setBody(_ data: Data?) -> URLRequest {
        var request = self
        request.httpBody = data
        return request
    }
    
    /// Set the body of the request using a type that conforms to the protocol, ``Encodable``.
    ///
    /// - Important: A type that fails to properly convert to Data based on the ``Encodable``
    /// spec will not be added to the body of a request.
    ///
    /// - Parameters:
    ///   - body: A type that conforms to the ``Encodable`` protocol.
    ///
    func setBody<Body: Encodable>(_ body: Body) -> URLRequest {
        let data = try? JSONEncoder().encode(body)
        
        var request = self
        request.httpBody = data
        return request
    }
    
    /// Set the cache policy of the request.
    ///
    /// - Parameters:
    ///   - cachePolicy: See ``CachePolicy`` documentation.
    ///
    func setCachePolicy(_ cachePolicy: CachePolicy) -> URLRequest {
        var request = self
        request.cachePolicy = cachePolicy
        return request
    }
    
    /// Set the http method of the request.
    ///
    /// - Parameters:
    ///   - method: A ``URLRequestMethod`` type.
    ///
    func setMethod(_ method: URLRequestMethod) -> URLRequest {
        var request = self
        request.httpMethod = method.rawValue
        return request
    }
    
    /// Set one or many network options of a request at once.
    ///
    /// - Important: The last options to be used will be the defined options on the request.
    ///
    /// - Parameters:
    ///   - options: ``URLRequestNetworkOptions`` which pertain to the enable / disable of certain
    ///   network aspects of a request.
    ///
    func setNetworkOptions(_ options: URLRequestNetworkOptions...) -> URLRequest {
        var request = self
        options.forEach { option in
            switch option {
            case .disableAllowsCellularAccess:
                request.allowsCellularAccess = false
            case .enableAllowsCellularAccess:
                request.allowsCellularAccess = true
            case .disableAllowsConstrainedNetworkAccess:
                request.allowsConstrainedNetworkAccess = false
            case .enableAllowsConstrainedNetworkAccess:
                request.allowsConstrainedNetworkAccess = true
            case .disableAllowsExpensiveNetworkAccess:
                request.allowsExpensiveNetworkAccess = false
            case .enableAllowsExpensiveNetworkAccess:
                request.allowsExpensiveNetworkAccess = true
            case .disableHttpShouldHandleCookies:
                request.httpShouldHandleCookies = false
            case .enableHttpShouldHandleCookies:
                request.httpShouldHandleCookies = true
            case .disableHttpShouldUsePipelining:
                request.httpShouldUsePipelining = false
            case .enableHttpShouldUsePipelining:
                request.httpShouldUsePipelining = true
            }
        }
        return request
    }
    
    /// Set the network service type of a request.
    ///
    /// - Parameters:
    ///   - networkServiceType: See ``NetworkServiceType``.
    ///
    func setNetworkServiceType(_ networkServiceType: NetworkServiceType) -> URLRequest {
        var request = self
        request.networkServiceType = networkServiceType
        return request
    }
    
    /// Set the request timeout.
    ///
    /// - Parameters:
    ///   - timeout: A time defined as a ``TimeInterval``.
    ///
    func setTimeout(_ timeout: TimeInterval) -> URLRequest {
        var request = self
        request.timeoutInterval = timeout
        return request
    }
}
