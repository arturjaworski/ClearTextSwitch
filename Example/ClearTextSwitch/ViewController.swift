//
//  ViewController.swift
//  ClearTextSwitch
//
//  Created by Artur Jaworski on 12/08/2015.
//  Copyright (c) 2015 Artur Jaworski. All rights reserved.
//

import UIKit
import ClearTextSwitch

class ViewController: UIViewController, ClearTextSwitchDelegate {

    @IBOutlet weak var firstClearTextSwitch: ClearTextSwitch!
    @IBOutlet weak var secondClearTextSwitch: ClearTextSwitch!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.firstClearTextSwitch.selectedBackgroundColor = UIColor.redColor()
        self.firstClearTextSwitch.delegate = self
        self.firstClearTextSwitch.title = "First"

        self.secondClearTextSwitch.selectedBackgroundColor = UIColor.yellowColor()
        self.secondClearTextSwitch.title = "2."
        self.secondClearTextSwitch.delegate = self
    }
    
    func clearTextSwitchDidChange(clearTextSwitch: ClearTextSwitch) {
        print("clearTextSwitchDidChange to \(clearTextSwitch.selected)")
    }

}

