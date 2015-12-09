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
    private lazy var thirdClearTextSwitch: ClearTextSwitch = {
        let obj = ClearTextSwitch(frame: CGRectMake(20,400,200,50))
        obj.delegate = self
        obj.normalBackgroundColor = UIColor.greenColor()
        obj.selectedBackgroundColor = UIColor.grayColor()
        obj.title = "Third"
        return obj
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.firstClearTextSwitch.selectedBackgroundColor = UIColor.redColor()
        self.firstClearTextSwitch.delegate = self
        self.firstClearTextSwitch.title = "First"

        self.secondClearTextSwitch.selectedBackgroundColor = UIColor.yellowColor()
        self.secondClearTextSwitch.title = "2."
        self.secondClearTextSwitch.delegate = self
        
        self.view.addSubview(self.thirdClearTextSwitch)
    }
    
    func clearTextSwitchDidChange(clearTextSwitch: ClearTextSwitch) {
        print("clearTextSwitchDidChange to \(clearTextSwitch.selected)")
    }

}

