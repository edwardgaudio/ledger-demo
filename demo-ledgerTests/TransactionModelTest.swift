//
//  TransactionModelTest.swift
//  demo-ledger
//
//  Created by edward on 11/22/15.
//  Copyright © 2015 edward gaudio. All rights reserved.
//

import XCTest
@testable import demo_ledger

class TransactionModelTest: XCTestCase {
    
    override func setUp() {
        super.setUp()
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }
    
    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        super.tearDown()
    }
    
    func testSubscript(){
        let transaction = TransactionModel(note: "Hey", amount: 4.50, type: TransactionModel.transactionType.expense);
        
        XCTAssertEqual(transaction["note"], "Hey")
        XCTAssertEqual(transaction["amount"], "4.50")
        XCTAssertEqual(transaction["note"], "Hey")
    }
    
    func testPerformanceExample() {
        // This is an example of a performance test case.
        self.measureBlock {
            // Put the code you want to measure the time of here.
            for _ in 1...10000 {
                _ = TransactionModel(note: "Hey", amount: 4.50, type: TransactionModel.transactionType.expense);
            }
        }
    }
        
}
