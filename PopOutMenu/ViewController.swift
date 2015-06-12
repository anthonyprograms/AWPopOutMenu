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
        
        let background = BackgroundAnimation(frame: CGRectMake(0, 0, 0, 0))
        self.view.addSubview(background)
        
        self.view.backgroundColor = UIColor.blackColor()
        let menu = AWPopOutMenu(frame: CGRectMake(0, self.view.frame.size.height/2, 50, 50))
        menu.customizeView(UIColor.blackColor(), backgroundColor: UIColor.greenColor(), borderWith: 1.0)
        self.view.addSubview(menu)
    }
}


