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
    var defaultBorderWidth = CGFloat(1.0)
    
    // Menu Buttons
    var menuButton = UIButton()
    var leftMenuButton = UIButton()
    var rightMenuButton = UIButton()
    var outerLeftMenuButton = UIButton()
    var outerRightMenuButton = UIButton()
    
    // Boolean variable to check whether the menu is active or inactive
    var menuPressed = Bool()
    
    // Variable to determine the size of the screen
    let screenSize: CGRect = UIScreen.mainScreen().bounds

    override init(frame: CGRect) {
        super.init(frame: frame)
        
        // X-coordinate of frame is ignored and centers the menu in the middle of the screen, keeping the y-coordinate
        self.center = CGPointMake(screenSize.width/2, self.frame.origin.y)
        self.layer.cornerRadius = self.frame.size.height/2
        self.layer.masksToBounds = true
        
        // Setup default colors in case they don't customize the view
        self.layer.borderColor = defaultBorderColor
        self.layer.borderWidth = defaultBorderWidth
        self.backgroundColor = defaultBackgroundColor
        
        // Set up the menu buttons
        setupButtonsOnView()
    }
    
    required init(coder aDecoder: NSCoder) {
        fatalError("This class does not support NSCoding")
    }
    
    // MARK: Customize view and edit button image methods
    
    func customizeView(borderColor: UIColor, backgroundColor: UIColor, borderWith: CGFloat){
        self.backgroundColor = backgroundColor
        self.layer.borderColor = borderColor.CGColor
        self.layer.borderWidth = borderWith
    }
    
    func setMainButtonImage(image: UIImage){
        menuButton.setImage(image, forState: .Normal)
    }
    
    func setLeftButtonImage(image: UIImage){
        leftMenuButton.setImage(image, forState: .Normal)
    }
    
    func setRightButtonImage(image: UIImage){
        rightMenuButton.setImage(image, forState: .Normal)
    }
    
    func setOuterLeftButtonImage(image: UIImage){
        outerLeftMenuButton.setImage(image, forState: .Normal)
    }
    
    func setOuterRightButtonImage(image: UIImage){
        outerRightMenuButton.setImage(image, forState: .Normal)
    }

    // MARK: Setup Buttons
    
    func setupButtonsOnView(){
        menuPressed = false;

        // Start buttons below menu button and extend them out to their spots
        leftMenuButton.frame = CGRectMake(0, 0, self.frame.origin.y, self.frame.size.height)
        leftMenuButton.center = CGPointMake(self.frame.size.width/2, self.frame.size.height/2)
        leftMenuButton.setImage(UIImage(named: "Businessman Filled"), forState: .Normal)
        leftMenuButton.addTarget(self, action: "buttonsPressed:", forControlEvents: UIControlEvents.TouchUpInside)
        leftMenuButton.hidden = true
        self.addSubview(leftMenuButton)
        
        rightMenuButton.frame = CGRectMake(0, 0, self.frame.size.height, self.frame.size.height)
        rightMenuButton.center = CGPointMake(self.frame.size.width/2, self.frame.size.height/2)
        rightMenuButton.setImage(UIImage(named: "Horse"), forState: .Normal)
        rightMenuButton.addTarget(self, action: "buttonsPressed:", forControlEvents: UIControlEvents.TouchUpInside)
        rightMenuButton.hidden = true
        self.addSubview(rightMenuButton)
        
        outerLeftMenuButton.frame = CGRectMake(0, 0, self.frame.size.height, self.frame.size.height)
        outerLeftMenuButton.center = CGPointMake(self.frame.size.width/2, self.frame.size.height/2)
        outerLeftMenuButton.setImage(UIImage(named: "Mac Client"), forState: .Normal)
        outerLeftMenuButton.addTarget(self, action: "buttonsPressed:", forControlEvents: UIControlEvents.TouchUpInside)
        outerLeftMenuButton.hidden = true
        self.addSubview(outerLeftMenuButton)
        
        outerRightMenuButton.frame = CGRectMake(0, 0, self.frame.size.height, self.frame.size.height)
        outerRightMenuButton.center = CGPointMake(self.frame.size.width/2, self.frame.size.height/2)
        outerRightMenuButton.setImage(UIImage(named: "Soundcloud"), forState: .Normal)
        outerRightMenuButton.addTarget(self, action: "buttonsPressed:", forControlEvents: UIControlEvents.TouchUpInside)
        outerRightMenuButton.hidden = true
        self.addSubview(outerRightMenuButton)
        
        menuButton.frame = CGRectMake(0, 0, self.frame.size.height, self.frame.size.height)
        menuButton.center = CGPointMake(self.frame.size.width/2, self.frame.size.height/2)
        menuButton.setImage(UIImage(named: "Plus"), forState: .Normal)
        menuButton.addTarget(self, action: "menuButtonPressed", forControlEvents: UIControlEvents.TouchUpInside)
        self.addSubview(menuButton)
    }
    
    // MARK: Main Menu Button
    
    func menuButtonPressed(){
        UIView.animateWithDuration(0.3, animations: { () -> Void in
            if (self.menuPressed){
                self.frame = CGRectMake(self.screenSize.width/2-25, self.frame.origin.y, self.frame.size.height, self.frame.size.height)
                
                self.mainMenuRotation(self.menuButton)
                
                self.rotationAnimation(self.leftMenuButton)
                self.rotationAnimation(self.rightMenuButton)
                self.rotationAnimation(self.outerLeftMenuButton)
                self.rotationAnimation(self.outerRightMenuButton)
                
                self.menuPressed = false
            }
            else{
                self.frame = CGRectMake(10, self.frame.origin.y, self.screenSize.width-20, self.frame.size.height)
                
                self.mainMenuRotation(self.menuButton)
                
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
        })
    }
    
    // MARK: Miscellaneous Button Actions
    
    func buttonsPressed(sender: UIButton){
        menuButtonPressed()
        
        if (sender == leftMenuButton){
            NSLog("Left Menu Button Pressed")
        }
        else if (sender == rightMenuButton){
            NSLog("Right Menu Button Pressed")
        }
        else if (sender == outerLeftMenuButton){
            NSLog("Outer Left Menu Button Pressed")
        }
        else if (sender == outerRightMenuButton){
            NSLog("Outer Right Menu Button Pressed")
        }
    }
    
    // MARK: Menu Activity Status
    
    func getMenuStatus() -> Bool{
        return menuPressed
    }
    
    // MARK: Button Animations
    
    func mainMenuRotation(sender: UIButton){
        // Keep the main button in the center of the view
        sender.center = CGPointMake(self.frame.size.width/2, self.frame.size.height/2)
        
        // Turn the "Plus" image into an "X" image
        var rotation = CGFloat(M_PI_4 * 7.0)
        
        // Turn the "X" image back into the "Plus" image
        if (menuPressed){
            rotation = CGFloat(M_PI_4 * 8.0)
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
    
    func rotationAnimation(sender: UIButton){

        // Rotate the button in a complete circle
        var rotation = CGFloat(M_PI * 2)
        
        if (menuPressed){
            // Make buttons center on top of the main menu button
            sender.center = CGPointMake(menuButton.frame.origin.x+menuButton.frame.size.width/2, self.frame.size.height/2)
            
            // Give the animation time to act before hiding the button
            let delayTime = dispatch_time(DISPATCH_TIME_NOW, Int64(0.15 * Double(NSEC_PER_SEC)))
            dispatch_after(delayTime, dispatch_get_main_queue()) {
                sender.hidden = true;
            }
            
            // Reverse the rotation if the button is going inwards
            rotation = -CGFloat(M_PI * 2)
        }
        else{
            // Make the button visible as it goes outwards
            sender.hidden = false
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
