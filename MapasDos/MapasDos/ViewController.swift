//
//  ViewController.swift
//  MapasDos
//
//  Created by Macbook on 16/10/18.
//  Copyright © 2018 Macbook. All rights reserved.
//

import UIKit
import MapKit
import CoreLocation

class ViewController: UIViewController,CLLocationManagerDelegate, MKMapViewDelegate {
    
    @IBOutlet weak var mapa: MKMapView!
    
    @IBOutlet weak var mapTypeSegmentedControl: UISegmentedControl!
    
    let locationManager = CLLocationManager()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        mapa.delegate = self //tendría que decir que clase
        locationManager.delegate = self //delegación programatica
        
        locationManager.requestWhenInUseAuthorization() //Pregunta si nos va a dar permiso cada vez que se use la aplicación
        
        locationManager.desiredAccuracy = kCLLocationAccuracyBest //Preguntan por precisión --CPU
        
        locationManager.distanceFilter = kCLDistanceFilterNone //Cada cuantos metros va a actualizasr -- GPS
        
        locationManager.startUpdatingLocation() //Le dice al GPS que actualicen la ubicación del usuario
        
        mapa.showsUserLocation = true //Método del mapa
        
        mapTypeSegmentedControl.addTarget(self, action: #selector(mapTypeChanged), for: .valueChanged) //for -- cuando cambie el valor del control
        //self -- La clase va a implemetar la función ella misma
        
    }
    
    @objc func mapTypeChanged( segmentedControl: UISegmentedControl){
        switch (segmentedControl.selectedSegmentIndex) { //El renglón que haya sido seleccionado
        case 0:
            mapa.mapType = .standard
        case 1:
            mapa.mapType = .satellite
        case 2:
            mapa.mapType = .hybrid
        default:
            mapa.mapType = .standard
        }
    }
    
    func mapView(_ mapView: MKMapView, didUpdate userLocation: MKUserLocation) { //cada cuantos metros, personalizado
        
        let region = MKCoordinateRegion(center: mapa.userLocation.coordinate, span: MKCoordinateSpan(latitudeDelta: 0.0009, longitudeDelta: 0.0009))  //La región se va a usar para que inmediatamente haga zoom, con factor de separación por kilometro
        
        mapa.setRegion(region, animated: true)
    }//center -- De donde sea la localización del usuario dame el centro
    //span -- es la separación
    
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) { //Se usa cuando se quiera saber la localización de un punto en el mapa
        print(locations.first) //obtiene información del método
    }
    
    
}

