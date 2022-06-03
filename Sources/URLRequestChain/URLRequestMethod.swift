//
//  URLRequestMethod.swift
//  URLRequestChain
//
//  Created by Carl Funk on 6/2/22.
//  Copyright © 2022 Carl Funk. All rights reserved.
//

import Foundation

/// Http method to use for a request.
///
public enum URLRequestMethod: String, CaseIterable {
    case DELETE
    case GET
    case PATCH
    case POST
    case PUT
}
