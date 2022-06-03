//
//  URLRequestBodyTests.swift
//  URLRequestChainTests
//
//  Created by Carl Funk on 6/2/22.
//  Copyright © 2022 Carl Funk. All rights reserved.
//

import XCTest
@testable import URLRequestChain

final class URLRequestBodyTests: XCTestCase {
    
    func testDefaultBody() throws {
        let assertionRequest = URLRequestChainTestsConstants.baseURL
            .request()
        
        let assertion = assertionRequest.httpBody == nil
        
        XCTAssertTrue(assertion)
    }
    
    func testSetDataBody() throws {
        let assertionData = Data(base64Encoded: "SGVsbG8=")
        let assertionRequest = URLRequestChainTestsConstants.baseURL
            .request()
            .setBody(assertionData)
        
        let assertion = assertionRequest.httpBody == assertionData
        
        XCTAssertTrue(assertion)
    }
    
    func testSetEncodableDataBody() throws {
        struct TestData: Codable {
            let value: Int
        }
        
        let assertionData = TestData(value: Int.random(in: 0...100))
        let assertionRequest = URLRequestChainTestsConstants.baseURL
            .request()
            .setBody(assertionData)
        
        guard
            let assertionBody = assertionRequest.httpBody,
            let testData = try? JSONDecoder().decode(TestData.self, from: assertionBody)
        else {
            XCTFail()
            return
        }
        
        let assertion = testData.value == assertionData.value
        
        XCTAssertTrue(assertion)
    }
}
