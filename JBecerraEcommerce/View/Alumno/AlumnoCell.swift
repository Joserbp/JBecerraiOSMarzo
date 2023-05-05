//
//  AlumnoCell.swift
//  JBecerraEcommerce
//
//  Created by MacbookMBA7 on 03/05/23.
//

import UIKit
import SwipeCellKit

class AlumnoCell : SwipeTableViewCell {

    @IBOutlet weak var txtApellidoPaterno: UILabel!
    @IBOutlet weak var txtNombre: UILabel!
    
    @IBOutlet weak var txtId: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

}
