//
//  DetailEateryViewController.swift
//  Eateries
//
//  Created by Aleksey Kabishau on 1021..17.
//  Copyright © 2017 Aleksey Kabishau. All rights reserved.
//

import UIKit

class DetailEateryViewController: UIViewController {
    
    @IBOutlet weak var imageView: UIImageView!
    
    var imageName = ""
    

    override func viewDidLoad() {
        super.viewDidLoad()
        
        imageView.image = UIImage(named: imageName)

    }


}
