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
                
        let menu = AWPopOutMenu(frame: CGRectMake(0, self.view.frame.size.height/2, 50, 50))
        menu.customizeView(UIColor.blackColor(), backgroundColor: UIColor.cyanColor(), borderWith: 1.0)
//        menu.setLeftButtonImage(UIImage(named: "Soundcloud-50") as UIImage!)
//        menu.setRightButtonImage(UIImage(named: "Soundcloud-50") as UIImage!)
//        menu.setOuterLeftButtonImage(UIImage(named: "Soundcloud-50") as UIImage!)
//        menu.setOuterRightButtonImage(UIImage(named: "Soundcloud-50") as UIImage!)
        self.view.addSubview(menu)

    }
}


