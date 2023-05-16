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
    var IdAlumno : Int = 0
    /*
    ViewDidLoad -- Despues de que el controlador se haya cargado
                -- Vista se cargo en memoria
                -- La vista esta apunto de aparecer
                            SOLO SE EJECUTA 1 VEZ
    ViewWillAppear (No se ejeucta en segundo plano) -- Cuando la vista esta prepara y se va a mostrar
                -- La vista esta apunto de aparacer
                            SE EJECUTA CADA QUE SE MUESTRA LA VISTA
    ViewDidAppear -- Cuando la vista ya se muestra al usuario
     
    ViewWillDisappear (No se ejecuta segundo plano) -- Cuando cambia a otra pantalla
                      -- Antes de desaparecer
                      -- Cada que la vista desaparece
                      -- Apunto de ser elimina/Desaperece de la jerarquia
     
     ViewDidDisappear -- Cuando la vista ya desaparecio.
     */
    override func viewWillAppear(_ animated: Bool) {
        
        print("Se ejecuto ViewWillAppear GetAll")   //dsaa
    }
    override func viewDidAppear(_ animated: Bool) {
        print("Se ejecuto ViewDidAppear GetAll")
        tableView.reloadData()
    }
    override func viewWillDisappear(_ animated: Bool) {
        print("Se ejecuto ViewWillDisappear GetAll")
    }
    override func viewDidDisappear(_ animated: Bool) {
        print("Se ejecuto ViewDidDisappear GetAll")
    }
    
    override func viewDidLoad() {
        print("ViewDidLoad GetAll")
        super.viewDidLoad()
        tableView.register(UINib(nibName: "AlumnoCell", bundle: .main), forCellReuseIdentifier: "AlumnoCell") //Registrar mi celda en la vista de tabla que se encuentra en el archivo Main
        updateUI()
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
    
    //Delegado --Clase que tiene la funcion
    
    //Delegador -- Clase que manda a llamar esa función
    func tableView(_ tableView: UITableView, editActionsForRowAt indexPath: IndexPath, for orientation: SwipeCellKit.SwipeActionsOrientation) -> [SwipeCellKit.SwipeAction]? {
        
        if orientation == .right{
            let deleteAction = SwipeAction(style: .destructive, title: "Delete") { action, indexPath in
                print(indexPath.row)
                print("Se ejecuto la funcion de borrar")
                
                let result = AlumnoViewModel.Delete(idAlumno : self.alumnos[indexPath.row].IdAlumno!)
                
                if result.Correct! {
                    print("Alumno Elimnado")
                    self.updateUI()
                }else{
                    print("Ocurrio un error")
                }
            }
            return [deleteAction]
        }
        if orientation == .left {
            let updateAction = SwipeAction(style: .default, title: "Update") { action, indexPath in
                self.IdAlumno = self.alumnos[indexPath.row].IdAlumno!
                self.performSegue(withIdentifier: "FormController", sender: self)
            }
            return [updateAction]
        }
        return nil
    }
    
    func updateUI(){
        var result = AlumnoViewModel.GetAll()
        alumnos.removeAll()
        if result.Correct!{
            for objAlumno in result.Objects!{
                let alumno = objAlumno as! Alumno
               alumnos.append(alumno)
            }
            tableView.reloadData()
        }
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        //controlar que hacer antes de ir a la siguiente vista
        if segue.identifier == "FormController"{
            let formControl = segue.destination as! FormController
            formControl.IdAlumno = self.IdAlumno
            
        }
    }
}


