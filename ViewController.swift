//
//  ViewController.swift
//  TipCalculator
//
//  Created by Amanda Green on 9/23/16.
//  Copyright © 2016 Amanda Green. All rights reserved.
//

import UIKit
import CoreLocation

class ViewController: UIViewController {

    @IBOutlet weak var billField: UITextField!
    @IBOutlet weak var tipLabel: UILabel!
    @IBOutlet weak var totalLabel: UILabel!
    @IBOutlet weak var tipControl: UISegmentedControl!
    
    //Global Variables
    let tipPercentages = [0.18, 0.2, 0.25]
    let defaults = UserDefaults.standard
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func viewDidAppear(_ animated: Bool) {
        keepThingsConstant()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


    //UI Control Events
    @IBAction func onTap(_ sender: AnyObject) {
        view.endEditing(true)
        keepThingsConstant()
    }
    
    @IBAction func calculateTip(_ sender: AnyObject) {
        updateUI()
        keepThingsConstant()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        setDefaults()
        updateUI()
        billField.text = String(defaults.double(forKey: "lastBillAmount"))
    }
    
    //Controller Functions
    func setDefaults(){
        tipControl.selectedSegmentIndex = defaults.integer(forKey: "tipPercent")
        keepThingsConstant()
    }
    
    //Keep certain settings/values the same always
    func keepThingsConstant(){
        billField.becomeFirstResponder()
        defaults.set(Double(billField.text!) ?? 0, forKey: "lastBillAmount")
    }

    func updateUI(){
        let billAmount = Double(billField.text!) ?? 0
        let tip = billAmount * tipPercentages[tipControl.selectedSegmentIndex]
        let total = billAmount + tip

        tipLabel.text = formatToLocalCurrency(amount: tip)
        totalLabel.text = formatToLocalCurrency(amount: total)
    }
    
    
    func formatToLocalCurrency(amount: Double) -> String{
        let currencyFormatter = NumberFormatter()
        currencyFormatter.usesGroupingSeparator = true
        currencyFormatter.numberStyle = NumberFormatter.Style.currency
        // localize to your grouping and decimal separator
        currencyFormatter.locale = Locale.current

        return currencyFormatter.string(for: amount)!
    }
}

