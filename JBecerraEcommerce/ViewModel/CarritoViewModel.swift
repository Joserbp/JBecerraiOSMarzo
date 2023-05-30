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
    func UpdateCantidad(IdAlumno : Int){
        //GetByid
        //Update para Sumar la cantidad
    }
    func Delete(IdAlumno : Int){
        
    }
    func GetById(IdAlumno : Int) -> Result{
        var result = Result()
        let context = appDelegate.persistentContainer.viewContext
        let response = NSFetchRequest<NSFetchRequestResult>(entityName: "VentaProducto")
        
        //let predicate = NSPredicate(format: "idProducto = %@", String(IdAlumno))
        
        let predicate = NSPredicate(format: "idProducto = %i", IdAlumno)
        
        response.predicate = predicate
        do{
            let resolve = try context.fetch(response)
            let obj = resolve.first as! NSManagedObject
            print(obj.objectID)
            print(obj.value(forKey: "cantidad") as Any)
            result.Correct = true
        }
        catch let error{
            print(error.localizedDescription)
            result.Correct = false
        }
        return result
    }
    func GetAll() -> Result{
        var result = Result()
        
        let context = appDelegate.persistentContainer.viewContext
        
        let response = NSFetchRequest<NSFetchRequestResult> (entityName: "VentaProducto")
        
        do{
            let resultFetch = try context.fetch(response)
            for obj in resultFetch as! [NSManagedObject]{
                let ventaProducto = VentaProductos()
                
                ventaProducto.alumno = Alumno()
                ventaProducto.alumno?.IdAlumno = obj.value(forKey: "idProducto") as! Int
                ventaProducto.cantidad = obj.value(forKey: "cantidad") as! Int
                
                result.Objects?.append(ventaProducto)
            }
               
            result.Correct = false
    
        }
        catch let error {
            result.Correct = false
            result.ErrorMessage = error.localizedDescription
            result.Ex = error
        }
        
        return result
    }
}

