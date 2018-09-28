//
//  DetailsViewController.swift
//  tienda
//
//  Created by Macbook on 25/09/18.
//  Copyright © 2018 Macbook. All rights reserved.
//

import UIKit

class DetailsViewController: UIViewController {
    
    @IBOutlet weak var producto: UILabel!
    
    var vieneDeCatalogo: String = ""

    override func viewDidLoad() {
        super.viewDidLoad()
        
        producto.text = vieneDeCatalogo
        
    }
    
    
    
}
