//
//  ViewController.swift
//  PopOutMenu
//
//  Created by Anthony Williams on 6/8/15.
//  Copyright (c) 2015 Anthony Williams. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.view.backgroundColor = UIColor.blackColor()
        let menu = AWPopOutMenu(frame: CGRectMake(0, self.view.frame.size.height/2, 50, 50))
        menu.customizeView(UIColor.blackColor(), backgroundColor: UIColor.greenColor(), borderWith: 1.0)
//        menu.setMainButtonImage(UIImage(named: @"Soundcloud") as UIImage!)
//        menu.setLeftButtonImage(UIImage(named: "Soundcloud") as UIImage!)
//        menu.setRightButtonImage(UIImage(named: "Soundcloud") as UIImage!)
//        menu.setOuterLeftButtonImage(UIImage(named: "Soundcloud") as UIImage!)
//        menu.setOuterRightButtonImage(UIImage(named: "Soundcloud") as UIImage!)
        self.view.addSubview(menu)

    }
}


