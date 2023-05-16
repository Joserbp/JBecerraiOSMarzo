//
//  Retail.swift
//  JBecerraEcommerce
//
//  Created by MacbookMBA7 on 15/05/23.
//

import Foundation

class Cliente{
    var nombre : String?
    var Tarjeta : Tarjeta?
    
    init(){
        print("Inicia Cliente")
    }
    deinit{
        print("Destruyo Cliente")
    }
}

class Tarjeta{
    var numero : String?
    var Cliente : Cliente?
    init(){
        print("Inicia Tarjeta")
    }
    deinit{
        print("Destruyo Tarjeta")
    }
}
