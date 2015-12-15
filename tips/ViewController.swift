//
//  ViewController.swift
//  tips
//
//  Created by Jayant Ahalawat on 12/10/15.
//  Copyright © 2015 Jayant Ahalawat. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var tipText: UILabel!
    @IBOutlet weak var totalText: UILabel!
    @IBOutlet var hBar: UIView!
    
    @IBOutlet var firstView: UIView!
    @IBOutlet weak var secondView: UIView!
    
    @IBOutlet weak var tipControl: UISegmentedControl!

    @IBOutlet weak var totalLabel: UILabel!
    
    @IBOutlet weak var billField: UITextField!
    @IBOutlet weak var tipLabel: UILabel!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        tipLabel.text = "$0.00"
        totalLabel.text = "$0.00"
        let defaults = NSUserDefaults.standardUserDefaults()
        let intValue = defaults.integerForKey("defaultTip")
        tipControl.selectedSegmentIndex =  intValue
        tipControl.hidden = true
        totalLabel.hidden = true
        tipLabel.hidden = true
        tipControl.hidden = true
        tipText.hidden = true
        totalText.hidden = true
        hBar.hidden = true
        
        
    }
    override func viewWillAppear(animated: Bool) {
        super.viewWillAppear(animated)
        self.firstView.alpha = 1
        self.secondView.alpha = 0
        UIView.animateWithDuration(0.4, animations: {
            // This causes first view to fade in and second view to fade out
            self.firstView.alpha = 0
            self.secondView.alpha = 1
        })
        
        
        
        let defaults = NSUserDefaults.standardUserDefaults()
        let intValue = defaults.integerForKey("defaultTip")
        tipControl.selectedSegmentIndex =  intValue
        onEditingChanged(tipControl)
    }
    

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBAction func onClick(sender: AnyObject) {
        tipControl.hidden = false
        totalLabel.hidden = false
        tipLabel.hidden = false
        tipControl.hidden = false
        tipText.hidden = false
        totalText.hidden = false
        hBar.hidden = false
        
    }

    @IBAction func onEditingChanged(sender: AnyObject) {
        
        
        var tipPercentages = [0.18, 0.20, 0.22]
        var tipPercentage = tipPercentages[tipControl.selectedSegmentIndex]
        
        var billAmount = billField.text!._bridgeToObjectiveC().doubleValue
        
        var tip = billAmount*tipPercentage
        
        
        
        var total = billAmount + tip
        
        tipLabel.text = "$\(tip)"
        totalLabel.text = "$\(total)"
        tipLabel.text = String(format: "$%.2f", tip)
        totalLabel.text = String(format: "$%.2f", total)
        
    }

    @IBAction func onTap(sender: AnyObject) {
        view.endEditing(true)
    }
    
}

