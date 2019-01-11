//
//  Rutas.swift
//  Actividad1
//
//  Created by usuario on 1/10/19.
//  Copyright © 2019 usuario. All rights reserved.
//

import Foundation
class Rutas{
    var tiempoRuta: String;
    var delegacion : String;
    var direccion : String;
    var codigoPostal : String;
    var personaVisita : String;
    var adeudo :String;
    var notas : String;
    var tiempoA : String;
    
    var cordenadasA : String;
    var cordenadasB : String;
    init(tiempoRuta : String,
     delegacion : String,
     direccion : String,
     codigoPostal : String,
     personaVisita : String,
     adeudo :String,
     notas : String,
     tiempoA : String,
     cordenadasA : String,
     cordenadasB : String
        ) {
        self.tiempoRuta = tiempoRuta;
        self.delegacion = delegacion;
        self.direccion  = direccion;
        self.codigoPostal = codigoPostal;
        self.personaVisita = personaVisita;
        self.adeudo = adeudo;
        self.notas = notas;
        self.tiempoA = tiempoA;
        self.cordenadasA = cordenadasA;
        self.cordenadasB = cordenadasB;
    }
    func getRuta()->String{
        return tiempoRuta + "\n delegacion: \(delegacion)\n direccion: \(direccion)"
    }

}
