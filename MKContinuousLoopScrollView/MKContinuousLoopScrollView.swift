//
//  MKContinuousLoopScrollView.swift
//  Knomad
//
//  Created by Michael Crouch on 1/25/16.
//  Copyright © 2016 Michael Crouch. All rights reserved.
//

import UIKit
import Cartography

class MKContinuousLoopScrollView: UIScrollView, UIScrollViewDelegate {
    
    var initialOffset: CGPoint = CGPointZero
    var imageSize: CGSize = CGSizeZero

    /**
     This method must be called no earlier than its UIViewController's viewWillAppear method; the view does not know its size till then
    */
    init(atBottomOfView view: UIView, var image: UIImage) {
        
        super.init(frame: view.bounds)
        
        let multiplier: CGFloat = view.frame.size.height / image.size.height
        image = image.resize(CGSize(width: image.size.width * multiplier * image.scale, height: image.size.height * multiplier * image.scale))!
        
        imageSize = image.size
        initialOffset = CGPointMake(image.size.width, 0)
        
        view.insertSubview(self, atIndex: 0)
        
        let contentView = UIView(frame: CGRectMake(0, 0, imageSize.width * 3, imageSize.height))
        addSubview(contentView)
        constrain(contentView) { (aView) -> () in
            aView.width == imageSize.width * 3
            aView.height == imageSize.height
            aView.top == aView.superview!.top
            aView.right == aView.superview!.right
            aView.bottom == aView.superview!.bottom
            aView.left == aView.superview!.left
        }
        let imageView1 = UIImageView(image: image)
        contentView.addSubview(imageView1)
        constrain(imageView1) { (aView) -> () in
            aView.top == aView.superview!.top
            aView.width == imageSize.width
            aView.bottom == aView.superview!.bottom
            aView.left == aView.superview!.left
        }
        let imageView2 = UIImageView(image: image)
        contentView.addSubview(imageView2)
        constrain(imageView2) { (aView) -> () in
            aView.top == aView.superview!.top
            aView.width == imageSize.width
            aView.bottom == aView.superview!.bottom
            aView.center == aView.superview!.center
        }
        let imageView3 = UIImageView(image: image)
        contentView.addSubview(imageView3)
        constrain(imageView3) { (aView) -> () in
            aView.top == aView.superview!.top
            aView.width == imageSize.width
            aView.bottom == aView.superview!.bottom
            aView.right == aView.superview!.right
        }
        
        setContentOffset(initialOffset, animated: false)
        
        setNeedsLayout()
        layoutIfNeeded()
    }
    
    func scrollInfinitelyWithRate(rate: Double) { // rate = # of times it will scroll the frame's full width per minute
        setContentOffset(initialOffset, animated: false)
        UIView.animateWithDuration(60 / rate, delay: 0, options: [.CurveLinear], animations: { () -> Void in
            self.setContentOffset(CGPoint(x: self.contentOffset.x + self.imageSize.width, y: self.contentOffset.y), animated: false)
            }) { (success) -> Void in
                guard self.window != nil else {
                    return // view is not visible; controller is responsible for restarting animation when it reappears
                }
                self.scrollInfinitelyWithRate(rate)
        }
    }

    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

}