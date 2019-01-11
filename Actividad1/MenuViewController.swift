//
//  MenuViewController.swift
//  Actividad1
//
//  Created by usuario on 1/8/19.
//  Copyright © 2019 usuario. All rights reserved.
//

import UIKit

class MenuViewController: UIViewController {
   var  str: String?;
    @IBOutlet weak var lblUsuario: UILabel!
    @IBAction func btnCerar(_ sender: Any) {
        self.dismiss(animated: true) {
            print("regreso con exito")
        }
        
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        lblUsuario.text = str;
        // Do any additional setup after loading the view.
    }
    

}
