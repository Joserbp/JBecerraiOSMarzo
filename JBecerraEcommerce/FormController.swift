//
//  ViewController.swift
//  JBecerraEcommerce
//
//  Created by MacbookMBA7 on 27/04/23.
//

import UIKit

class FormController: UIViewController {

    @IBOutlet weak var BtnOutlet: UIButton!
    @IBOutlet weak var txtNombreOutlet: UITextField!
    @IBOutlet weak var txtApellidoPaterno: UITextField!
    
    let dbManager = DBManager()
    
    override func viewDidLoad() {
        super.viewDidLoad()


    }
    
    @IBAction func btnRecuperarDatosAction() {
        //Interpolación
        var alumno = Alumno()
        alumno.Nombre = txtNombreOutlet.text!
        alumno.ApellidoPaterno = txtApellidoPaterno.text!
        
        Alumno.Add(alumno: alumno, DbManager: dbManager)
        
    }
    var test : Int?
    
    @IBAction func ActionButons(_ sender: UIButton) {
        
        let btnSeleccionado = sender.titleLabel?.text
        print(btnSeleccionado)
        if(btnSeleccionado == "Actulizar"){
            
        }
        if(btnSeleccionado == "Editar"){
            
        }
        if(btnSeleccionado == "Borrar"){
            
        }
    }
    
    
    
    
}

