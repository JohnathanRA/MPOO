//
//  CarrViewController.swift
//  tienda
//
//  Created by Macbook on 02/10/18.
//  Copyright © 2018 Macbook. All rights reserved.
//

import UIKit

class CarViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
    
    var listProducts = [Producto]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return listProducts.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "productsCar", for: indexPath)
        
        cell.textLabel?.text = "\(listProducts[indexPath.row].name) - \(listProducts[indexPath.row].price)"
        
        return cell
    }
    
    
    

    

}
