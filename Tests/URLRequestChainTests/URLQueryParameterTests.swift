//
//  URLQueryParameterTests.swift
//  URLRequestChainTests
//
//  Created by Carl Funk on 6/2/22.
//  Copyright © 2022 Carl Funk. All rights reserved.
//

import XCTest
@testable import URLRequestChain

final class URLQueryParameterTests: XCTestCase {
    
    private let queryParameterSeparator = URLRequestChainTestsConstants.queryParameterSeparator
    private let queryParameter1 = URLRequestChainTestsConstants.queryParameter1
    private let queryParameter2 = URLRequestChainTestsConstants.queryParameter2
    
    func testAddQueryParameters() throws {
        let assertionURL = URLRequestChainTestsConstants.baseURL
            .addQueryParameters(queryParameter1, queryParameter2)
        
        let assertionQuery = [
            queryParameter1.description,
            queryParameter2.description
        ].joined(separator: queryParameterSeparator)
        
        let assertion = assertionURL.query == assertionQuery
        
        XCTAssertTrue(assertion)
    }
    
    func testChainAddQueryParameters() throws {
        let assertionURL = URLRequestChainTestsConstants.baseURL
            .addQueryParameters(queryParameter1)
            .addQueryParameters(queryParameter2)
        
        let assertionQuery = [
            queryParameter1.description,
            queryParameter2.description
        ].joined(separator: queryParameterSeparator)
        
        let assertion = assertionURL.query == assertionQuery
        
        XCTAssertTrue(assertion)
    }
    
    func testQueryPropertyEmptyParameter() throws {
        let assertionURL = URLRequestChainTestsConstants.baseURL
        
        let assertionQuery: String? = nil
        
        let assertion = assertionURL.query == assertionQuery
        
        XCTAssertTrue(assertion)
    }
    
    func testAddEmptyQueryParameter() throws {
        let assertionURL = URLRequestChainTestsConstants.baseURL
            .addQueryParameters(URLQueryItem(name: "", value: ""))
        
        let assertionQuery: String? = nil
        
        let assertion = assertionURL.query == assertionQuery
        
        XCTAssertTrue(assertion)
    }
    
    func testAddDuplicateQueryParameter() throws {
        let assertionURL = URLRequestChainTestsConstants.baseURL
            .addQueryParameters(
                queryParameter1,
                queryParameter1)
        
        let assertionQuery = [
            queryParameter1.description,
            queryParameter1.description
        ].joined(separator: queryParameterSeparator)
        
        let assertion = assertionURL.query == assertionQuery
        
        XCTAssertTrue(assertion)
    }
}
