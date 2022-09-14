//
//  ViewControllerTests.swift
//  ProjectFourTests
//
//  Created by Mateus Amorim on 12/09/22.
//

import XCTest
@testable import ProjectFour
class ViewControllerTests: XCTestCase {

    let sud = ViewController()
    
    func loadViewTest() {
        XCTAssertEqual(sud.view.subviews.count, 1)
        
    }
    
