//
//  URLRequestTimeoutTests.swift
//  URLRequestChainTests
//
//  Created by Carl Funk on 6/2/22.
//  Copyright © 2022 Carl Funk. All rights reserved.
//

import XCTest
@testable import URLRequestChain

final class URLRequestTimeoutTests: XCTestCase {
    
    func testDefaultTimeout() throws {
        let assertionRequest = URLRequestChainTestsConstants.baseURL
            .request()
        
        let assertion = assertionRequest.timeoutInterval == 60
        
        XCTAssertTrue(assertion)
    }
    
    func testSetIntegerTimeout() throws {
        let assertionRequest = URLRequestChainTestsConstants.baseURL
            .request()
            .setTimeout(30)
        
        let assertion = assertionRequest.timeoutInterval == 30
        
        XCTAssertTrue(assertion)
    }
    
    func testSetDoubleTimeout() throws {
        let assertionRequest = URLRequestChainTestsConstants.baseURL
            .request()
            .setTimeout(10.5)
        
        let assertion = assertionRequest.timeoutInterval == 10.5
        
        XCTAssertTrue(assertion)
    }
    
    func testChainSetTimeout() throws {
        let assertionRequest = URLRequestChainTestsConstants.baseURL
            .request()
            .setTimeout(10)
            .setTimeout(20)
        
        let assertion = assertionRequest.timeoutInterval == 20
        
        XCTAssertTrue(assertion)
    }
}
