//
//  ViewController.swift
//  tienda
//
//  Created by Macbook on 20/09/18.
//  Copyright © 2018 Macbook. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
    
    @IBOutlet weak var catalogo: UITableView!
    
    var productos = [Producto]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        productos.append(Producto(name: "Cloro", price: 20.5, details: "Marca: propia \nUso: para aplicar a lo que quieras, \nContenido: 2 L", image: <#T##String#>))
        
        productos.append(Producto(name: "Detergente", price: 10.0, details: "Marca: propia \nUso: para aplicar a lo que quieras, \nContenido: 500 gr", image: <#T##String#>))
        
        productos.append(Producto(name: <#T##String#>, price: <#T##Double#>, details: <#T##String#>, image: <#T##String#>))
        
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return productos.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "celda", for: indexPath)
        
        cell.textLabel?.text = productos[indexPath.row]
        
        return cell
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "segundo"{
            
            let indexPath = catalogo.indexPathForSelectedRow
            
            let destino = segue.destination as! DetailsViewController
            
            destino.vieneDeCatalogo = productos[(indexPath?.row)!]
        }
    }
    
    
    @IBAction func unsegueCatalogoViewController(unwindSegue: UIStoryboardSegue) {
    }
    
}

