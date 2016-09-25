//
//  SettingsViewController.swift
//  TipCalculator
//
//  Created by Amanda Green on 9/24/16.
//  Copyright © 2016 Amanda Green. All rights reserved.
//

import UIKit

class SettingsViewController: UIViewController {
    
    let defaults = UserDefaults.standard
    @IBOutlet weak var defaultTipPercent: UISegmentedControl!


    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    //@IBAction func changeDefaultTipPercent(sender: AnyObject) {
        
    
   // }

    @IBAction func changeDefaultTipPercent(_ sender: AnyObject) {
        let tipPercent = defaultTipPercent.selectedSegmentIndex
        defaults.set(tipPercent, forKey: "tipPercent")
        print(tipPercent)
        defaults.synchronize()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        getDefaults()
    }
    
    func getDefaults(){
        let defaults = UserDefaults.standard
        
        defaultTipPercent.selectedSegmentIndex = defaults.integer(forKey: "tipPercent")
    }
    
    
    
}
