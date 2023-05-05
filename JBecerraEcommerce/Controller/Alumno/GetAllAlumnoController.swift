//
//  GetAllAlumnoController.swift
//  JBecerraEcommerce
//
//  Created by MacbookMBA7 on 03/05/23.
//

import UIKit
import SwipeCellKit

//Tabla
class GetAllAlumnoController: UITableViewController{

    var alumnos : [Alumno] = []
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.register(UINib(nibName: "AlumnoCell", bundle: .main), forCellReuseIdentifier: "AlumnoCell") //Registrar mi celda en la vista de tabla que se encuentra en el archivo Main
        var result = AlumnoViewModel.GetAll()
        if result.Correct!{
            for objAlumno in result.Objects!{
                let alumno = objAlumno as! Alumno //Unboxing
                alumnos.append(alumno)
            }
        }
    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1  //2
    }

    override func tableView(_ tableView: UITableView,  numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return alumnos.count
        
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
    
        
        //Investigar que es Delegados y Protocolos
        let cell = tableView.dequeueReusableCell(withIdentifier: "AlumnoCell", for: indexPath) as! AlumnoCell
        cell.delegate = self
        cell.txtId.text = String(alumnos[indexPath.row].IdAlumno!)
        cell.txtNombre.text = alumnos[indexPath.row].Nombre
        cell.txtApellidoPaterno.text = alumnos[indexPath.row].ApellidoPaterno

        return cell
    }
}
// SWIPE
extension GetAllAlumnoController : SwipeTableViewCellDelegate{
    
    func tableView(_ tableView: UITableView, editActionsForRowAt indexPath: IndexPath, for orientation: SwipeCellKit.SwipeActionsOrientation) -> [SwipeCellKit.SwipeAction]? {
        
        if orientation == .right{
            let deleteAction = SwipeAction(style: .destructive, title: "Delete") { action, indexPath in
                print(indexPath.row)
                print("Se ejecuto la funcion de borrar")
                //CODIGO A EJECUTAR
                //AlumnoViewModel.Delete(idAlumno : )
            }
            return [deleteAction]
        }
        if orientation == .left {
            let updateAction = SwipeAction(style: .default, title: "Update") { action, indexPath in
                
                print("Se ejecuto la funcion de update")
                //CODIGO A EJECUTAR
                //AlumnoViewModel.Delete(idAlumno : 2)
            }
            return [updateAction]
        }
        return nil
    }
}
