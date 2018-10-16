//
//  ViewController.swift
//  login2
//
//  Created by Macbook on 16/10/18.
//  Copyright © 2018 Macbook. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var userName: UITextField!
    
    @IBOutlet weak var pass: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        //let sigIn = UserDefaults.standard
        
        //userName.text
        userName.text = "Ingresa tu usuario aquí"
        
        pass.text = "Ingresa tu contraseña aquí"
        
        /*if let data = sigIn.object(forKey: "Name") as? String{
        }
        if let data = sigIn.object(forKey: "Pass") as? String{
        }*/
    }

    @IBAction func logIn(_ sender: UIButton) {
        let sigIn = UserDefaults.standard
        
        if let value = userName.text{
            sigIn.set(value, forKey: "Name")
        }
        if let value = pass.text{
            sigIn.set(value, forKey: "Pass")
        }
    }
    
}

