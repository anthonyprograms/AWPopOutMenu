//
//  AWPopOutMenu.swift
//  PopOutMenu
//
//  Created by Anthony Williams on 6/9/15.
//  Copyright (c) 2015 Anthony Williams. All rights reserved.
//

import UIKit

@objc protocol AWPopOutMenuDelegate {
    optional func buttonOneAction()
    optional func buttonTwoAction()
    optional func buttonThreeAction()
    optional func buttonFourAction()
}

class AWPopOutMenu: UIView {    
    // Set up delegate
    var delegate : AWPopOutMenuDelegate?
    
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
    
    var centerPosition: CGPoint!
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        // X-coordinate of frame is ignored and centers the menu in the middle of the screen, keeping the y-coordinate
        self.frame.size = CGSizeMake(screenSize.height/12, screenSize.height/12)
        self.layer.cornerRadius = self.frame.size.height/2
        self.layer.masksToBounds = true
        
        // Setup default colors
        self.layer.borderColor = defaultBorderColor
        self.layer.borderWidth = defaultBorderWidth
        self.backgroundColor = defaultBackgroundColor
        
        // Set up the menu buttons
        setupButtonsOnView()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("This class does not support NSCoding")
    }
    
    func setCenterPosition(position: CGPoint) {
        centerPosition = position
        self.center = position
    }
    
    // MARK: Customize view and edit button image methods
    
    func customizeView(borderColor: UIColor, backgroundColor: UIColor, borderWith: CGFloat){
        self.backgroundColor = backgroundColor
        self.layer.borderColor = borderColor.CGColor
        self.layer.borderWidth = borderWith
    }
    
    func setMainButtonImage(image: UIImage){
        menuButton.setBackgroundImage(image, forState: .Normal)
    }
    
    func setLeftButtonImage(image: UIImage){
        leftMenuButton.setBackgroundImage(image, forState: .Normal)
    }
    
    func setRightButtonImage(image: UIImage){
        rightMenuButton.setBackgroundImage(image, forState: .Normal)
    }
    
    func setOuterLeftButtonImage(image: UIImage){
        outerLeftMenuButton.setBackgroundImage(image, forState: .Normal)
    }
    
    func setOuterRightButtonImage(image: UIImage){
        outerRightMenuButton.setBackgroundImage(image, forState: .Normal)
    }

    // MARK: Setup Buttons
    
    func setupButtonsOnView(){
        menuPressed = false;
        
        let buttonSize = 4*self.frame.size.height/7

        // Start buttons below menu button and extend them out to their spots
        leftMenuButton.frame = CGRectMake(0, 0, buttonSize, buttonSize)
        leftMenuButton.center = CGPointMake(self.frame.size.width/2, self.frame.size.height/2)
        leftMenuButton.setBackgroundImage(UIImage(named: "Businessman Filled"), forState: .Normal)
        leftMenuButton.addTarget(self, action: "buttonsPressed:", forControlEvents: .TouchUpInside)
        leftMenuButton.hidden = true
        self.addSubview(leftMenuButton)
        
        rightMenuButton.frame = CGRectMake(0, 0, buttonSize, buttonSize)
        rightMenuButton.center = CGPointMake(self.frame.size.width/2, self.frame.size.height/2)
        rightMenuButton.setBackgroundImage(UIImage(named: "Horse"), forState: .Normal)
        rightMenuButton.addTarget(self, action: "buttonsPressed:", forControlEvents: .TouchUpInside)
        rightMenuButton.hidden = true
        self.addSubview(rightMenuButton)
        
        outerLeftMenuButton.frame = CGRectMake(0, 0, buttonSize, buttonSize)
        outerLeftMenuButton.center = CGPointMake(self.frame.size.width/2, self.frame.size.height/2)
        outerLeftMenuButton.setBackgroundImage(UIImage(named: "Mac Client"), forState: .Normal)
        outerLeftMenuButton.addTarget(self, action: "buttonsPressed:", forControlEvents: .TouchUpInside)
        outerLeftMenuButton.hidden = true
        self.addSubview(outerLeftMenuButton)
        
        outerRightMenuButton.frame = CGRectMake(0, 0, buttonSize, buttonSize)
        outerRightMenuButton.center = CGPointMake(self.frame.size.width/2, self.frame.size.height/2)
        outerRightMenuButton.setBackgroundImage(UIImage(named: "Soundcloud"), forState: .Normal)
        outerRightMenuButton.addTarget(self, action: "buttonsPressed:", forControlEvents: .TouchUpInside)
        outerRightMenuButton.hidden = true
        self.addSubview(outerRightMenuButton)
        
        menuButton.frame = CGRectMake(0, 0, buttonSize, buttonSize)
        menuButton.center = CGPointMake(self.frame.size.width/2, self.frame.size.height/2)
        menuButton.setBackgroundImage(UIImage(named: "Plus"), forState: .Normal)
        menuButton.addTarget(self, action: "menuButtonPressed", forControlEvents: .TouchUpInside)
        self.addSubview(menuButton)
    }
    
    // MARK: Miscellaneous Button Actions
    
    func buttonsPressed(sender: UIButton){
        menuButtonPressed()
        
        if (sender == leftMenuButton){
            delegate?.buttonTwoAction!()
        }
        else if (sender == rightMenuButton){
            delegate?.buttonThreeAction!()
        }
        else if (sender == outerLeftMenuButton){
            delegate?.buttonOneAction!()
        }
        else if (sender == outerRightMenuButton){
            delegate?.buttonFourAction!()
        }
        
    }
    
    // MARK: Main Menu Button
    
    func menuButtonPressed(){
        UIView.animateWithDuration(0.3, animations: { () -> Void in
            if (self.menuPressed){
                self.frame = CGRectMake(self.screenSize.width/2-25, self.frame.origin.y, self.frame.size.height, self.frame.size.height)
                self.center = self.centerPosition
                
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
                
                self.leftMenuButton.center = CGPointMake(self.frame.size.width/2-self.frame.size.height-self.menuButton.frame.size.width/5, self.frame.size.height/2)
                self.rightMenuButton.center = CGPointMake(self.frame.size.width/2+self.frame.size.height+self.menuButton.frame.size.width/5, self.frame.size.height/2)
                self.outerLeftMenuButton.center = CGPointMake(self.frame.size.width/2-2*(self.frame.size.height+self.menuButton.frame.size.width/5), self.frame.size.height/2)
                self.outerRightMenuButton.center = CGPointMake(self.frame.size.width/2+2*(self.frame.size.height+self.menuButton.frame.size.width/5), self.frame.size.height/2)
                
                self.rotationAnimation(self.leftMenuButton)
                self.rotationAnimation(self.rightMenuButton)
                self.rotationAnimation(self.outerLeftMenuButton)
                self.rotationAnimation(self.outerRightMenuButton)
                
                self.menuPressed = true
            }
        })
    }
    
    // MARK: Menu Activity Status
    
    func getMenuStatus() -> Bool {
        return menuPressed
    }
    
    // MARK: Button Animations
    
    func mainMenuRotation(sender: UIButton){
        // Keep the main button in the center of the view
        sender.center.x = self.frame.size.width/2
        
        // Turn the "Plus" image into an "X" image
        var rotation = CGFloat(M_PI_4 * 7.0)
        
        // Turn the "X" image back into the "Plus" image
        if (menuPressed){
            rotation = CGFloat(M_PI_4 * 8.0)
        }
        
        UIView.animateKeyframesWithDuration(0.5, delay: 0.0, options: .CalculationModePaced, animations: { () -> Void in
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
