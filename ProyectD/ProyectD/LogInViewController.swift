//
//  LogInViewController.swift
//  ProyectD
//
//  Created by Macbook on 11/13/18.
//  Copyright © 2018 DixLab. All rights reserved.
//

import UIKit

class LogInViewController: UIViewController {

    @IBOutlet weak var LogoLogIn: UIImageView!
    override func viewDidLoad() {
        super.viewDidLoad()

        LogoLogIn.image = UIImage(named: "Logo")
    }
    
    @IBAction func signIn(_ sender: UIButton) {
        self.performSegue(withIdentifier: "toInterfaceUser", sender: Any?.self)
    }
    
}
