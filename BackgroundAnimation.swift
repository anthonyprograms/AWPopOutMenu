//
//  BackgroundAnimation.swift
//  PopOutMenu
//
//  Created by Anthony Williams on 6/12/15.
//  Copyright (c) 2015 Anthony Williams. All rights reserved.
//

import UIKit

class BackgroundAnimation: UIView {
    
    let screenSize: CGRect = UIScreen.mainScreen().bounds

    override init(frame: CGRect){
        super.init(frame: frame)
        
        backgroundAnimation()
    }

    required init(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func backgroundAnimation(){
        for i in 0...15{
            let randomBeginning = CGFloat(arc4random_uniform(UInt32(screenSize.width)))
            
            let circle = UIView()
            circle.frame = CGRectMake(randomBeginning, screenSize.height+50, 25, 25)
            circle.layer.masksToBounds = true
            circle.layer.cornerRadius = circle.frame.size.height/2
            circle.backgroundColor = UIColor.blueColor()
            circle.backgroundColor = UIColor(patternImage: UIImage(named: "MiniAnthony") as UIImage!)
            self.addSubview(circle)
            
            let randomEnding = CGFloat(arc4random_uniform(UInt32(screenSize.width)))
            
            let path = UIBezierPath()
            path.moveToPoint(CGPointMake(randomEnding, screenSize.height+50))
            path.addCurveToPoint(CGPointMake(randomEnding, -50), controlPoint1: CGPointMake(randomEnding, screenSize.height+24), controlPoint2: CGPointMake(randomEnding, screenSize.height/6))
            
            let anim = CAKeyframeAnimation(keyPath: "position")
            anim.path = path.CGPath
            anim.repeatCount = Float.infinity
            anim.duration = Double(arc4random_uniform(50)+100)/10
            anim.timeOffset = Double(arc4random_uniform(800))
            
            circle.layer.addAnimation(anim, forKey: "animate position along path")
        }
    }

}
