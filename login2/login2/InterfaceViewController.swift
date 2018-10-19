//
//  InterfaceViewController.swift
//  login2
//
//  Created by Usuario invitado on 18/10/18.
//  Copyright © 2018 Macbook. All rights reserved.
//

import UIKit

class InterfaceViewController: UIViewController {
    
    @IBOutlet weak var returnLogIn: UIButton!
    
    @IBOutlet weak var userName: UILabel!
    
    var userWelcome: User!
    
    var listUsersW = [User]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        returnLogIn.setImage(UIImage(named: "xIcon"), for: .normal)
        
        view.backgroundColor = UIColor(red: 100/250, green: 100/250, blue:  100/250, alpha: 1.0)
        
        userName.text = userWelcome.userName
    }

    @IBAction func returnLogIn(_ sender: UIButton) {
    }
    
    @IBAction func signOut(_ sender: UIButton) {
        
    }
    

}
