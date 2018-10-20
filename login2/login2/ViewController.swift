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
    
    var listUsers = [User]()
    
    var accessibility: User!
    
    var open: Bool!//delete inicialitation

    override func viewDidLoad() {
        super.viewDidLoad()
        let sigIn = UserDefaults.standard
        if let listData = sigIn.value(forKey: "Users") as? Data{
            
            let temp = try? PropertyListDecoder().decode(Array<User>.self, from: listData)
            print("------")
            listUsers = temp!
            print(listUsers)
            print("------")
            
        }
        //Data recovery
        opem = false
    }

    @IBAction func logIn(_ sender: UIButton) {
        
        viewDidLoad()
        
        if userName.text == "" {
            let alertNil = UIAlertController(title: "Upss 😠", message: "Debes llenar ambos campos", preferredStyle: .alert)
            
            alertNil.addAction(UIAlertAction(title: "está bien", style: .default, handler: nil))
            
            self.present(alertNil,animated: true)
        } else if pass.text == "" {
            let alertNil = UIAlertController(title: "Upss 😠", message: "Debes llenar ambos campos", preferredStyle: .alert)
            
            alertNil.addAction(UIAlertAction(title: "está bien", style: .default, handler: nil))
            
            self.present(alertNil,animated: true)
        } else {
            let sigIn = UserDefaults.standard
            
            if listUsers.count == 0{
                accessibility = User(userName: "", pass: "", online: false)
            } else {
                for i in 1...listUsers.count{
                    if listUsers[i - 1].online == true {
                        accessibility = User(userName: listUsers[i - 1].userName, pass: listUsers[i - 1].pass, online: true)
                        print("aun no cierra")
                        open = true
                    }
                }
                if open == false{
                    accessibility = User(userName: "", pass: "", online: false)
                }
            }
            //Hay alguien?
            print("-----")
            print("holaaaaaaa")
            print(accessibility)
            print("-----")
            
            if accessibility.online == false {
                //Le da acceso
                for i in 1...listUsers.count {
                    if userName.text == listUsers[i - 1].userName {
                        if pass.text == listUsers[i - 1].pass {
                            accessibility = User(userName: listUsers[i - 1].userName, pass: listUsers[i - 1].pass, online: true)
                            listUsers[i - 1].online = true
                            sigIn.set(try? PropertyListEncoder().encode(listUsers), forKey: "Users")
                            //cambia el estado del usuario
                            self.performSegue(withIdentifier: "welcome", sender: self)
                            //le da acceso al usuario
                        }
                        let alertPass = UIAlertController(title: "Upss 🙄", message: "Lo sentimos, El usuario o la contraseña no son correctos", preferredStyle: .alert)
                        
                        alertPass.addAction(UIAlertAction(title: "ok", style: .default, handler: nil))
                        
                        self.present(alertPass,animated: true)
                        //Delete return
                    }
                }
            } else if accessibility.userName == userName.text {
                performSegue(withIdentifier: "welcome", sender: self)
            } else {
                let alertAccessibility = UIAlertController(title: "Upss 😥", message: "Lo sentimos, un usuario aún no cierra sesión", preferredStyle: .alert)
                
                alertAccessibility.addAction(UIAlertAction(title: "Ni modo", style: .default, handler: nil))
                
                self.present(alertAccessibility,animated: true)
            }
        }
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "regist"{
            let ofSignIn = segue.destination as? SigInViewController
            
            ofSignIn?.listUsersS = listUsers
        }
        if segue.identifier == "welcome"{
            let ofWelcome = segue.destination as? InterfaceViewController
            
            ofWelcome?.userWelcome = accessibility
            
            ofWelcome?.listUsersW = listUsers
        }
    }
        
    
}
