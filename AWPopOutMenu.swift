//
//  AWPopOutMenu.swift
//  PopOutMenu
//
//  Created by Anthony Williams on 6/9/15.
//  Copyright (c) 2015 Anthony Williams. All rights reserved.
//

import UIKit

class AWPopOutMenu: UIView {
    
    // Defaults
    var defaultBorderColor = UIColor.blackColor().CGColor
    var defaultBackgroundColor = UIColor.clearColor()
    var defaultBorderWidth = (CGFloat)(1.0)
    
    var menuButton = UIButton()
    var leftMenuButton = UIButton()
    var rightMenuButton = UIButton()
    var outerLeftMenuButton = UIButton()
    var outerRightMenuButton = UIButton()
    var menuPressed = Bool()
    
    let screenSize: CGRect = UIScreen.mainScreen().bounds

    override init(frame: CGRect) {
        super.init(frame: frame)
        
        // Center the view in the middle of the screen
        self.center = CGPointMake(screenSize.width/2, self.frame.origin.y)
        self.layer.cornerRadius = self.frame.size.height/2
        self.layer.borderColor = defaultBorderColor
        self.layer.borderWidth = defaultBorderWidth
        self.layer.masksToBounds = true
        self.backgroundColor = defaultBackgroundColor
        
        setupView()
    }
    
    required init(coder aDecoder: NSCoder) {
        fatalError("This class does not support NSCoding")
    }

    // MARK: Setup View and Buttons
    
    func setupView(){
        menuPressed = false;

        // Start buttons below menu button and extend them out to their spots
        leftMenuButton.frame = CGRectMake(0, 0, self.frame.size.height, self.frame.size.height)
        leftMenuButton.center = CGPointMake(self.frame.size.width/2, self.frame.size.height/2)
        leftMenuButton.setImage(UIImage(named: "Businessman Filled-50"), forState: .Normal)
        leftMenuButton.addTarget(self, action: "leftMenuButtonPressed:", forControlEvents: UIControlEvents.TouchUpInside)
        leftMenuButton.hidden = true
        self.addSubview(leftMenuButton)
        
        rightMenuButton.frame = CGRectMake(0, 0, self.frame.size.height, self.frame.size.height)
        rightMenuButton.center = CGPointMake(self.frame.size.width/2, self.frame.size.height/2)
        rightMenuButton.setImage(UIImage(named: "Horse-50"), forState: .Normal)
        rightMenuButton.addTarget(self, action: "rightMenuButtonPressed:", forControlEvents: UIControlEvents.TouchUpInside)
        rightMenuButton.hidden = true
        self.addSubview(rightMenuButton)
        
        outerLeftMenuButton.frame = CGRectMake(0, 0, self.frame.size.height, self.frame.size.height)
        outerLeftMenuButton.center = CGPointMake(self.frame.size.width/2, self.frame.size.height/2)
        outerLeftMenuButton.setImage(UIImage(named: "Mac Client-50"), forState: .Normal)
        outerLeftMenuButton.addTarget(self, action: "outerLeftMenuButtonPressed:", forControlEvents: UIControlEvents.TouchUpInside)
        outerLeftMenuButton.hidden = true
        self.addSubview(outerLeftMenuButton)
        
        outerRightMenuButton.frame = CGRectMake(0, 0, self.frame.size.height, self.frame.size.height)
        outerRightMenuButton.center = CGPointMake(self.frame.size.width/2, self.frame.size.height/2)
        outerRightMenuButton.setImage(UIImage(named: "Soundcloud-50"), forState: .Normal)
        outerRightMenuButton.addTarget(self, action: "outerRightMenuButtonPressed:", forControlEvents: UIControlEvents.TouchUpInside)
        outerRightMenuButton.hidden = true
        self.addSubview(outerRightMenuButton)
        
        menuButton.frame = CGRectMake(0, 0, self.frame.size.height, self.frame.size.height)
        menuButton.center = CGPointMake(self.frame.size.width/2, self.frame.size.height/2)
        menuButton.setTitle("+", forState: UIControlState.Normal)
        menuButton.setTitleColor(UIColor.blackColor(), forState: UIControlState.Normal)
        menuButton.addTarget(self, action: "menuButtonPressed:", forControlEvents: UIControlEvents.TouchUpInside)
        self.addSubview(menuButton)
    }
    
    // MARK: Main Menu Button
    
    func menuButtonPressed(sender: UIButton){
        UIView.animateWithDuration(0.3, animations: { () -> Void in
            if (!self.menuPressed){
                self.mainMenuRotation(self.menuButton)
                
                self.frame = CGRectMake(10, self.frame.origin.y, self.screenSize.width-20, self.frame.size.height)
                
                self.menuButton.center = CGPointMake(self.frame.size.width/2, self.frame.size.height/2)
                self.leftMenuButton.center = CGPointMake(self.frame.size.width/2-60, self.frame.size.height/2)
                self.rightMenuButton.center = CGPointMake(self.frame.size.width/2+60, self.frame.size.height/2)
                self.outerLeftMenuButton.center = CGPointMake(self.frame.size.width/2-120, self.frame.size.height/2)
                self.outerRightMenuButton.center = CGPointMake(self.frame.size.width/2+120, self.frame.size.height/2)
                
                self.rotationAnimation(self.leftMenuButton)
                self.rotationAnimation(self.rightMenuButton)
                self.rotationAnimation(self.outerLeftMenuButton)
                self.rotationAnimation(self.outerRightMenuButton)
                
                self.menuPressed = true
            }
            else{
                self.mainMenuRotation(self.menuButton)
                
                self.rotationAnimation(self.leftMenuButton)
                self.rotationAnimation(self.rightMenuButton)
                self.rotationAnimation(self.outerLeftMenuButton)
                self.rotationAnimation(self.outerRightMenuButton)
                
                self.frame = CGRectMake(self.screenSize.width/2-25, self.frame.origin.y, 50, self.frame.size.height)
                self.menuButton.center = CGPointMake(self.frame.size.width/2, self.frame.size.height/2)
                
                self.menuPressed = false
            }
        })
    }
    
    // MARK: Miscellaneous Button Actions
    
    func leftMeQSnuButtonPressed(sender: UIButton){
        NSLog("Left Menu Button Pressed")
    }
    
    func rightMenuButtonPressed(sender: UIButton){
        NSLog("Right Menu Button Pressed")
    }
    
    func outerLeftMenuButtonPressed(sender: UIButton){
        NSLog("Outer Left Menu Button Pressed")
    }
    
    func outerRightMenuButtonPressed(sender: UIButton){
        NSLog("Outer Right Menu Button Pressed")
    }
    
    
    // MARK: Button Animations
    
    func mainMenuRotation(sender: UIButton){
        var rot = CGFloat(M_PI_4 * 7.0)
        
        if (menuPressed){
            rot = CGFloat(M_PI_4 * 2.0)
        }
        
        UIView.animateKeyframesWithDuration(0.5, delay: 0.0, options: UIViewKeyframeAnimationOptions.CalculationModePaced, animations: { () -> Void in
            UIView.addKeyframeWithRelativeStartTime(0, relativeDuration: 0, animations: {
                sender.transform = CGAffineTransformMakeRotation(1/5 * rot)
            })
            
            UIView.addKeyframeWithRelativeStartTime(0, relativeDuration: 0, animations: {
                sender.transform = CGAffineTransformMakeRotation(2/5 * rot)
            })
            
            UIView.addKeyframeWithRelativeStartTime(0, relativeDuration: 0, animations: {
                sender.transform = CGAffineTransformMakeRotation(3/5 * rot)
            })
            
            UIView.addKeyframeWithRelativeStartTime(0, relativeDuration: 0, animations: {
                sender.transform = CGAffineTransformMakeRotation(4/5 * rot)
            })
            
            UIView.addKeyframeWithRelativeStartTime(0, relativeDuration: 0, animations: {
                sender.transform = CGAffineTransformMakeRotation(5/5 * rot)
            })
        }, completion: nil)
    }
    
    func rotationAnimation(sender: UIButton){
        var rotation = CGFloat(M_PI * 2)
        
        if (!menuPressed){
            sender.hidden = false
        }
        else{
            let delayTime = dispatch_time(DISPATCH_TIME_NOW,
                Int64(0.15 * Double(NSEC_PER_SEC)))
            dispatch_after(delayTime, dispatch_get_main_queue()) {
                sender.hidden = true;
            }
            rotation = -CGFloat(M_PI * 2)
        }
        
        UIView.animateKeyframesWithDuration(0.5, delay: 0.0, options: UIViewKeyframeAnimationOptions.CalculationModePaced, animations: { () -> Void in
            UIView.addKeyframeWithRelativeStartTime(0, relativeDuration: 0, animations: {
                sender.transform = CGAffineTransformMakeRotation(1/5 * rotation)
            })
            
            UIView.addKeyframeWithRelativeStartTime(0, relativeDuration: 0, animations: {
                sender.transform = CGAffineTransformMakeRotation(2/5 * rotation)
            })
            
            UIView.addKeyframeWithRelativeStartTime(0, relativeDuration: 0, animations: {
                sender.transform = CGAffineTransformMakeRotation(3/5 * rotation)
            })
            
            UIView.addKeyframeWithRelativeStartTime(0, relativeDuration: 0, animations: {
                sender.transform = CGAffineTransformMakeRotation(4/5 * rotation)
            })
            
            UIView.addKeyframeWithRelativeStartTime(0, relativeDuration: 0, animations: {
                sender.transform = CGAffineTransformMakeRotation(5/5 * rotation)
            })
        }, completion: nil)
    }
}
