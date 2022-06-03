//
//  URLRequestCachePolicyTests.swift
//  URLRequestChainTests
//
//  Created by Carl Funk on 6/2/22.
//  Copyright © 2022 Carl Funk. All rights reserved.
//

import XCTest
@testable import URLRequestChain

final class URLRequestCachePolicyTests: XCTestCase {
    
    func testDefaultCachePolicy() throws {
        let assertionRequest = URLRequestChainTestsConstants.baseURL
            .request()
        
        let assertion = assertionRequest.cachePolicy == .useProtocolCachePolicy
        
        XCTAssertTrue(assertion)
    }
    
    func testSetCachePolicy() throws {
        let assertionRequest = URLRequestChainTestsConstants.baseURL
            .request()
            .setCachePolicy(.reloadIgnoringCacheData)
        
        let assertion = assertionRequest.cachePolicy == .reloadIgnoringCacheData
        
        XCTAssertTrue(assertion)
    }
    
    func testChainSetTimeout() throws {
        let assertionRequest = URLRequestChainTestsConstants.baseURL
            .request()
            .setCachePolicy(.returnCacheDataElseLoad)
            .setCachePolicy(.returnCacheDataDontLoad)
        print(assertionRequest.httpShouldUsePipelining)
        print(assertionRequest.allowsExpensiveNetworkAccess)
        print(assertionRequest.allowsConstrainedNetworkAccess)
        let assertion = assertionRequest.cachePolicy == .returnCacheDataDontLoad
        
        XCTAssertTrue(assertion)
    }
}
