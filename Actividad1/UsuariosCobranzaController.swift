//
//  UsuariosCobranzaController.swift
//  Actividad1
//
//  Created by usuario on 1/9/19.
//  Copyright © 2019 usuario. All rights reserved.
//

import UIKit

class UsuariosCobranzaController: UITableViewController {
    
    let empleadoCobranza = [EmpleadosCobranza(nombre: "Rigoberto Martinez MAteo", rutas: [Rutas(tiempoRuta: "", delegacion: "Tlalpan", direccion: "Matamoros 500 ", codigoPostal: "1450", personaVisita: "Alejndra val", adeudo: "600", notas: "Favor de pagar todo lo que deve", tiempoA: "", cordenadasA: "19.394494677035418,-99.17356698347076", cordenadasB: "19.240274,-99.367201")],puesto:"cobranza"),EmpleadosCobranza(nombre: "Manuel Martinez MAteo", rutas: [Rutas(tiempoRuta: "", delegacion: "Tlalpan", direccion: "Matamoros 500 ", codigoPostal: "1450", personaVisita: "Alejndra val", adeudo: "600", notas: "Favor de pagar todo lo que deve", tiempoA: "", cordenadasA: "19.394494677035418,-99.17356698347076", cordenadasB: "19.240274,-99.367201")],puesto:"Credito"),EmpleadosCobranza(nombre: "Juan Martinez MAteo", rutas: [Rutas(tiempoRuta: "", delegacion: "Tlalpan", direccion: "Matamoros 500 ", codigoPostal: "1450", personaVisita: "Alejndra val", adeudo: "600", notas: "Favor de pagar todo lo que deve", tiempoA: "", cordenadasA: "19.394494677035418,-99.17356698347076", cordenadasB: "19.240274,-99.367201")],puesto:"cobranza")]
   //  var empleCobranza = EmpleadosCobranza();
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    

    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath)
    {
       // empleCobranza = empleadoCobranza[indexPath.row];
        print("--------",empleadoCobranza[indexPath.row].getEmpleadoC());
        
    }
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return empleadoCobranza.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cobranzaCell", for: indexPath) as! CobranzaViewCell
        
        //let name = empleadoCobranza[indexPath.row].nombre;
        
        cell.lblNombreCobranza.text = empleadoCobranza[indexPath.row].nombre;
        if(empleadoCobranza[indexPath.row].puesto == "cobranza"){
            cell.btnDetalles.isHidden =  false;
        }else{
            cell.btnDetalles.isHidden =  true;
        }
        return cell;
    }
    
    @IBAction func btnRegresar(_ sender: UIButton) {
        self.dismiss(animated: true) {
            print("regreso con exito")
        }
    }
}
