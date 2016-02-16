//
//  ViewController.swift
//  MCContinuousLoopScrollView
//
//  Created by Michael Crouch on 2/16/16.
//  Copyright © 2016 MC. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var cyclesPerMinuteTextField: UITextField!
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        if cyclesPerMinuteTextField.text?.isEmpty == false, let destinationVC = segue.destinationViewController as? MKContinuousLoopViewController, let cyclesPerMinute = Double(cyclesPerMinuteTextField.text!)  {
            destinationVC.cyclesPerMinute = cyclesPerMinute
        }
    }
}
