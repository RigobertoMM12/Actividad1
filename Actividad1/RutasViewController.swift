//
//  RutasViewController.swift
//  Actividad1
//
//  Created by usuario on 1/10/19.
//  Copyright © 2019 usuario. All rights reserved.
//

import UIKit
import MapKit;
class RutasViewController: UITableViewController {
    var empleados =   EmpleadosCobranza(nombre: "Juan Martinez MAteo", rutas: [
        Rutas(tiempoRuta: "", delegacion: "Tlalpan", direccion: "Matamoros 500 ", codigoPostal: "1450", personaVisita: "Alan val", adeudo: "5000", notas: "Favor de pagar todo lo que deve", tiempoA: "", cordenadasA: "19.293983,-99.182039", cordenadasB: "19.302025,-99.176662"),
        Rutas(tiempoRuta: "", delegacion: "Tlalpan", direccion: "Matamoros 500 ", codigoPostal: "1450", personaVisita: "Miguel val", adeudo: "600", notas: "Favor de pagar todo lo que deve", tiempoA: "", cordenadasA: "19.293983,-99.182039", cordenadasB: "19.275823,-99.175549"),
        Rutas(tiempoRuta: "", delegacion: "Tlalpan", direccion: "Matamoros 500 ", codigoPostal: "1450", personaVisita: "Alejndra val", adeudo: "300", notas: "Favor de pagar todo lo que deve", tiempoA: "", cordenadasA: "19.293983,-99.182039", cordenadasB: "19.269881,-99.181948"),
        Rutas(tiempoRuta: "", delegacion: "Tlalpan", direccion: "Matamoros 500 ", codigoPostal: "1450", personaVisita: "Pedro val", adeudo: "200", notas: "Favor de pagar todo lo que deve", tiempoA: "", cordenadasA: "19.293983,-99.182039", cordenadasB: "19.304177,-99.190063")],puesto:"Cobranza");
    
    @IBOutlet weak var map: MKMapView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tblRutas.rowHeight = 400;
        tblRutas.separatorStyle = .singleLine;
        
        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem
    }

    @IBOutlet var tblRutas: UITableView!
    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath)
    {
        // empleCobranza = empleadoCobranza[indexPath.row];
        print("---+++---", empleados.rutas[indexPath.row].getRuta())
        //print("--------",empleadoCobranza[indexPath.row].getEmpleadoC());
        
    }
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return empleados.rutas.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "rutasCell", for: indexPath) as! RutasViewCell
        
        //let name = empleadoCobranza[indexPath.row].nombre;
        
        cell.lblAdeudo.text = cell.lblAdeudo.text! + ":$ "  + empleados.rutas[indexPath.row].adeudo;
        cell.lblDelegacion.text = cell.lblDelegacion.text! + " : " + empleados.rutas[indexPath.row].delegacion;
        cell.lblNotas.text = cell.lblNotas.text! + " : " + empleados.rutas[indexPath.row].notas
        let cordenaA = empleados.rutas[indexPath.row].cordenadasA.split(separator: ",");
        print(cordenaA[0],cordenaA[1])
        let cordenaB = empleados.rutas[indexPath.row].cordenadasB.split(separator: ",");
        print(cordenaB[0],cordenaB[1])
        let latitude : CLLocationDegrees = Double(cordenaA[0])!;
        let longitude : CLLocationDegrees = Double(cordenaA[1])!;
        let latDelta : CLLocationDegrees = 0.1;
        let lonDelta : CLLocationDegrees = 0.1;
        let span = MKCoordinateSpan(latitudeDelta: latDelta, longitudeDelta:lonDelta);
        
        let coordinates = CLLocationCoordinate2D(latitude:  latitude, longitude: longitude);
        
        let region = MKCoordinateRegion(center: coordinates, span: span)
        cell.lblMapa.setRegion(region, animated: true)
        // MARCK : Anotaciones
        let annotation = MKPointAnnotation()
        
        annotation.title = "Sucursal:Elektra Villa Olimpica"
        
        
        annotation.coordinate = coordinates;
        
        cell.lblMapa.addAnnotation(annotation)
        
        cell.lblMapa.selectAnnotation(annotation, animated: true)
        //MARK: trazando la ruta
        let coordinates2 = CLLocationCoordinate2D(latitude:Double(cordenaB[0])!, longitude:Double(cordenaB[1])!)
        let sourcePlacemark = MKPlacemark.init(coordinate: coordinates)
        let sourceMapItem = MKMapItem.init(placemark: sourcePlacemark)
        
        let destinationPlacemark = MKPlacemark.init(coordinate: coordinates2)
        let destinationMapItem = MKMapItem.init(placemark: destinationPlacemark)
        
        let geocoder  = CLGeocoder();
        geocoder.reverseGeocodeLocation(CLLocation(latitude: Double(cordenaB[0])!, longitude: Double(cordenaB[1])!)) { (placemark, error) in
            
            if( error != nil){
                print(error ?? "")
            }
            if let placemarks = placemark{
                cell.lblCp.text =   cell.lblCp.text! + " : " +  placemarks[0].postalCode!;
                cell.lblDireccion.text = cell.lblDireccion.text! + placemarks[0].name! + ", " + placemarks[0].administrativeArea! + ", " + placemarks[0].postalCode!;
                
            }
        }
        
        
        let directionRequest = MKDirections.Request()
        directionRequest.source = sourceMapItem
        directionRequest.destination = destinationMapItem
        directionRequest.transportType = .automobile
        
        let directions = MKDirections(request: directionRequest)
        directions.calculate {
            (response, error) -> Void in
            guard let response = response else {
                if let error = error {
                    print("Error: \(error)")
                }
                return
            }
            let route = response.routes[0]
            cell.lblTiempoA.text =  cell.lblTiempoA.text! +  String(route.expectedTravelTime/60) + "min";
           cell.lblMapa.addOverlay(route.polyline, level: .aboveRoads)
            let annotation1 = MKPointAnnotation()
            
            annotation1.title = "Casa del cliente:" + self.empleados.rutas[indexPath.row].personaVisita;
            
            
            annotation1.coordinate = coordinates2;
            
            cell.lblMapa.addAnnotation(annotation1)
            
            cell.lblMapa.selectAnnotation(annotation1, animated: true)
            let rect = route.polyline.boundingMapRect
            cell.lblMapa.setRegion(MKCoordinateRegion(rect), animated: true)
        }
        
        return cell;
    }
    
    @IBAction func btnRegresar(_ sender: UIButton) {
        self.dismiss(animated: true) {
            print("regreso con exito")
        }
    }
    

}






