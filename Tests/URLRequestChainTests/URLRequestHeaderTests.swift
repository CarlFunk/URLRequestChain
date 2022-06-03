//
//  URLRequestHeaderTests.swift
//  URLRequestChainTests
//
//  Created by Carl Funk on 6/2/22.
//  Copyright © 2022 Carl Funk. All rights reserved.
//

import XCTest
@testable import URLRequestChain

final class URLRequestHeaderTests: XCTestCase {
    
    private let header1 = URLRequestChainTestsConstants.header1
    private let header2 = URLRequestChainTestsConstants.header2
    
    func testDefaultHeaders() throws {
        let assertionRequest = URLRequestChainTestsConstants.baseURL
            .request()
        
        let assertion = assertionRequest.allHTTPHeaderFields == nil
        
        XCTAssertTrue(assertion)
    }
    
    func testAddEmptyHeader() throws {
        let assertionRequest = URLRequestChainTestsConstants.baseURL
            .request()
            .addHeaders(URLRequestHeader(name: "", value: ""))
        
        let assertion = assertionRequest.allHTTPHeaderFields == nil
        
        XCTAssertTrue(assertion)
    }
    
    func testAddHeaders() throws {
        let assertionRequest = URLRequestChainTestsConstants.baseURL
            .request()
            .addHeaders(header1, header2)
        
        guard let assertionHeaders = assertionRequest.allHTTPHeaderFields else {
            XCTFail()
            return
        }
        
        XCTAssertTrue(assertionHeaders.count == 2)
        XCTAssertTrue(assertionHeaders.keys.contains(header1.name))
        XCTAssertTrue(assertionHeaders.keys.contains(header2.name))
        XCTAssertTrue(assertionHeaders.values.contains(header1.value))
        XCTAssertTrue(assertionHeaders.values.contains(header2.value))
    }
    
    func testChainAddHeaders() throws {
        let assertionRequest = URLRequestChainTestsConstants.baseURL
            .request()
            .addHeaders(header1)
            .addHeaders(header2)
        
        guard let assertionHeaders = assertionRequest.allHTTPHeaderFields else {
            XCTFail()
            return
        }
        
        XCTAssertTrue(assertionHeaders.count == 2)
        XCTAssertTrue(assertionHeaders.keys.contains(header1.name))
        XCTAssertTrue(assertionHeaders.keys.contains(header2.name))
        XCTAssertTrue(assertionHeaders.values.contains(header1.value))
        XCTAssertTrue(assertionHeaders.values.contains(header2.value))
    }
    
    func testAddDuplicateHeaders() throws {
        let assertionRequest = URLRequestChainTestsConstants.baseURL
            .request()
            .addHeaders(header1, header1)
        
        guard let assertionHeaders = assertionRequest.allHTTPHeaderFields else {
            XCTFail()
            return
        }
        
        XCTAssertTrue(assertionHeaders.count == 1)
        XCTAssertTrue(assertionHeaders.keys.contains(header1.name))
        XCTAssertTrue(assertionHeaders.values.contains(header1.value))
    }
    
    func testSetAuthorizationHeaders() throws {
        let assertionHeader = URLRequestHeader.authorization("A")
        let assertionRequest = URLRequestChainTestsConstants.baseURL
            .request()
            .setAuthorization(assertionHeader.value)
        
        guard let assertionHeaders = assertionRequest.allHTTPHeaderFields else {
            XCTFail()
            return
        }
        
        XCTAssertTrue(assertionHeaders.count == 1)
        XCTAssertTrue(assertionHeaders.keys.contains(assertionHeader.name))
        XCTAssertTrue(assertionHeaders.values.contains(assertionHeader.value))
    }
}
