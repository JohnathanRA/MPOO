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
    
    var data = [Producto]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        productos.append(Producto(name: "Cloro", price: 14.5, details: "Marca: Cloralex \nUso: para aplicar a lo que quieras \nContenido: 950 ml", image: "Cloro", cod: 1111))
        
        productos.append(Producto(name: "Detergente", price: 10.0, details: "Marca: Persil \nUso: para aplicar a lo que quieras \nContenido: 500 gr", image: "Detergente", cod: 1112))
        
        productos.append(Producto(name: "Aromatizante", price: 39.99, details: "Marca: Glade \nUso: para aplicar a lo que quieras \nContenido: 300 ml", image: "Aromatizante", cod: 1113))
        
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return productos.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "celda", for: indexPath)
        
        cell.textLabel?.text = "\(productos[indexPath.row].name) - $\(productos[indexPath.row].price)"
        
        return cell
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "segundo"{
            
            let indexPath = catalogo.indexPathForSelectedRow
            
            let destino = segue.destination as! DetailsViewController
            
            destino.selectProduct = productos[(indexPath?.row)!]
            
            destino.carrito = data
        }
        if segue.identifier == "showCar"{
            
            let destino = segue.destination as! CarViewController
            
            destino.listProducts = data
        }
    }
    
    
    @IBAction func unsegueCatalogo(_ segue: UIStoryboardSegue) {
        if let origin = segue.source as? DetailsViewController{
            data = origin.carrito
            print(data)
        }
    }//File control Block- Para que no se corrombpa el archivo
    
}

