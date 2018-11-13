//
//  ViewController.swift
//  ProyectD
//
//  Created by Macbook on 13/11/18.
//  Copyright © 2018 DixLab. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var welcomeView: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        welcomeView.image = UIImage(named: "WelcomeView")
    }


}

