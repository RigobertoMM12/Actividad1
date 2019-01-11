//
//  ListaEmpleadoController.swift
//  Actividad1
//
//  Created by usuario on 1/11/19.
//  Copyright © 2019 usuario. All rights reserved.
//

import UIKit
import CoreData

class ListaEmpleadoController: UITableViewController {
var empleadoArray = [Empleado]()
    var numE : Int = 180794;
    
    @IBOutlet var tblEmpleados: UITableView!
    override func viewDidLoad() {
        super.viewDidLoad()
        tblEmpleados.rowHeight = 60;
        let appDelegate = UIApplication.shared.delegate as! AppDelegate
        let context = appDelegate.persistentContainer.viewContext
        
        let sortDescriptor = NSSortDescriptor(key: "numEmpleado", ascending: true)
        let fetchRequest = NSFetchRequest<NSFetchRequestResult>(entityName: "Empleado")
        fetchRequest.sortDescriptors = [sortDescriptor]
        if let fetchResults = (try? context.fetch(fetchRequest))
            as? [Empleado] {
            empleadoArray = fetchResults
        }
        print(empleadoArray.count);
    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath)
    {
        print("-------- ***** ---- ",empleadoArray[indexPath.row]);
        self.numE = Int(empleadoArray[indexPath.row].numEmpleado);
         self.performSegue(withIdentifier: "editarEmpleado", sender: nil)
        
        
    }
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return empleadoArray.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "empleadocell", for: indexPath) as! EmpledosReViewCell
        
        cell.lblEmpleado.text =  empleadoArray[indexPath.row].nombre;
        return cell;
    }

    override func shouldPerformSegue(withIdentifier identifier: String, sender: Any?) -> Bool {
        return false;
    }
    @IBAction func crearNuevo(_ sender: UIButton) {
        
         self.performSegue(withIdentifier: "crearEmpleado", sender: nil)
    }
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        print("Prepea")
        if let vcme = segue.destination as? ModificarUsuarioController{
            
            vcme.numeroB = String(self.numE)
        }
        
        
    }
    
}
