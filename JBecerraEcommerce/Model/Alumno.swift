//
//  Alumno.swift
//  JBecerraEcommerce
//
//  Created by MacbookMBA7 on 28/04/23.
//

import Foundation
import SQLite3

class Alumno{  //Modelo 
    
    //Propiedades
    var IdAlumno : Int? = nil
    var Nombre :  String? = nil
    var ApellidoPaterno :  String? = nil
    
    //Propiedad Navegación
    var Rol : Rol? = nil
}

class Rol {
    var IdRol : Int? = nil
    var Nombre : String? = nil
}
