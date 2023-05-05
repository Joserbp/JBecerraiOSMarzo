//
//  AlumnoViewModel.swift
//  JBecerraEcommerce
//
//  Created by MacbookMBA7 on 04/05/23.
//
import SQLite3
import Foundation

class AlumnoViewModel {
    static func Add(alumno: Alumno){
        var context = DBManager()
        var statement : OpaquePointer? = nil
        var query = "INSERT INTO Alumno(Nombre,ApellidoPaterno) VALUES(?,?)"
        if(sqlite3_prepare_v2(context.db, query, -1, &statement, nil) == SQLITE_OK){
            
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
        sqlite3_close(context.db)
    }

    //GETALL
    
    static func GetAll(DbManager : DBManager) -> Result{
        var result = Result()
        let query = "SELECT IdAlumno,Nombre,ApellidoPaterno FROM Alumno"
        var statement : OpaquePointer?
        do{
            if try sqlite3_prepare_v2(DbManager.db, query, -1, &statement, nil) == SQLITE_OK{
                result.Objects = []
                while try sqlite3_step(statement) == SQLITE_ROW {
                    var alumno = Alumno()
                    alumno.IdAlumno = Int(sqlite3_column_int(statement, 0))
                    alumno.Nombre = String(describing: String(cString: sqlite3_column_text(statement, 1)))
                    alumno.ApellidoPaterno = String(describing: String(cString: sqlite3_column_text(statement, 2)))
                    
                    result.Objects?.append(alumno)
                }
                result.Correct = true
            }else  {
                result.Correct = false
                result.ErrorMessage = "Ocurrio un error"
            }
        }
        catch let ex{
            result.Correct = false
            result.ErrorMessage = ex.localizedDescription //Ex.Message
            result.Ex = ex
        }
        sqlite3_close(DbManager.db)
        sqlite3_finalize(statement)
        return result
    }
    
}
