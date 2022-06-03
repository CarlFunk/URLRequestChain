//
//  URL+Extension.swift
//  URLRequestChain
//
//  Created by Carl Funk on 6/2/22.
//  Copyright © 2022 Carl Funk. All rights reserved.
//

import Foundation

public extension URL {
    
    /// Add one or many paths to the end of the ``URL`` in the order as defined. Any forward slashes included
    /// in the defined path will be ignored when added.
    ///
    /// - Parameters:
    ///   - paths: Paths to be appended to the end of the url. All paths must conform to ``URLPath``.
    ///
    func addPaths(_ paths: URLPath...) -> URL {
        return paths.reduce(into: self) { url, path in
            url.appendPathComponent(path.path)
        }
    }
    
    /// Add one or many query parameters to the end of the ``URL`` in the order as defined.
    ///
    /// - Important: Query parameters with an empty name will be ignored. Adding a query
    /// parameter with a name that has previously been added will result in an additional parameter
    /// with the same name but differing value. Should improper characters be used resulting in a
    /// malformed URL, the original URL will be returned without the addition of any parameters
    /// passed into this function.
    ///
    /// - Parameters:
    ///   - queryItems: See ``URLQueryItem``.
    ///
    func addQueryParameters(_ queryItems: URLQueryItem...) -> URL {
        var urlComponents = URLComponents(
            url: self,
            resolvingAgainstBaseURL: false)
        
        let insertionQueryItems = queryItems.filter { !$0.name.isEmpty }
        if !insertionQueryItems.isEmpty {
            let mergedQueryItems = (urlComponents?.queryItems ?? []) + insertionQueryItems
            urlComponents?.queryItems = mergedQueryItems
        }
        
        let urlWithQueryParameters = urlComponents?.url
        
        guard let urlWithQueryParameters = urlWithQueryParameters else {
            return self
        }
        
        return urlWithQueryParameters
    }
    
    /// Returns a ``URLRequest`` for the ``URL`` with default configurations as defined
    /// in Apple's documentation.
    ///
    func request() -> URLRequest {
        URLRequest(url: self)
    }
}
