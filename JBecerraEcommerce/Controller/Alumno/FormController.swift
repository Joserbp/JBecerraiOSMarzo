//
//  ViewController.swift
//  JBecerraEcommerce
//
//  Created by MacbookMBA7 on 27/04/23.
//

import UIKit
import SwipeCellKit
import iOSDropDown

class FormController: UIViewController {
    
    @IBOutlet weak var txtNombre: UITextField!
    
    @IBOutlet weak var btnAction: UIButton!
    @IBOutlet weak var txtIdAlumno: UITextField!
    
    @IBOutlet weak var txtIdRol: DropDown!
    
    @IBOutlet weak var txtApellidoPaterno: UITextField!
    
    var IdAlumno : Int = 0
    var IdRol : Int = 0
    override func viewWillAppear(_ animated: Bool) {
        print("Se ejecuto ViewWillAppear Form")
    }
    override func viewDidAppear(_ animated: Bool) {
        print("Se ejecuto ViewDidAppear Form")
    }
    override func viewWillDisappear(_ animated: Bool) {
        print("Se ejecuto ViewWillDisappear Form")
    }
    override func viewDidDisappear(_ animated: Bool) {
        print("Se ejecuto ViewDidDisappear Form")
    }
    
    override func viewDidLoad() {
        
        txtIdRol.didSelect { selectedText, index, id in
            self.IdRol = id
        }
        
        super.viewDidLoad()
        print("Se ejecuto ViewDidLoad Form")
        txtIdRol.optionArray = ["User","Adm","Inv"]
        txtIdRol.optionIds = [1,3,5]
        /*let resultRol = RolViewModel.GetAll()
        if resultRol.Correct{
            for objrol in resultRol.Objects{
                txtIdRol.optionArray.append(objrol.Nombre)
                txtIdRol.optionIds?.append(objrol.IdRol)
            }
        }*/
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
            txtNombre.layer.backgroundColor = UIColor.red.cgColor
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
                
                
                present(self, animated: true)
                
            }
        }
    }
}

