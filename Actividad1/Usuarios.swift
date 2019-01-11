
class Usuarios{
    var nombre : String
    var password : String
    var email : String
    var fechaNacimineton : String
    var numeroEmpleado : String
    var telefono : String
    
    init(nombre : String,
    password : String,
     email : String,
    fechaNacimineton : String,
     numeroEmpleado : String,
     telefono : String) {
        
        self.nombre = nombre;
        self.password = password;
        self.email =  email;
        self.fechaNacimineton = fechaNacimineton;
        self.numeroEmpleado = numeroEmpleado;
        self.telefono = telefono;
    }
    
    func getUsuario()->String{
        return nombre + "\n password: \(password)\n email: \(email)"
    }
}

