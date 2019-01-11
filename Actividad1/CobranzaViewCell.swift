//
//  CobranzaViewCell.swift
//  Actividad1
//
//  Created by usuario on 1/9/19.
//  Copyright © 2019 usuario. All rights reserved.
//

import UIKit

class CobranzaViewCell: UITableViewCell {
    @IBOutlet weak var lblNombreUsuario: UILabel!
    @IBOutlet weak var lblNombreCobranza: UILabel!
    
    @IBOutlet weak var btnDetalles: UIButton!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
