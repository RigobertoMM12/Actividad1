//
//  RegistroViewController.swift
//  Actividad1
//
//  Created by usuario on 1/7/19.
//  Copyright © 2019 usuario. All rights reserved.
//

import UIKit
import CoreData
class RegistroViewController: UIViewController {
var listaDeUsuarios : Array<Usuarios> = []
    @IBOutlet weak var txtNombre: UITextField!;
    
    @IBOutlet weak var txtPassword: UITextField!
    
    @IBOutlet weak var txtRepPassword: UITextField!
    
    
    @IBOutlet weak var txtMail: UITextField!
    
    @IBOutlet weak var txtFechaNace: UITextField!
    
    @IBOutlet weak var txtNumEmpleado: UITextField!
    @IBOutlet weak var btnRegitrorefere: UIButton!
    
    @IBOutlet weak var txtTelefono: UITextField!
    
    @IBOutlet weak var lblDetalleErr: UILabel!
    
     let datePicker = UIDatePicker()
    @IBAction func btnRegistro(_ sender: UIButton) {
      
        //self.dismiss(animated: true) {
          //  print("regreso con exito")
        //}
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
    override func shouldPerformSegue(withIdentifier identifier: String, sender: Any?) -> Bool {
        var valuesOk = checkValues ();

        if(valuesOk){
            lblDetalleErr.backgroundColor = UIColor.white
            let ex1 = validarUsuario(mail: txtMail.text ?? "")
            switch ex1 {
            case 1:
                valuesOk = true;
                lblDetalleErr.text = ("Correo registrado");
                break;
            case 2:
                valuesOk = false;
                lblDetalleErr.text = ("Correo registrado anterior")
                break;
            case 3:
                valuesOk = true;
                lblDetalleErr.text = ("Correo registrado")
                break;
            default:
                print("Caso default")
            }
            if(valuesOk){
                self.dismiss(animated: true) {
                    print("regreso con exito")
                }
            }
        }else
        {
            lblDetalleErr.text = "*Datos marcados invalidos";
            lblDetalleErr.backgroundColor = UIColor.red
        }
        return valuesOk;
       
        
    }
    
    @IBAction func btnRegresae(_ sender: Any) {
        self.dismiss(animated: true) {
            print("regreso con exito")
        }
        
    }
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        print("Prepea")
            if let vcd = segue.destination as? ViewController{
                print("Prepea1")
                self.listaDeUsuarios.append(Usuarios(nombre : txtNombre.text ?? "",
                                                     password : txtPassword.text ?? "",
                                                     email : txtMail.text ?? "",
                                                     fechaNacimineton : txtFechaNace.text ?? "",
                                                     numeroEmpleado : txtNumEmpleado.text ?? "",
                                                     telefono : txtTelefono.text ?? ""))
                vcd.listaDeUsuarios = self.listaDeUsuarios;
            }
        
        
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        showDatePicker()
        print("Lista de de  1")
        print(listaDeUsuarios)
        print("Lista de de  1")
        
        txtTelefono.addTarget(self,
                              action:#selector(changeValPhone(sender:)),
                              for: .editingChanged);
        
        txtNumEmpleado.addTarget(self,
                              action:#selector(changeValPhone(sender:)),
                              for: .editingChanged);
        txtPassword.isSecureTextEntry = true;
        txtRepPassword.isSecureTextEntry = true;
        // Do any additional setup after loading the view.
    }
    
    @objc func changeValPhone(sender : UITextField){
        if let last = sender.text?.last {
            let zero: Character = "0"
            let num: Int = Int(UnicodeScalar(String(last))!.value - UnicodeScalar(String(zero))!.value)
            if (num < 0 || num > 9) {
                sender.text?.removeLast()
            }
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
    func  checkValues () -> Bool{
        var loadOk :Bool = false;
        if(self.txtNombre.text != ""  ){
            loadOk = true;
            quitarBorde(text: self.txtNombre)
        }else{
            loadOk = false;
            asignaBorde(text: self.txtNombre)
        }
        if(self.txtMail.text != ""  ){
            loadOk = true;
            quitarBorde(text: self.txtMail)
        }else{
            loadOk = false;
            asignaBorde(text: self.txtMail)
        }
        if(self.txtNumEmpleado.text != ""  ){
            loadOk = true;
            quitarBorde(text: self.txtNumEmpleado)
        }else{
            loadOk = false;
            asignaBorde(text: self.txtNumEmpleado)
        }
        if(self.txtTelefono.text != ""  ){
            loadOk = true;
            quitarBorde(text: self.txtTelefono)
        }
        else{
            loadOk = false;
            asignaBorde(text: self.txtTelefono)
        }
        if(self.txtFechaNace.text != ""  ){
            loadOk = true;
            quitarBorde(text: self.txtFechaNace)
        }
        else{
            loadOk = false;
            asignaBorde(text: self.txtFechaNace)
        }
        
        if(isValidEmail(testStr: txtMail.text ?? "")){
            loadOk = true;
            quitarBorde(text: self.txtMail)
        }else{
            loadOk = false;
            asignaBorde(text: self.txtMail)
        }
        if(self.txtPassword.text != ""  ){
            quitarBorde(text: self.txtPassword)
            loadOk = true;
            if(self.txtRepPassword.text !=  self.txtPassword.text){
                loadOk = false;
                asignaBorde(text: self.txtRepPassword)
                asignaBorde(text: self.txtPassword)
            }else{
                loadOk = true;
                quitarBorde(text: self.txtRepPassword)
                quitarBorde(text: self.txtPassword)
            }
        }else{
            loadOk = false;
            asignaBorde(text: self.txtPassword)
        }
        if(self.txtRepPassword.text != ""  ){
            
            quitarBorde(text: self.txtRepPassword)
            loadOk = true;
            if(self.txtRepPassword.text !=  self.txtPassword.text){
                loadOk = false;
                asignaBorde(text: self.txtRepPassword)
                asignaBorde(text: self.txtPassword)
            }else{
                loadOk = true;
                quitarBorde(text: self.txtRepPassword)
                quitarBorde(text: self.txtPassword)
            }
        }
        else{
            loadOk = false;
            asignaBorde(text: self.txtRepPassword)
        }
        return loadOk;
    }
    
    func asignaBorde(text : UITextField){
        text.layer.borderWidth  = 1
        text.layer.borderColor = UIColor.red.cgColor
    }
    func quitarBorde(text : UITextField){
        text.layer.borderWidth  = 0
        text.layer.borderColor = UIColor.black.cgColor
    }
    func isValidEmail(testStr:String) -> Bool {
        // print("validate calendar: \(testStr)")
        let emailRegEx = "[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,64}"
        
        let emailTest = NSPredicate(format:"SELF MATCHES %@", emailRegEx)
        return emailTest.evaluate(with: testStr)
    }
    
    
    func showDatePicker(){
        //Formate Date
        datePicker.datePickerMode = .date
        
        //ToolBar
        let toolbar = UIToolbar();
        toolbar.sizeToFit()
        let doneButton = UIBarButtonItem(title: "Done", style: .plain, target: self, action: #selector(donedatePicker));
        let spaceButton = UIBarButtonItem(barButtonSystemItem: UIBarButtonItem.SystemItem.flexibleSpace, target: nil, action: nil)
        let cancelButton = UIBarButtonItem(title: "Cancel", style: .plain, target: self, action: #selector(cancelDatePicker));
        
        toolbar.setItems([doneButton,spaceButton,cancelButton], animated: false)
        
        txtFechaNace.inputAccessoryView = toolbar
        self.txtFechaNace.inputView = datePicker
        
    }
    
    @objc func donedatePicker(){
        
        let formatter = DateFormatter()
        formatter.dateFormat = "dd/MM/yyyy"
        txtFechaNace.text = formatter.string(from: datePicker.date)
        self.view.endEditing(true)
    }
    
    @objc func cancelDatePicker(){
        self.view.endEditing(true)
    }

}
