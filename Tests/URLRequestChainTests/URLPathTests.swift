//
//  URLPathTests.swift
//  URLRequestChainTests
//
//  Created by Carl Funk on 6/2/22.
//  Copyright © 2022 Carl Funk. All rights reserved.
//

import XCTest
@testable import URLRequestChain

final class URLPathTests: XCTestCase {
    private enum TestPaths: URLPath {
        case empty
        case path1
        case path1WithBackslash
        case path2
        case path2WithBackslash
        
        var path: String {
            switch self {
            case .empty:                return ""
            case .path1:                return URLRequestChainTestsConstants.path1
            case .path1WithBackslash:   return URLRequestChainTestsConstants.pathSeparator
                                            + URLRequestChainTestsConstants.path1
            case .path2:                return URLRequestChainTestsConstants.path2
            case .path2WithBackslash:   return URLRequestChainTestsConstants.pathSeparator
                                            + URLRequestChainTestsConstants.path2
            }
        }
    }
    
    private let pathSeparator = URLRequestChainTestsConstants.pathSeparator
    private let path1 = URLRequestChainTestsConstants.path1
    private let path2 = URLRequestChainTestsConstants.path2
    
    func testAddPathsWithEmptyURLPathToURL() throws {
        let assertionURL = URLRequestChainTestsConstants.baseURL
            .addPaths(TestPaths.empty, TestPaths.empty, TestPaths.empty)
        
        let assertionURLString = URLRequestChainTestsConstants.baseURL.absoluteString + pathSeparator
        
        let assertion = assertionURL.absoluteString == assertionURLString
        
        XCTAssertTrue(assertion)
    }
    
    func testAddPathsWithURLPathToURL() throws {
        let assertionURL = URLRequestChainTestsConstants.baseURL
            .addPaths(TestPaths.path1, TestPaths.path2)
        
        let assertionURLString = [
            URLRequestChainTestsConstants.baseURL.absoluteString,
            path1,
            path2
        ].joined(separator: pathSeparator)
        
        let assertion = assertionURL.absoluteString == assertionURLString
        
        XCTAssertTrue(assertion)
    }
    
    func testAddPathsWithURLPathIncludingBackslashToURL() throws {
        let assertionURL = URLRequestChainTestsConstants.baseURL
            .addPaths(TestPaths.path1WithBackslash, TestPaths.path2WithBackslash)
        
        let assertionURLString = [
            URLRequestChainTestsConstants.baseURL.absoluteString,
            path1,
            path2
        ].joined(separator: pathSeparator)
        
        let assertion = assertionURL.absoluteString == assertionURLString
        
        XCTAssertTrue(assertion)
    }
    
    func testChainAddPathsWithURLPathToURL() throws {
        let assertionURL = URLRequestChainTestsConstants.baseURL
            .addPaths(TestPaths.path1)
            .addPaths(TestPaths.path2)
        
        let assertionURLString = [
            URLRequestChainTestsConstants.baseURL.absoluteString,
            path1,
            path2
        ].joined(separator: pathSeparator)
        
        let assertion = assertionURL.absoluteString == assertionURLString
        
        XCTAssertTrue(assertion)
    }
    
    func testAddPathsWithEmptyStringsToURL() throws {
        let assertionURL = URLRequestChainTestsConstants.baseURL
            .addPaths("", "", "")
        
        let assertionURLString = URLRequestChainTestsConstants.baseURL.absoluteString + pathSeparator
        
        let assertion = assertionURL.absoluteString == assertionURLString
        
        XCTAssertTrue(assertion)
    }
    
    func testAddPathsWithStringsToURL() throws {
        let assertionURL = URLRequestChainTestsConstants.baseURL
            .addPaths(path1, path2)
        
        let assertionURLString = [
            URLRequestChainTestsConstants.baseURL.absoluteString,
            path1,
            path2
        ].joined(separator: pathSeparator)
        
        let assertion = assertionURL.absoluteString == assertionURLString
        
        XCTAssertTrue(assertion)
    }
    
    func testAddPathsWithStringsIncludingBackslashToURL() throws {
        let assertionURL = URLRequestChainTestsConstants.baseURL
            .addPaths(pathSeparator + path1, pathSeparator + path2)
        
        let assertionURLString = [
            URLRequestChainTestsConstants.baseURL.absoluteString,
            path1,
            path2
        ].joined(separator: pathSeparator)
        
        let assertion = assertionURL.absoluteString == assertionURLString
        
        XCTAssertTrue(assertion)
    }
    
    func testChainAddPathsWithStringsToURL() throws {
        let assertionURL = URLRequestChainTestsConstants.baseURL
            .addPaths(path1)
            .addPaths(path2)
        
        let assertionURLString = [
            URLRequestChainTestsConstants.baseURL.absoluteString,
            path1,
            path2
        ].joined(separator: pathSeparator)
        
        let assertion = assertionURL.absoluteString == assertionURLString
        
        XCTAssertTrue(assertion)
    }
}
