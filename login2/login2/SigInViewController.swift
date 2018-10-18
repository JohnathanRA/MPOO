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
    
    var listNames = [String]()
    var listPass = [String]()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        
    }
    
    @IBAction func signUp(_ sender: UIButton) {
        
        let signUp = UserDefaults.standard
        
        if let data = signUp.stringArray(forKey: "Name") {
            listNames = data
            listNames.append(newUserName.text!)
        }
        if let data = signUp.stringArray(forKey: "Pass") {
            listPass = data
            listPass.append(newUserPass.text!)
        }
        
        if let value = newUserName.text{
            //sigIn.set(value, forKey: "Name")
            signUp.setValue(value, forKey: "Name")
        }
        if let value = newUserPass.text{
            //sigIn.set(value, forKey: "Pass")
            signUp.setValue(value, forKey: "Pass")
        }
        
        let alert = UIAlertController(title: "Has sido registrado", message: "Felicidades, tu registro se realizó correctamente", preferredStyle: .alert)
        //alert.addAction(UIAlertAction(title: "Cancel", style: .cancel, handler: nil))
        
        /*alert.addTextField(configurationHandler: { textField in
            textField.placeholder = "Input your name here..."
        })*/
        
        /*alert.addAction(UIAlertAction(title: "OK", style: .default, handler: { action in
            
            if let name = alert.textFields?.first?.text {
                print("Your name: \(name)")
            }
        }))*/
        
        self.dismiss(animated: true, completion: <#T##(() -> Void)?##(() -> Void)?##() -> Void#>)
        
        self.present(alert, animated: true)
        
    }
    
}
