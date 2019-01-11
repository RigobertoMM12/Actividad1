//
//  EmpleadosCobranza.swift
//  Actividad1
//
//  Created by usuario on 1/9/19.
//  Copyright © 2019 usuario. All rights reserved.
//

import Foundation
class EmpleadosCobranza  {
    var nombre:String;
    var puesto:String;
    var rutas:[Rutas];
    init(nombre:String, rutas:[Rutas],puesto:String) {
        self.nombre = nombre;
        self.rutas  = rutas;
        self.puesto =  puesto;
    }
    func getEmpleadoC()->String{
        return nombre + "\n Total de rutas: \(rutas.count)\n rutas: \(rutas)\n Puesto:\(puesto)";
    }
}
