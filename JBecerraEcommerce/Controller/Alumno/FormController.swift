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
    
    @IBOutlet weak var txtIdAlumno: UITextField!
    
    @IBOutlet weak var txtApellidoPaterno: UITextField!
    
    var IdAlumno : Int = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        print("El valor de IdAlumno es:")
        print(IdAlumno)
        
        if IdAlumno == 0{
            //Add
            //Mostrar formulario Vacio
        }else{
            //Update
            //GetByID(IdAlumno)
            //Mostrar formulario con inf del alumno/Usuario
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
        
        let btnSeleccionado = sender.titleLabel?.text
        
        if(btnSeleccionado == "Actulizar"){
            
        }
        if(btnSeleccionado == "Editar"){
            
        }
        if(btnSeleccionado == "Borrar"){
            
        }
    }
}

