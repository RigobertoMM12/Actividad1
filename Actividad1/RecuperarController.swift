//
//  RecuperarController.swift
//  Actividad1
//
//  Created by usuario on 1/7/19.
//  Copyright © 2019 usuario. All rights reserved.
//

import UIKit

class RecuperarController: UIViewController {
 var listaDeUsuarios : Array<Usuarios> = []
    @IBOutlet weak var txtRecuperarPass: UITextField!;
    
    @IBOutlet weak var lblDetalleErr: UILabel!
    
    @IBAction func btnCambiarP(_ sender: UIButton) {
        if(txtRecuperarPass.text != "")
        {
         
            let vali = validarUsuario(mail: txtRecuperarPass.text ?? "");
            switch vali {
            case 1:
               lblDetalleErr.text = "No existe el usuario"
                break;
            case 2:
                lblDetalleErr.text = "Se ha enviado el correo exitosamente"
                break;
            case 3:
                lblDetalleErr.text = "No existe el usuario"
                break;
            default:
                print("default")
                
            }
        
        }else{
            lblDetalleErr.text = "Correo o usuario necesarios";
            
        }
        
       // self.dismiss(animated: true) {
        //    print("regreso con exito")
        //}
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        listaDeUsuarios = [Usuarios(nombre : "Rigoberto Martinez",
                                    password : "1234",
                                    email :  "rigobertom@gmail.com",
                                    fechaNacimineton : "12/12/15",
                                    numeroEmpleado : "180794",
                                    telefono : "5573114472")]
        print("Lista de de")
        print(listaDeUsuarios)
        print("Lista de de")
    }
    
    func validarUsuario(mail:String) -> Int{
        
        if listaDeUsuarios.isEmpty {
            return 1;
        } else {
            for usuario in listaDeUsuarios {
                if(usuario.email == mail){
                    
                    return  2
                }
                
            }
            
            return  3
        }
    }
    
    @IBAction func btnRegresar(_ sender: UIButton) {
        self.dismiss(animated: true) {
            print("regreso con exito")
        }
    }
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
