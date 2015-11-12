//
//  TransactionTableViewCell.swift
//  demo-ledger
//
//  Created by edward on 11/11/15.
//  Copyright © 2015 edward gaudio. All rights reserved.
//

import UIKit

class TransactionTableViewCell: UITableViewCell {

    @IBOutlet var NameDateLabel: UILabel!
    @IBOutlet var NoteLabel: UILabel!
    @IBOutlet var TransAmountLabel: UILabel!
    @IBOutlet var LocationLabel: UILabel!
    @IBOutlet var BalanceLabel: UILabel!
    let dateFormatter = NSDateFormatter()
    let numberFormatter = NSNumberFormatter()
    
    var data:TransactionModel? {
        willSet(item) {
            
            numberFormatter.numberStyle = .CurrencyStyle
            dateFormatter.dateFormat = "h:mm a"
            
            let dateString = dateFormatter.stringFromDate((item!.date))
            self.NameDateLabel.text = "\(dateString) - \(item!.device_id)"
            
            self.NoteLabel.text = item!.note
            self.LocationLabel.text = item!.location
            self.BalanceLabel.text = numberFormatter.stringFromNumber(item!.balance)!
            
            switch item!.type {
                
            case TransactionModel.transactionType.expense:
                self.TransAmountLabel.text = "-\(numberFormatter.stringFromNumber(item!.amount)!)"
                self.TransAmountLabel.textColor = UIColor.redColor()
            case TransactionModel.transactionType.deposit:
                self.TransAmountLabel.text = numberFormatter.stringFromNumber(item!.amount)!
                self.TransAmountLabel.textColor = UIColor(red: 0.0, green: 197.0, blue: 0.0, alpha: 1.0)
            }

            
        }
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
