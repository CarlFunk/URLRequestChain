//
//  URLRequestChainExample.swift
//  URLRequestChainExample
//
//  Created by Carl Funk on 6/2/22.
//  Copyright © 2022 Carl Funk. All rights reserved.
//

import Foundation
import URLRequestChain

private final class URLRequestChainExample {
    private enum ExamplePaths: URLPath {
        case path
        
        var path: String {
            switch self {
            case .path: return "path"
            }
        }
    }
    
    private func example() -> URLRequest {
        return URL(string: "https://example.com")!
            .addPaths(ExamplePaths.path)
            .addQueryParameters(
                URLQueryItem(
                    name: "id",
                    value: "..."))
            .request()
            .setMethod(.GET)
            .setBody(nil)
            .setTimeout(10)
            .setAuthorization("Bearer ...")
            .addHeaders(
                URLRequestHeader(
                    name: "...",
                    value: "..."))
            .setCachePolicy(.reloadIgnoringCacheData)
            .setNetworkOptions(.disableAllowsCellularAccess)
            .setNetworkServiceType(.background)
    }
}
