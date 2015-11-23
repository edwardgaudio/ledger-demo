//
//  LedgerServices.swift
//  demo-ledger
//
//  Created by edward on 11/11/15.
//  Copyright © 2015 edward gaudio. All rights reserved.
//

import Foundation

class LedgerServices: NSObject {
    
    //Basically just a passthrough function for now to show the eventual use
    //of the service concept.  This way we can use this layer for network 
    //communication in the future and expance on the function below without 
    //polluting any of the models with functions that may be cross-model
    
    class func addTransactionToLedger(note:String, amount:Float, type:TransactionModel.transactionType){
        
        let newTrans = TransactionModel(note: note, amount: amount, type: type)
        
        LedgerModel.sharedInstance.transactions.append(newTrans)
        
        //Add callback function to this? Possibly notification?
       
    }
    
}