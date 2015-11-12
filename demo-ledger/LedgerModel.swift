//
//  LedgerModel.swift
//  demo-ledger
//
//  Created by edward on 11/11/15.
//  Copyright © 2015 edward gaudio. All rights reserved.
//

import Foundation

let ledger = LedgerModel()//Quicky singleton

class LedgerModel: NSObject {
    
    var name = "The ledger"
    var balance:Float = 0.00;
    var location = "New York, New York"
    
    var transactions:[TransactionModel] = []
    
    subscript(index: Int) -> TransactionModel? {
        get {
            if index > 0 && index < transactions.count {
                return transactions[index]
            }
            return nil
        }
    }

    
    //TODO: Subscript this to return the transactions row
}
