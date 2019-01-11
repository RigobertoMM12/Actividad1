//
//  ViewController.swift
//  Actividad1
//
//  Created by usuario on 1/7/19.
//  Copyright © 2019 usuario. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    var listaDeUsuarios : Array<Usuarios> = []
    @IBOutlet weak var txtUsuario: UITextField!;
    
    @IBOutlet weak var txtPassword: UITextField!
    @IBOutlet var lblErrores: UIView!
    
    @IBOutlet weak var lblDetalleErr: UILabel!
    override func viewDidLoad() {
        super.viewDidLoad()
        listaDeUsuarios = [Usuarios(nombre : "Rigoberto Martinez",
                                    password : "1234",
                                    email :  "rigobertom",
                                    fechaNacimineton : "12/12/15",
                                    numeroEmpleado : "180794",
                                    telefono : "5573114472")];
        txtPassword.isSecureTextEntry = true;
        txtUsuario.text  = "salvatore.isc@gmail.com";
        txtPassword.text = "salvapunk"
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    @IBAction func btnRecuperar(_ sender: UIButton) {
        datosEmpl = false;
    }
    @IBAction func btnRegistro(_ sender: Any) {
         datosEmpl = false;
    }
    override func shouldPerformSegue(withIdentifier identifier: String, sender: Any?) -> Bool {
        print("sender: ")
        print(sender.debugDescription)
        var retu:Bool = false;
        if(datosEmpl){
      /*
            
       
        var ex1:Int=0;
        if txtUsuario.text == ""{
            lblDetalleErr.text = "Usuario requerido"
            print("Usuario requerido")
        }else if txtPassword.text == ""{
            lblDetalleErr.text = "Password requerido"
        }else{
            ex1 =   validarUsuario(mail: txtUsuario.text ?? "", pass:txtPassword.text ?? "")
        }
            print("---- 1 ",ex1)
        switch ex1 {
        case 1:
            lblDetalleErr.text = "No existen usarios"
            break;
        case 2:
            lblDetalleErr.text = "validaciones correctas";
            retu = true;
            break;
        case 3:
            lblDetalleErr.text = "Usuario o contraseña incorrecta"
            break;
        default:
            print("default")
            
        }
            print(ex1)*/
        }else{
            retu = true;
        }
        
        return retu;
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let vcd = segue.destination as? ViewController{
          
            vcd.listaDeUsuarios = self.listaDeUsuarios;
        }
        if let vcm = segue.destination as? MenuViewController{
            vcm.str = txtUsuario.text;
        }
        
    }
    var datosEmpl:Bool = false;
    
    @IBAction func btnIngresar(_ sender: UIButton) {
        if txtUsuario.text == ""{
            lblDetalleErr.text = "Usuario requerido"
            print("Usuario requerido")
        }else if txtPassword.text == ""{
            lblDetalleErr.text = "Password requerido"
        }else{
            validarUsuario(mail: txtUsuario.text ?? "", pass:txtPassword.text ?? "")
        }
        
        datosEmpl = true;
    }
    
    func validarUsuario(mail:String, pass:String) -> Int{
        let url = "\(Constantes.URL_DESA.apiWS)?username=\(mail)&password=\(pass.toBAse64())";
        var returData = 3;
        let request = URLRequest(url: URL(string: url)!)  ;
        //request.httpMethod = "POST"
        let task = URLSession.shared.dataTask(with: request) { (data, resp, error) in
            if(error != nil){
                returData = 4;
                print("Se produjo un error \(error)")
            }else{
                if let info = data{
                    do{
                        let jsonResult = try JSONSerialization.jsonObject(with: info) as! [ String:AnyObject];
                        if let status = jsonResult["status"] {
                            if(status as! Int == 1){
                                
                                returData = 2;
                                DispatchQueue.main.async {
                                    self.performSegue(withIdentifier: "menu", sender: nil)
                                }
                            }
                            if(status as! Int == 0){
                                print(jsonResult["message"])
                               
                               // self.lblErrores.text  = jsonResult["message"];
                            }
                        }
                    }catch{
                        
                    }
                }
            }
        }
        task.resume();
        return returData;
    }
        
}

