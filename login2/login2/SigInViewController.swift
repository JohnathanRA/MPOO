//
//  SigInViewController.swift
//  login2
//
//  Created by Macbook on 16/10/18.
//  Copyright © 2018 Macbook. All rights reserved.
//

import UIKit

class SigInViewController: UIViewController {
    
    @IBOutlet weak var newUserName: UITextField!
    
    @IBOutlet weak var newUserPass: UITextField!
    
    @IBOutlet weak var confirmationPass: UITextField!
    
    var listUsersS = [User]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        print(listUsersS)
    }
    
    @IBAction func signUp(_ sender: UIButton) {
        
        if newUserName.text == "" {
            let alertNil = UIAlertController(title: "Upss 😠", message: "Debes llenar todos los campos", preferredStyle: .alert)
            
            alertNil.addAction(UIAlertAction(title: "está bien", style: .default, handler: nil))
            
            self.present(alertNil,animated: true)
        } else if newUserPass.text == "" {
            let alertNil = UIAlertController(title: "Upss 😠", message: "Debes llenar todos los campos", preferredStyle: .alert)
            
            alertNil.addAction(UIAlertAction(title: "está bien", style: .default, handler: nil))
            
            self.present(alertNil,animated: true)
        } else if confirmationPass.text == "" {
            let alertNil = UIAlertController(title: "Upss 😠", message: "Debes llenar todos los campos", preferredStyle: .alert)
            
            alertNil.addAction(UIAlertAction(title: "está bien", style: .default, handler: nil))
            
            self.present(alertNil,animated: true)
        } else {
            if newUserPass.text == confirmationPass.text {
                let signUp = UserDefaults.standard
                
                let suscefullyAlert = UIAlertController(title: "Has sido registrado", message: "Felicidades, tu registro se realizó correctamente", preferredStyle: .alert)
                
                suscefullyAlert.addAction(UIAlertAction(title: "OK", style: .default, handler: { action in
                    self.dismiss(animated: true, completion: nil)
                }))
                
                self.present(suscefullyAlert, animated: true)
                //here ends about alert regist
                
                listUsersS.append(User(userName: newUserName.text!, pass: newUserPass.text!, online: false))
                
                signUp.set(try? PropertyListEncoder().encode(listUsersS), forKey: "Users")
                //here add and save the new user in the list users
                
            } else {
                //if password is'nt equal
                let crashPass = UIAlertController(title: "Upps 😪", message: "Las contraseñas no coinciden", preferredStyle: .alert)
                
                crashPass.addAction(UIAlertAction(title: "ok", style: .default, handler: nil))
                
                self.present(crashPass, animated: true)
            }
        }
    }
    
    @IBAction func cancel(_ sender: UIButton) {
    }
}
