//
//  DetailsViewController.swift
//  tienda
//
//  Created by Macbook on 25/09/18.
//  Copyright © 2018 Macbook. All rights reserved.
//

import UIKit

class DetailsViewController: UIViewController{
    
    @IBOutlet weak var producto: UILabel!
    
    @IBOutlet weak var imageProduct: UIImageView!
    
    @IBOutlet weak var priceProduct: UILabel!
    
    @IBOutlet weak var descriptionProduct: UILabel!
    
    @IBOutlet weak var counterProduct: UILabel!
    
    @IBOutlet weak var Agree: UIButton!
    
    var selectProduct: Producto!
    
    var carrito = [Producto]()
    
    var counter: Int = 0

    override func viewDidLoad() {
        super.viewDidLoad()
        
        producto.layer.shadowOffset = CGSize(width: 2, height: 3)
        producto.layer.shadowOpacity = 0.3
        producto.layer.shadowRadius = 2
        
        producto.text = selectProduct.name
        imageProduct.image = UIImage(named: selectProduct.image)
        priceProduct.text = "$\(selectProduct.price)"
        descriptionProduct.text = selectProduct.details
        counterProduct.text = "X           \(counter)"
        //counterProduct.text = String(counter)
        
        
    }
    
    @IBAction func Counter(_ sender: UIButton) {
        counter = counter + 1
        //counterProduct.text = String(counter)
        viewDidLoad()
        carrito.append(selectProduct)
    }
    
    
}
