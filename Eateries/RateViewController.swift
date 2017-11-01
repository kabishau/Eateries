//
//  RateViewController.swift
//  Eateries
//
//  Created by user131656 on 11/1/17.
//  Copyright © 2017 Aleksey Kabishau. All rights reserved.
//

import UIKit

class RateViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        // creating of blur effect
        let blurEffect = UIBlurEffect(style: .light)
        let blurEffectView = UIVisualEffectView(effect: blurEffect)
        // setting size of blurEffectView
        blurEffectView.frame = self.view.bounds
        // this is requered for phone rotation to keep blur effect
        blurEffectView.autoresizingMask = [.flexibleHeight, .flexibleWidth]
        // setting the position of blurEffectView - "1" mean in this case right above background
        self.view.insertSubview(blurEffectView, at: 1)
        
    }


}
