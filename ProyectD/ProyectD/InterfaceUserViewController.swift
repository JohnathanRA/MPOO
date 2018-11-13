//
//  InterfaceUserViewController.swift
//  ProyectD
//
//  Created by Macbook on 11/13/18.
//  Copyright © 2018 DixLab. All rights reserved.
//

import UIKit

class InterfaceUserViewController: UIViewController {

    @IBOutlet weak var avatar: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        view.backgroundColor = UIColor.black
        
        avatar.image = UIImage(named: "Rabit2")
    }
    

    

}
