//
//  ViewController.swift
//  demo-ledger
//
//  Created by edward on 11/11/15.
//  Copyright © 2015 edward gaudio. All rights reserved.
//

import UIKit
import CoreLocation

class LedgerViewController: UIViewController, UITableViewDataSource, UITableViewDelegate,CLLocationManagerDelegate {
    
    var total:Float = 0.0
    let locationManager = CLLocationManager()
    
    @IBOutlet var AmountInput: UITextField!
    @IBOutlet var NoteInput: UITextField!
    @IBOutlet var LedgerTable: UITableView!
    
    override init(nibName nibNameOrNil: String?, bundle nibBundleOrNil: NSBundle?) {
        
        super.init(nibName: nibNameOrNil, bundle: nibBundleOrNil);
    }
    
    required init(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = "Transactions"
        self.LedgerTable.registerNib(UINib(nibName: "TransactionTableViewCell", bundle: nil), forCellReuseIdentifier: "tranactionCell")
        
        locationManager.delegate = self
        locationManager.desiredAccuracy = kCLLocationAccuracyBest
        locationManager.requestWhenInUseAuthorization()
        
    }
    
    override func viewWillAppear(animated: Bool) {
        locationManager.startUpdatingLocation()
    }
    
    //Two functions below could be combined to stay more dry, but I'm good with this
    @IBAction func depositAction(sender: AnyObject) {
        
        
        print("Deposit:\(NoteInput.text) :: \(AmountInput.text)")
        
        //Also validate here
        if self.AmountInput.isFirstResponder(){
            self.AmountInput.resignFirstResponder()
            
            LedgerServices.addTransactionToLedger(NoteInput.text!, amount:AmountInput.text!.floatValue , type: .deposit)
            self.LedgerTable.reloadData()
        }


    }
    
    @IBAction func expenseAction(sender: AnyObject) {
        print("Expense:\(NoteInput.text) :: \(AmountInput.text)")
        
        //Also validate here
        
        if self.AmountInput.isFirstResponder(){
            self.AmountInput.resignFirstResponder()
        
            LedgerServices.addTransactionToLedger(NoteInput.text!, amount:AmountInput.text!.floatValue , type: .expense)
            self.LedgerTable.reloadData()        }
    }
    
    //MARK CLLocationDelegate
    func locationManager(manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        CLGeocoder().reverseGeocodeLocation(manager.location!, completionHandler: {(placemarks, error)-> Void in
            if (error != nil) {
                print("Reverse geocoder failed with error" + error!.localizedDescription)
                return
            }
            
            if placemarks!.count > 0 {
                let pm = placemarks![0] as CLPlacemark
                self.displayLocationInfo(pm)
            } else {
                print("Problem with the data received from geocoder")
            }
        })

    }
    
    func locationManager(manager: CLLocationManager, didFailWithError error: NSError) {
        print("Error while updating location " + error.localizedDescription)
    }
    
    
    func displayLocationInfo(placemark: CLPlacemark) {
        //stop updating location to save battery life
        locationManager.stopUpdatingLocation()
        ledger.location = placemark.locality!
    }

    
    ///MARK UITextFieldDelegates
    
    func textFieldDidBeginEditing(textField: UITextField!) {    //delegate method
        
    }
    
    func textFieldShouldEndEditing(textField: UITextField!) -> Bool {
        
        //Scan here for validation
        
        return true
    }
    
    func textFieldShouldReturn(textField: UITextField!) -> Bool {
        
        textField.resignFirstResponder()
        
        return true
    }
    
    ///MARK UITableViewDataSource
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return ledger.transactions.count;
    }
    
    func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return 1;
    }
    
    ///MARK UITableViewDelegate
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCellWithIdentifier("tranactionCell", forIndexPath: indexPath) as! TransactionTableViewCell
        let item = ledger.transactions.reverse()[indexPath.row]
        
        cell.data = item
        
        return cell
    }
    
    func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        
        let data = ledger.transactions.reverse()[indexPath.row]
        let detailsController = TransactionDetailViewController()
        
        detailsController.TransDetails = data
        self.navigationController?.pushViewController(detailsController, animated: true)
        
    }
    
    func tableView(tableView: UITableView, heightForRowAtIndexPath indexPath: NSIndexPath) -> CGFloat {
        return 80.0;
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
   


}

