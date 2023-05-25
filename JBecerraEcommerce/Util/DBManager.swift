//
//  DBManager.swift
//  JBecerraEcommerce
//
//  Created by MacbookMBA7 on 28/04/23.
//

import Foundation
import SQLite3

class DBManager {

    var db : OpaquePointer?  //0x0000000
    let path : String = "Document.JBecerraEcommerce.sqlite"
    
    init(){
        self.db = Get()
    }
 
    func Get() -> OpaquePointer?{
        let filePathCompartido = FileManager.default.containerURL(forSecurityApplicationGroupIdentifier: "group.Ecommerce.group")!.appendingPathComponent(path)

        print(filePathCompartido)
        let filePath = try! FileManager.default.urls(for: .documentDirectory, in: .userDomainMask)[0].appendingPathComponent(path)
        if(sqlite3_open(filePathCompartido.path, &db) == SQLITE_OK){
            print("Conexion exitosa")
            return db
        }else{
            print("Fallo la conexión")
            return nil
        }
    }
}
