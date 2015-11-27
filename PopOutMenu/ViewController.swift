//
//  ViewController.swift
//  PopOutMenu
//
//  Created by Anthony Williams on 6/8/15.
//  Copyright (c) 2015 Anthony Williams. All rights reserved.
//

import UIKit

class ViewController: UIViewController, AWPopOutMenuDelegate {

    override func viewDidLoad() {
        super.viewDidLoad()
                
        self.view.backgroundColor = UIColor.blackColor()
        let menu = AWPopOutMenu()
        menu.setCenterPosition(CGPoint(x: self.view.frame.size.width/2, y: self.view.frame.size.height/2))
        menu.customizeView(UIColor.whiteColor(), backgroundColor: UIColor(red: 25/255, green: 209/255, blue: 163/255, alpha: 1), borderWith: 0.6)
        menu.delegate = self
        self.view.addSubview(menu)
    }
    
    func buttonOneAction() {
        print("Button One Action")
    }
    
    func buttonTwoAction() {
        print("Button Two Action")
    }
    
    func buttonThreeAction() {
        print("Button Three Action")
    }
    
    func buttonFourAction() {
        print("Button Four Action")
    }
}


