//
//  TransactionModel.swift
//  demo-ledger
//
//  Created by edward on 11/11/15.
//  Copyright © 2015 edward gaudio. All rights reserved.
//

import UIKit

class TransactionModel: NSObject {
    
    enum transactionType {
        case expense
        case deposit
    }
    
    subscript(key: String) -> String {
        get {
            if key == "date" {
                return "\(date)"
            } else if key == "location" {
                return location
            }
            else if key == "device_id" {
                return UIDevice.currentDevice().name
            }
            else if key == "note" {
                return note
            }
            else if key == "amount" {
                return "\(amount)"
            }
            else if key == "balance" {
                return "\(balance)"
            }
            return ""
        }
    }
    
    var date:NSDate = NSDate()
    var location:String = LedgerModel.sharedInstance.location
    var device_id:String = UIDevice.currentDevice().name
    var note:String
    var amount:Float
    var type:transactionType
    var balance:Float = 0.00
    
    init(note:String, amount:Float, type:transactionType){
        self.note = note
        self.amount = amount
        self.type = type
        
        switch type {
        
        case transactionType.expense:
            LedgerModel.sharedInstance.balance -= self.amount
        case transactionType.deposit:
            LedgerModel.sharedInstance.balance += self.amount
        
        }
        
        self.balance = LedgerModel.sharedInstance.balance
        
    }
    
}
