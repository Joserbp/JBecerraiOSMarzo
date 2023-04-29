//
//  Alumno.swift
//  JBecerraEcommerce
//
//  Created by MacbookMBA7 on 28/04/23.
//

import Foundation
import SQLite3

class Alumno{  //Modelo //Logica
    
    //Propiedades
    var Nombre :  String? = nil
    var ApellidoPaterno :  String? = nil

    //metodos
    static func Add(alumno: Alumno,DbManager : DBManager){
        var statement : OpaquePointer? = nil
        var query = "INSERT INTO Alumno(Nombre,ApellidoPaterno) VALUES(?,?)"
        if(sqlite3_prepare_v2(DbManager.db, query, -1, &statement, nil) == SQLITE_OK){
            
            sqlite3_bind_text(statement,1, (alumno.Nombre as! NSString).utf8String , -1 , nil)
            sqlite3_bind_text(statement,2, (alumno.ApellidoPaterno as! NSString).utf8String , -1 , nil)
            
            if(sqlite3_step(statement) == SQLITE_DONE){
               print("Alumno insertado")
            }else{
                print("Error al insert")
            }

        }else{
            print("Ocurrio un error")
        }
        sqlite3_finalize(statement)
        sqlite3_close(DbManager.db)
    }
    //ADD
    //UPDATE
    //DELETE
    //GETALL
    //GETBY
    
}
