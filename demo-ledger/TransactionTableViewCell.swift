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
    
    var data:TransactionModel? {
        willSet(item) {
            
            dateFormatter.dateFormat = "h:mm a"
            let dateString = dateFormatter.stringFromDate((item!.date))
            self.NameDateLabel.text = "\(dateString) - \(item!.device_id)"
            
            self.NoteLabel.text = item!.note
            self.LocationLabel.text = item!.location
            self.BalanceLabel.text = "\(item!.balance)"
            
            switch item!.type {
                
            case TransactionModel.transactionType.expense:
                self.TransAmountLabel.text = "-\(item!.amount)"
                self.TransAmountLabel.textColor = UIColor.redColor()
            case TransactionModel.transactionType.deposit:
                self.TransAmountLabel.text = "\(item!.amount)"
                self.TransAmountLabel.textColor = UIColor.greenColor()
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
