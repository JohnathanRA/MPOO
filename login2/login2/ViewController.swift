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
    
    var listNames = [String]()
    var listPass = [String]()
    
    var accessibility: Bool = false
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let sigIn = UserDefaults.standard
        
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
        
        if let data = sigIn.stringArray(forKey: "Name") {
            listNames = data
            listNames.append(userName.text!)
        }
        if let data = sigIn.stringArray(forKey: "Pass") {
            listPass = data
            listPass.append(pass.text!)
        }
        
        for i in 1...listNames.count {
            if userName.text == listNames[i - 1] {
                if pass.text == listPass[i - 1] {
                    accessibility = true
                    return
                }
                return
            }
        }
        print(accessibility)
        
        
    }
        
    
}

