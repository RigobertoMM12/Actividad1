//
//  ModificarUsuarioController.swift
//  Actividad1
//
//  Created by usuario on 1/10/19.
//  Copyright © 2019 usuario. All rights reserved.
//

import UIKit
import CoreData
class ModificarUsuarioController: UIViewController {
    var numeroB : String = "288064";
    @IBOutlet weak var txtNombreEmple: UITextField!
    @IBOutlet weak var txtNoEmpleado: UITextField!
    @IBOutlet weak var txtFechaNace: UITextField!
    @IBOutlet weak var txtEstadiCivil: UITextField!
    
    @IBOutlet weak var fechaContrata: UITextField!
    @IBOutlet weak var txtDireccion: UITextField!
    @IBOutlet weak var txtMail: UITextField!
    @IBOutlet weak var txtCargo: UITextField!
    @IBOutlet weak var txtArea: UITextField!
    @IBOutlet weak var txtEmpresa: UITextField!
    
    var empleadoArray = [Empleado]()
    override func viewDidLoad() {
        super.viewDidLoad()
        print("numeroB: ",numeroB)
        let appDelegate = UIApplication.shared.delegate as! AppDelegate
        let context = appDelegate.persistentContainer.viewContext
     
        let sortDescriptor = NSSortDescriptor(key: "numEmpleado", ascending: true)
        let predicatenumEmple  = NSPredicate(format: "numEmpleado CONTAINS %@", numeroB)
        let fetchRequest = NSFetchRequest<NSFetchRequestResult>(entityName: "Empleado")
        fetchRequest.predicate = predicatenumEmple;
        fetchRequest.sortDescriptors = [sortDescriptor]
        if let fetchResults = (try? context.fetch(fetchRequest))
            as? [Empleado] {
            empleadoArray = fetchResults
        }
        print(empleadoArray.count);
        txtNoEmpleado.text = String(empleadoArray[0].numEmpleado)
        txtNombreEmple.text = String(empleadoArray[0].nombre!)
        
        
                        txtFechaNace.text = (empleadoArray[0].fechaNacimiento?.toString(dateFormat: "dd/mm/yyy"))
                        txtMail.text = String(empleadoArray[0].correo!)
                        txtDireccion.text = String(empleadoArray[0].direccion!)
                        txtEstadiCivil.text = String(empleadoArray[0].estadoCivil!)
                        txtEmpresa.text = String(empleadoArray[0].empresa!)
                        txtArea.text = String(empleadoArray[0].area!)
                        fechaContrata.text = (empleadoArray[0].fechaContratacion?.toString(dateFormat: "dd/mm/yyy"))
                        txtCargo.text = String(empleadoArray[0].cargo!)
    }
    

    @IBAction func btnModificar(_ sender: UIButton) {
        let appDelegate = UIApplication.shared.delegate as! AppDelegate
        let context = appDelegate.persistentContainer.viewContext
        
        let usersFetch = NSFetchRequest<NSFetchRequestResult>(entityName: "Empleado")
        
        do {
            let fetchedUsers = try context.fetch(usersFetch) as! [Empleado]
            
            //print(type(of:fetchedUsers))
            for item in fetchedUsers{
                print(item.nombre!,item.numEmpleado ,item.fechaNacimiento!,item.edad,item.correo! , item.direccion!,item.estadoCivil!,item.empresa!,item.area!,item.fechaContratacion!,item.cargo!)
                if item.numEmpleado == Int64(numeroB)  {
                    
                    item.nombre?.removeAll();
                    item.nombre?.append( txtNombreEmple.text! )
                    
                   // txtFechaNace.text = (item.fechaNacimiento?.toString(dateFormat: "dd/mm/yyy"))
                    item.edad = 0;
                    item.correo?.removeAll();
                    item.correo?.append( txtMail.text! )
                    
                    item.direccion?.removeAll();
                    item.direccion?.append( txtDireccion.text! )
                
                    item.estadoCivil?.removeAll();
                    item.estadoCivil?.append( txtEstadiCivil.text! )
                    
                    
                    item.empresa?.removeAll();
                    item.empresa?.append( txtEmpresa.text! )
                    
                    
                    item.area?.removeAll();
                    item.area?.append( txtArea.text! )
                    
                   // fechaContrata.text = (item.fechaContratacion?.toString(dateFormat: "dd/mm/yyy"))
                    
                    item.cargo?.removeAll();
                    item.cargo?.append( txtCargo.text! )
                }
                
            }
            
            
        } catch {
            fatalError("Failed to fetch users: \(error)")
        }
    }
    func edadCal( fechaNa:String) -> Int {
        let myDateNAce  = fechaNa
        let dateStringFormater = DateFormatter()
        dateStringFormater.dateFormat = "dd/MM/yyyy"
        let dateFromString = dateStringFormater.date(from: myDateNAce)
        
        var edad  = Calendar.current.dateComponents([.year,.day], from: dateFromString! , to: Date())
        return edad.year!;
    }

    @IBAction func btnRegresa(_ sender: UIButton) {
        self.dismiss(animated: true) {
            print("regreso con exito")
        }
    }
    
}
extension Date
{
    func toString( dateFormat format  : String ) -> String
    {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = format
        return dateFormatter.string(from: self)
    }
    
}
