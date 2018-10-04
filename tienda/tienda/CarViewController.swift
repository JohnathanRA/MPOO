//
//  CarrViewController.swift
//  tienda
//
//  Created by Macbook on 02/10/18.
//  Copyright © 2018 Macbook. All rights reserved.
//

import UIKit

class CarViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
    
    @IBOutlet var backCar: UISwipeGestureRecognizer!
    
    @IBOutlet weak var tableCar: UITableView!
    
    @IBOutlet weak var tittle: UILabel!
    
    var listProducts = [Producto]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tittle.layer.shadowOffset = CGSize(width: 2, height: 3)
        tittle.layer.shadowOpacity = 0.3
        tittle.layer.shadowRadius = 2
        
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return listProducts.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "productsCar", for: indexPath)
        
        cell.textLabel?.text = "\(listProducts[indexPath.row].name) - \(listProducts[indexPath.row].price)"
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, trailingSwipeActionsConfigurationForRowAt indexPath: IndexPath) -> UISwipeActionsConfiguration? {
        let deleteAction = UIContextualAction(style: .destructive, title: "Borrar") { (action, sourceview, completionHandler) in
            
            self.listProducts.remove(at: indexPath.row)
            
            
            self.tableCar.deleteRows(at: [indexPath], with: .fade)
        }
        
        let swipeConfiguration = UISwipeActionsConfiguration(actions: [deleteAction])
        
        return swipeConfiguration
    }
    
    
    @IBAction func backList(_ segue: UIStoryboard) {
    }

    

}
