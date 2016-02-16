//
//  MKContinuousLoopViewController.swift
//  MKContinuousLoopViewController
//
//  Created by Michael Crouch on 2/16/16.
//  Copyright © 2016 MC. All rights reserved.
//

import UIKit

class MKContinuousLoopViewController: UIViewController {
    
    var cyclesPerMinute: Double = 1
    
    override func viewWillAppear(animated: Bool) {
        super.viewWillAppear(animated)
        let backgroundscrollView = MKContinuousLoopScrollView(atBottomOfView: view, image: UIImage(named: "MODIS_Map")!)
        backgroundscrollView.scrollInfinitelyWithRate(cyclesPerMinute)
    }
    
    @IBAction func closeButtonTapped(sender: AnyObject) {
        dismissViewControllerAnimated(true, completion: nil)
    }
}
