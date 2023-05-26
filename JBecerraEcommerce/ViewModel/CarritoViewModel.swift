//
//  CarritoViewModel.swift
//  JBecerraEcommerce
//
//  Created by MacbookMBA7 on 26/05/23.
//

import Foundation
import UIKit
import CoreData

class CarritoViewModel{
    
    let appDelegate = UIApplication.shared.delegate as! AppDelegate
    
    func Add(_ IdAlumno : Int) -> Result{
        var result = Result()
        
        let context = appDelegate.persistentContainer.viewContext
        
        let entity = NSEntityDescription.entity(forEntityName: "VentaProducto", in: context)!
        
        let alumno = NSManagedObject(entity: entity, insertInto: context)
        
        alumno.setValue(IdAlumno, forKey: "idProducto")
        alumno.setValue(1, forKey: "cantidad")
        
        do{
            try context.save()
            result.Correct = true
        }
        catch let error {
            result.Correct = false
            result.ErrorMessage = error.localizedDescription
            result.Ex = error
        }
        
        return result
    }
    func Update(IdAlumno : Int){
        
    }
    func Delete(IdAlumno : Int){
        
    }
    func GetById(IdAlumno : Int){
        
    }
    func GetAll() -> Result{
        var result = Result()
        
        let context = appDelegate.persistentContainer.viewContext
        
        let response = NSFetchRequest<NSFetchRequestResult> (entityName: "VentaProducto")
        
        do{
            let resultFetch = try context.fetch(response)
            for obj in resultFetch as! [NSManagedObject]{
                let idVentaProducto = obj.value(forKey: "idProducto")
                let cantidad = obj.value(forKey: "cantidad")
                print(idProducto)
                let result = GetByID(idVentaProducto)
                print(cantidad)
            }
        }
        catch let error {
            result.Correct = false
            result.ErrorMessage = error.localizedDescription
            result.Ex = error
        }
        
        return result
    }
}

