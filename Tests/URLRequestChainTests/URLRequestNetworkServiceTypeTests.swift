//
//  URLRequestNetworkServiceTypeTests.swift
//  URLRequestChainTests
//
//  Created by Carl Funk on 6/2/22.
//  Copyright © 2022 Carl Funk. All rights reserved.
//

import XCTest
@testable import URLRequestChain

final class URLRequestNetworkServiceTypeTests: XCTestCase {
    
    func testDefaultNetworkServiceType() throws {
        let assertionRequest = URLRequestChainTestsConstants.baseURL
            .request()
        
        let assertion = assertionRequest.networkServiceType == .default
        
        XCTAssertTrue(assertion)
    }
    
    func testSetNetworkServiceType() throws {
        let assertionRequest = URLRequestChainTestsConstants.baseURL
            .request()
            .setNetworkServiceType(.background)
        
        let assertion = assertionRequest.networkServiceType == .background
        
        XCTAssertTrue(assertion)
    }
    
    func testChainSetNetworkServiceType() throws {
        let assertionRequest = URLRequestChainTestsConstants.baseURL
            .request()
            .setNetworkServiceType(.background)
            .setNetworkServiceType(.video)
        
        let assertion = assertionRequest.networkServiceType == .video
        
        XCTAssertTrue(assertion)
    }
}
