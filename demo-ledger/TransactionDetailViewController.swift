//
//  TransactionDetailViewController.swift
//  demo-ledger
//
//  Created by edward on 11/11/15.
//  Copyright © 2015 edward gaudio. All rights reserved.
//

import UIKit

class TransactionDetailViewController: UIViewController {

    var TransDetails:TransactionModel?
    let configFile = "Config.txt"
    var Yindex:CGFloat = 80.0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.view.backgroundColor = UIColor.whiteColor()
        
        if let _ = self.TransDetails{
            self.readConfig()
        }
        
        
    }
    
    func readConfig(){
        
        guard let path = NSBundle.mainBundle().pathForResource("Config", ofType: "txt") else {
            print("Can not find file")
            return
        }
        
        do {
            let content = try String(contentsOfFile:path, encoding: NSUTF8StringEncoding)
            self.template(content)
        } catch _ as NSError {
            print("Was an error:)")
        }
    }
    
    func template(content:String){
        
        let slugArray = content.componentsSeparatedByString("\n")
        print("Content and slug array: \(content), \(slugArray)")
        
        let betweenBracketPattern = "\\{\\{.+?\\}\\}"
        
        do {
            
            let regex = try NSRegularExpression(pattern: betweenBracketPattern, options: NSRegularExpressionOptions.AllowCommentsAndWhitespace)
            
            for slug in slugArray {
                
                let str = slug
        
                let matches = regex.matchesInString(str, options:.WithoutAnchoringBounds, range: NSMakeRange(0, str.characters.count ))

                for match in matches {
                    let newRange = NSMakeRange(match.range.location + 2, match.range.length - 4)
                    let field = (str as NSString).substringWithRange(newRange)//cast to NSString is required to match range format.
                    print("found= \(field)")
                    
                    let contentRect = CGRectMake(10.0, Yindex, 300.0, 50.0)
                    let contentLabel = UILabel(frame: contentRect)
                    contentLabel.text = " \(field) : \(TransDetails![field])"
                    
                    self.view.addSubview(contentLabel)
                    Yindex += 50.0
                }
                
            }
            
        }
        catch _ as NSError {
            print("Was a regex error")
        }
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
