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
    
//    var listNames = [String]()
//    var listPass = [String]()
    
    var listUsers = [User]()
    
    var accessibility: User!

    override func viewDidLoad() {
        super.viewDidLoad()
        let sigIn = UserDefaults.standard
        if let listData = sigIn.value(forKey: "Users") as? Data{
            
            let temp = try? PropertyListDecoder().decode(Array<User>.self, from: listData)
            print("------")
            listUsers = temp!
            print("------")
            
        }
        //Data recovery
    }

    @IBAction func logIn(_ sender: UIButton) {
        let sigIn = UserDefaults.standard
        
//        if let data = sigIn.stringArray(forKey: "Name") {
//            listNames = data
//            listNames.append(userName.text!)
//        }
//        if let data = sigIn.stringArray(forKey: "Pass") {
//            listPass = data
//            listPass.append(pass.text!)
//        }
        
        if listUsers.count != 0{
            for i in 1...listUsers.count{
                if listUsers[i - 1].online == true {
                    accessibility = User(userName: "", pass: "", online: true)
                    return
                }
            }
            accessibility = User(userName: "", pass: "", online: false)
        } else {
            accessibility = User(userName: "", pass: "", online: false)
            return
        }
        //Hay alguien?
        print(accessibility)
        print("-----")
        
        
        if accessibility.online == false {
            //Le da acceso
            for i in 1...listUsers.count {
                if userName.text == listUsers[i - 1].userName {
                    if pass.text == listUsers[i - 1].pass {
                        accessibility = User(userName: listUsers[i - 1].userName, pass: listUsers[i - 1].pass, online: true)
                        listUsers[i - 1].online = false
                        sigIn.set(try? PropertyListEncoder().encode(listUsers), forKey: "Users")
                        //cambia el estado del usuario
                        self.performSegue(withIdentifier: "welcome", sender: self)
                        //le da acceso al usuario
                        return
                    }
                    return
                }
            }
            
        } else {
            let alertAccessibility = UIAlertController(title: "Upss 😥", message: "Lo sentimos un usuario aún no cierra sesión", preferredStyle: .alert)
            
            alertAccessibility.addAction(UIAlertAction(title: "Ni modo", style: .default, handler: nil))
            
            self.present(alertAccessibility,animated: true)
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

