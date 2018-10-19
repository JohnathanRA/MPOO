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
    
//    var listNames = [String]()
//    var listPass = [String]()
    
    var listUsersS = [User]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        print(listUsersS)
    }
    
    @IBAction func signUp(_ sender: UIButton) {
        
        if newUserPass.text == confirmationPass.text {
            let signUp = UserDefaults.standard
//            if let data = signUp.stringArray(forKey: "Name") {
//                listNames = data
//                listNames.append(newUserName.text!)
//            }
//            if let data = signUp.stringArray(forKey: "Pass") {
//                listPass = data
//                listPass.append(newUserPass.text!)
//            }
//
//            if let value = newUserName.text{
//                //sigIn.set(value, forKey: "Name")
//                signUp.setValue(value, forKey: "Name")
//            }
//            if let value = newUserPass.text{
//                //sigIn.set(value, forKey: "Pass")
//                signUp.setValue(value, forKey: "Pass")
//            }
            
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
    
    @IBAction func cancel(_ sender: UIButton) {
    }
}
