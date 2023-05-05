//
//  AlumnoViewModel.swift
//  JBecerraEcommerce
//
//  Created by MacbookMBA7 on 04/05/23.
//
import SQLite3
import Foundation

class AlumnoViewModel {
    static func Add(alumno: Alumno) -> Result{
        let context = DBManager()
        let result = Result()
        var statement : OpaquePointer? = nil
        var query = "INSERT INTO Alumno(Nombre,ApellidoPaterno) VALUES(?,?)"
        if(sqlite3_prepare_v2(context.db, query, -1, &statement, nil) == SQLITE_OK){
            
            sqlite3_bind_text(statement,1, (alumno.Nombre! as NSString).utf8String , -1 , nil)
            sqlite3_bind_text(statement,2, (alumno.ApellidoPaterno! as NSString).utf8String , -1 , nil)
            
            if(sqlite3_step(statement) == SQLITE_DONE){
                result.Correct = true
            }else{
                result.Correct = false
            }

        }else{
            result.Correct = false
        }
        sqlite3_finalize(statement)
        sqlite3_close(context.db)
        return result
    }

    //GETALL
    
    static func GetAll() -> Result{
        let context = DBManager()
        let result = Result()
        let query = "SELECT IdAlumno,Nombre,ApellidoPaterno FROM Alumno"
        var statement : OpaquePointer?
        do{
            if try sqlite3_prepare_v2(context.db, query, -1, &statement, nil) == SQLITE_OK{
                result.Objects = []
                while sqlite3_step(statement) == SQLITE_ROW {
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
        sqlite3_close(context.db)
        sqlite3_finalize(statement)
        return result
    }
    static func Update(alumno: Alumno) -> Result{
        let context = DBManager()
        let result = Result()
        var statement : OpaquePointer? = nil
        var query = "UPDATE Alumno SET Nombre = \(alumno.Nombre!), ApellidoPaterno = \(alumno.ApellidoPaterno!) WHERE IdAlumno = \(alumno.IdAlumno!)"
        if(sqlite3_prepare_v2(context.db, query, -1, &statement, nil) == SQLITE_OK){
            
            if(sqlite3_step(statement) == SQLITE_DONE){
                result.Correct = true
            }else{
                result.Correct = false
            }

        }else{
            result.Correct = false
        }
        sqlite3_finalize(statement)
        sqlite3_close(context.db)
        return result
    }
    
    static func Delete(idAlumno: Int) -> Result{
        let context = DBManager()
        let result = Result()
        var statement : OpaquePointer? = nil
        var query = "DELETE FROM Alumno WHERE IdAlumno = \(idAlumno)"
        if(sqlite3_prepare_v2(context.db, query, -1, &statement, nil) == SQLITE_OK){
            
            if(sqlite3_step(statement) == SQLITE_DONE){
                result.Correct = true
            }else{
                result.Correct = false
            }

        }else{
            result.Correct = false
        }
        sqlite3_finalize(statement)
        sqlite3_close(context.db)
        return result
    }
    static func GetById(idAlumno : Int) -> Result{
        let context = DBManager()
        let result = Result()
        let query = "SELECT IdAlumno,Nombre,ApellidoPaterno FROM Alumno WHERE IdAlumno = \(idAlumno)"
        var statement : OpaquePointer?
        do{
            if try sqlite3_prepare_v2(context.db, query, -1, &statement, nil) == SQLITE_OK{
                while try sqlite3_step(statement) == SQLITE_ROW {
                    let alumno = Alumno()
                    alumno.IdAlumno = Int(sqlite3_column_int(statement, 0))
                    alumno.Nombre = String(describing: String(cString: sqlite3_column_text(statement, 1)))
                    alumno.ApellidoPaterno = String(describing: String(cString: sqlite3_column_text(statement, 2)))
                    
                    result.Object = alumno
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
        sqlite3_close(context.db)
        sqlite3_finalize(statement)
        return result
    }
}
