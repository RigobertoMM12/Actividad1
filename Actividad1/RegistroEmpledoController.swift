//
//  RegistroEmpledoController.swift
//  Actividad1
//
//  Created by usuario on 1/10/19.
//  Copyright © 2019 usuario. All rights reserved.
//

import UIKit
import CoreData
class RegistroEmpledoController: UIViewController {

    @IBOutlet weak var txtNoEmpleado: UITextField!
    @IBOutlet weak var txtNombreEmpledo: UITextField!
    @IBOutlet weak var txtFechaNace: UITextField!
    @IBOutlet weak var txtMail: UITextField!
    @IBOutlet weak var txtDireccion: UITextField!
    @IBOutlet weak var txtEstadoCivil: UITextField!
    @IBOutlet weak var txtEmpresa: UITextField!
    @IBOutlet weak var txtArea: UITextField!
    @IBOutlet weak var txtFechaContrata: UITextField!
    @IBOutlet weak var txtCargo: UITextField!
    @IBOutlet weak var btnRegistro: UIButton!
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

    @IBAction func bRegistroDeEmpleado(_ sender: UIButton) {
        let appDelegate = UIApplication.shared.delegate as! AppDelegate
        let context = appDelegate.persistentContainer.viewContext
        let empleData = Empleado(context: context)
        empleData.nombre = txtNombreEmpledo.text!
        empleData.numEmpleado = Int64(txtNoEmpleado.text!)!
        let dateFormatter = DateFormatter()

        dateFormatter.dateFormat = "dd/mm/yyyy"
        dateFormatter.timeZone = TimeZone(abbreviation: "GMT+0:00")
        guard let date = dateFormatter.date(from: txtFechaNace.text! ) else {
            fatalError()
        }
        empleData.fechaNacimiento = date;
        empleData.edad  = Int16(edadCal(fechaNa: txtFechaNace.text!));
        empleData.correo = txtMail.text!;
        empleData.direccion = txtDireccion.text!;
        empleData.estadoCivil  = txtEstadoCivil.text!;
        empleData.empresa  = txtEmpresa.text!;
        empleData.area  = txtArea.text!;
        dateFormatter.dateFormat = "dd/mm/yyyy"
        dateFormatter.timeZone = TimeZone(abbreviation: "GMT+0:00")
        guard let date1 = dateFormatter.date(from: txtFechaContrata.text! ) else {
            fatalError()
        }
        empleData.fechaContratacion = date1;
        empleData.cargo = txtCargo.text!;

        appDelegate.saveContext()
        
       
    }
    func edadCal( fechaNa:String) -> Int {
        let myDateNAce  = fechaNa
        let dateStringFormater = DateFormatter()
        dateStringFormater.dateFormat = "dd/MM/yyyy"
        let dateFromString = dateStringFormater.date(from: myDateNAce)
        
        var edad  = Calendar.current.dateComponents([.year,.day], from: dateFromString! , to: Date())
        return edad.year!;
    }
}
