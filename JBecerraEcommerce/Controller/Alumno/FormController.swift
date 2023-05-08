//
//  ViewController.swift
//  JBecerraEcommerce
//
//  Created by MacbookMBA7 on 27/04/23.
//

import UIKit
import SwipeCellKit

class FormController: UIViewController {
    
    @IBOutlet weak var txtNombre: UITextField!
    
    @IBOutlet weak var btnAction: UIButton!
    @IBOutlet weak var txtIdAlumno: UITextField!
    
    @IBOutlet weak var txtApellidoPaterno: UITextField!
    
    var IdAlumno : Int = 0
    
    override func viewDidLoad() {
        print("ViewDidLoad FORMULARIO")
        super.viewDidLoad()
        print("El valor de IdAlumno es:")
        print(IdAlumno)
        
        if IdAlumno == 0{
            //Add
            //Mostrar formulario Vacio
            btnAction.backgroundColor = .green
            btnAction.setTitle("Agregar", for: .normal)
        }else{
            //Update
            //GetByID(IdAlumno)
            //Mostrar formulario con inf del alumno/Usuario
            btnAction.backgroundColor = .yellow
            btnAction.setTitle("Actualizar", for: .normal)
        }
    }
    
    @IBAction func btnRecuperarDatosAction() {
        //Interpolación
        let alumno = Alumno()
        alumno.IdAlumno = Int(txtIdAlumno.text!)
        alumno.Nombre = txtNombre.text!
        alumno.ApellidoPaterno = txtApellidoPaterno.text!
    }
    
    @IBAction func ActionButons(_ sender: UIButton) {
        
        guard txtNombre.text != "" else {
            //label.text = "El campo no puede ser vacio"
            //txtNombre.  = .red
            return
        }

        guard txtApellidoPaterno.text != "" else {
            fatalError("El apellido es nulo")
        }
        let alumno = Alumno()//No crearlo
        let opcion = btnAction.titleLabel?.text
        if opcion == "Agregar"{
            let result = AlumnoViewModel.Add(alumno: alumno)
            if result.Correct! {
                let alert = UIAlertController(title: "Mensaje", message: "Alumno Agregado correctamente", preferredStyle: .alert)
                let action = UIAlertAction(title: "Aceptar", style: .default)
                alert.addAction(action)
                
                //alert.show(<#T##vc: UIViewController##UIViewController#>, sender: <#T##Any?#>)
                //alert.showDetailViewController(<#T##vc: UIViewController##UIViewController#>, sender: <#T##Any?#>)
                //present(<#T##viewControllerToPresent: UIViewController##UIViewController#>, animated: <#T##Bool#>)
                
            }
        }
//        switch opcion{
//        case "Agregar":
//            AlumnoViewModel.Add(alumno: <#T##Alumno#>)
//            break
//        }
    }
}

