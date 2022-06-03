//
//  URLRequestNetworkOptionsTests.swift
//  URLRequestChainTests
//
//  Created by Carl Funk on 6/2/22.
//  Copyright © 2022 Carl Funk. All rights reserved.
//

import XCTest
@testable import URLRequestChain

final class URLRequestNetworkOptionsTests: XCTestCase {
    
    func testDefaultOptions() throws {
        let assertionRequest = URLRequestChainTestsConstants.baseURL
            .request()
        
        XCTAssertTrue(assertionRequest.allowsCellularAccess)
        XCTAssertTrue(assertionRequest.allowsConstrainedNetworkAccess)
        XCTAssertTrue(assertionRequest.allowsExpensiveNetworkAccess)
        XCTAssertTrue(assertionRequest.httpShouldHandleCookies)
        XCTAssertFalse(assertionRequest.httpShouldUsePipelining)
    }
    
    func testSetDisableAllowsCellularAccessOption() throws {
        let assertionRequest = URLRequestChainTestsConstants.baseURL
            .request()
            .setNetworkOptions(.disableAllowsCellularAccess)
        
        XCTAssertFalse(assertionRequest.allowsCellularAccess)
    }
    
    func testSetDisableAllowsConstrainedNetworkAccessOption() throws {
        let assertionRequest = URLRequestChainTestsConstants.baseURL
            .request()
            .setNetworkOptions(.disableAllowsConstrainedNetworkAccess)
        
        XCTAssertFalse(assertionRequest.allowsConstrainedNetworkAccess)
    }
    
    func testSetDisableAllowsExpensiveNetworkAccessOption() throws {
        let assertionRequest = URLRequestChainTestsConstants.baseURL
            .request()
            .setNetworkOptions(.disableAllowsExpensiveNetworkAccess)
        
        XCTAssertFalse(assertionRequest.allowsExpensiveNetworkAccess)
    }
    
    func testSetDisableHttpShouldHandleCookiesOption() throws {
        let assertionRequest = URLRequestChainTestsConstants.baseURL
            .request()
            .setNetworkOptions(.disableHttpShouldHandleCookies)
        
        XCTAssertFalse(assertionRequest.httpShouldHandleCookies)
    }
    
    func testSetEnableHttpShouldUsePipeliningOption() throws {
        let assertionRequest = URLRequestChainTestsConstants.baseURL
            .request()
            .setNetworkOptions(.enableHttpShouldUsePipelining)
        
        XCTAssertTrue(assertionRequest.httpShouldUsePipelining)
    }
    
    func testSetMultipleOptions() throws {
        let assertionRequest = URLRequestChainTestsConstants.baseURL
            .request()
            .setNetworkOptions(
                .disableAllowsConstrainedNetworkAccess,
                .disableAllowsExpensiveNetworkAccess)
        
        XCTAssertFalse(assertionRequest.allowsConstrainedNetworkAccess)
        XCTAssertFalse(assertionRequest.allowsExpensiveNetworkAccess)
    }
    
    func testChainSetOptions() throws {
        let assertionRequest = URLRequestChainTestsConstants.baseURL
            .request()
            .setNetworkOptions(.disableAllowsConstrainedNetworkAccess)
            .setNetworkOptions(.disableAllowsExpensiveNetworkAccess)
        
        XCTAssertFalse(assertionRequest.allowsConstrainedNetworkAccess)
        XCTAssertFalse(assertionRequest.allowsExpensiveNetworkAccess)
    }
}
