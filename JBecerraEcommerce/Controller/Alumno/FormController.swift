//
//  ViewController.swift
//  JBecerraEcommerce
//
//  Created by MacbookMBA7 on 27/04/23.
//

import UIKit
import SwipeCellKit

class FormController: UIViewController {

    @IBOutlet weak var BtnOutlet: UIButton!
    @IBOutlet weak var txtNombreOutlet: UITextField!
    @IBOutlet weak var txtApellidoPaterno: UITextField!
    
    let dbManager = DBManager()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let result = AlumnoViewModel.GetAll(DbManager: dbManager)
    }
    
    @IBAction func btnRecuperarDatosAction() {
        //Interpolación
        var alumno = Alumno()
        alumno.Nombre = txtNombreOutlet.text!
        alumno.ApellidoPaterno = txtApellidoPaterno.text!
        
        AlumnoViewModel.Add(alumno: alumno, DbManager: dbManager)
        
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
    
    
    @IBAction func SeguesGetAll(_ sender: UIButton) {
        
        self.performSegue(withIdentifier: "SeguesGetAll", sender: self)
    }
    
    
}

