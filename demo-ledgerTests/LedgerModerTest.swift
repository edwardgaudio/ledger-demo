//
//  demo_ledgerTests.swift
//  demo-ledgerTests
//
//  Created by edward on 11/11/15.
//  Copyright © 2015 edward gaudio. All rights reserved.
//

import XCTest
@testable import demo_ledger

class demo_ledgerTests: XCTestCase {
    
    override func setUp() {
        super.setUp()
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }
    
    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        super.tearDown()
    }
    
    func testLedgerModel(){
        XCTAssertEqual(LedgerModel.sharedInstance.balance, 0.00)
        XCTAssertEqual(LedgerModel.sharedInstance.name, "The ledger")
        //TODO: find way to test after core location comes back
        XCTAssertEqual(LedgerModel.sharedInstance.location, "New York, New York")
    }
    
    func testLedgerTransactions(){
        LedgerServices.addTransactionToLedger("Hey", amount: 4.50, type: TransactionModel.transactionType.expense)
        
        let transactions = LedgerModel.sharedInstance.transactions
        
        XCTAssertEqual(transactions[0].note, "Hey")
    }
    
    func testPerformanceExample() {
        // This is an example of a performance test case.
        self.measureBlock {
            // Put the code you want to measure the time of here.
        }
    }
    
}
