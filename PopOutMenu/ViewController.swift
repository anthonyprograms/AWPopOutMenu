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
        self.view.addSubview(menu)

    }
}


