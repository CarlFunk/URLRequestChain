//
//  URLRequestMethodTests.swift
//  URLRequestChainTests
//
//  Created by Carl Funk on 6/2/22.
//  Copyright © 2022 Carl Funk. All rights reserved.
//

import XCTest
@testable import URLRequestChain

final class URLRequestMethodTests: XCTestCase {
    
    func testSetDeleteURLRequestMethod() throws {
        let assertionRequest = URLRequestChainTestsConstants.baseURL
            .request()
            .setMethod(.DELETE)
        
        let assertionRequestMethodString = URLRequestMethod.DELETE.rawValue
        
        let assertion = assertionRequest.httpMethod == assertionRequestMethodString
        
        XCTAssertTrue(assertion)
    }
    
    func testSetGetURLRequestMethod() throws {
        let assertionRequest = URLRequestChainTestsConstants.baseURL
            .request()
            .setMethod(.GET)
        
        let assertionRequestMethodString = URLRequestMethod.GET.rawValue
        
        let assertion = assertionRequest.httpMethod == assertionRequestMethodString
        
        XCTAssertTrue(assertion)
    }
    
    func testSetPatchURLRequestMethod() throws {
        let assertionRequest = URLRequestChainTestsConstants.baseURL
            .request()
            .setMethod(.PATCH)
        
        let assertionRequestMethodString = URLRequestMethod.PATCH.rawValue
        
        let assertion = assertionRequest.httpMethod == assertionRequestMethodString
        
        XCTAssertTrue(assertion)
    }
    
    func testSetPostURLRequestMethod() throws {
        let assertionRequest = URLRequestChainTestsConstants.baseURL
            .request()
            .setMethod(.POST)
        
        let assertionRequestMethodString = URLRequestMethod.POST.rawValue
        
        let assertion = assertionRequest.httpMethod == assertionRequestMethodString
        
        XCTAssertTrue(assertion)
    }
    
    func testSetPutURLRequestMethod() throws {
        let assertionRequest = URLRequestChainTestsConstants.baseURL
            .request()
            .setMethod(.PUT)
        
        let assertionRequestMethodString = URLRequestMethod.PUT.rawValue
        
        let assertion = assertionRequest.httpMethod == assertionRequestMethodString
        
        XCTAssertTrue(assertion)
    }
    
    func testChainSetURLRequestMethod() throws {
        let assertionRequest = URLRequestChainTestsConstants.baseURL
            .request()
            .setMethod(.DELETE)
            .setMethod(.GET)
        
        let assertionRequestMethodString = URLRequestMethod.GET.rawValue
        
        let assertion = assertionRequest.httpMethod == assertionRequestMethodString
        
        XCTAssertTrue(assertion)
    }
}
