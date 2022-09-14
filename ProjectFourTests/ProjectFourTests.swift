//
//  ProjectFourTests.swift
//  ProjectFourTests
//
//  Created by Mateus Amorim on 09/09/22.
//

import XCTest
@testable import ProjectFour

class ProjectFourTests: XCTestCase {
    


    override class func setUp() {
"""
SetUp: Usado para configurar variáveis para os testes
"""
        // This is the setUp() class method.
        // XCTest calls it before calling the first test method.
        // Set up any overall initial state here.
    }
    
    override class func tearDown() {
"""
tearDown: Usado para limpar as configurações que fizemos no SetUp
"""
        // This is the tearDown() class method.
        // XCTest calls it after the last test method completes.
        // Perform any overall cleanup here.
    }
    
    override func setUpWithError() throws {
        """
        SetUpWithError: Usado para configurar variáveis para os testes
        """
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }

    override func tearDownWithError() throws {
        """
        tearDownWithError: Usado para limpar as configurações que fizemos no SetUp
        """
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }
    


    func testExample() throws {
        
       
"""
testExample: aqui são rodados os testes de verdde. então colocar as funções aqui.
"""
        
        // This is an example of a functional test case.
        // Use XCTAssert and related functions to verify your tests produce the correct results.
        // Any test you write for XCTest can be annotated as throws and async.
        // Mark your test throws to produce an unexpected failure when your test encounters an uncaught error.
        // Mark your test async to allow awaiting for asynchronous code to complete. Check the results with assertions afterwards.
    }

    func testPerformanceExample() throws {
        // This is an example of a performance test case.
        self.measure {
            // Put the code you want to measure the time of here.
        }
    }

}
