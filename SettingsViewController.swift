//
//  SettingsViewController.swift
//  tips
//
//  Created by Jayant Ahalawat on 12/11/15.
//  Copyright © 2015 Jayant Ahalawat. All rights reserved.
//

import UIKit

class SettingsViewController: UIViewController {

    @IBOutlet weak var defTip: UISegmentedControl!
    @IBAction func onValueChange(sender: AnyObject) {
        let defaults = NSUserDefaults.standardUserDefaults()
        
        defaults.setInteger(defTip.selectedSegmentIndex, forKey: "defaultTip")
        defaults.synchronize()
        
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let defaults = NSUserDefaults.standardUserDefaults()
        let intValue = defaults.integerForKey("defaultTip")
        defTip.selectedSegmentIndex =  intValue

        // Do any additional setup after loading the view.
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
