//
//  RutasViewCell.swift
//  Actividad1
//
//  Created by usuario on 1/10/19.
//  Copyright © 2019 usuario. All rights reserved.
//

import UIKit
import MapKit
class RutasViewCell: UITableViewCell {

    @IBOutlet weak var lblTiempoA: UILabel!
    @IBOutlet weak var lblDelegacion: UILabel!
    @IBOutlet weak var lblDireccion: UILabel!
    @IBOutlet weak var lblCp: UILabel!
    @IBOutlet weak var lblAdeudo: UILabel!
    @IBOutlet weak var lblNotas: UILabel!
    @IBOutlet weak var lblMapa: MKMapView!
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        lblMapa.delegate = self
    }
  

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    

}

extension RutasViewCell: MKMapViewDelegate{
    func mapView(_ mapView: MKMapView, rendererFor overlay: MKOverlay) -> MKOverlayRenderer {
        let renderer = MKPolylineRenderer(overlay: overlay)
        renderer.strokeColor = UIColor.orange
        renderer.lineDashPattern = [2,4];
        renderer.lineWidth = 4.0
        renderer.alpha = 1
        return renderer
    }
}
