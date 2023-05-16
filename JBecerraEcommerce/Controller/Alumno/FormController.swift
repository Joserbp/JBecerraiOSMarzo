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
    
    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var btnAction: UIButton!
    @IBOutlet weak var txtIdAlumno: UITextField!
    
    @IBOutlet weak var txtIdRol: DropDown!
    
    @IBOutlet weak var txtApellidoPaterno: UITextField!
    
    var IdAlumno : Int = 0
    var IdRol : Int = 0
    
    let imagePickerController = UIImagePickerController()
    
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
        super.viewDidLoad()

        txtIdRol.didSelect { selectedText, index, id in
            self.IdRol = id
        }
        
        //Image delegate
        imagePickerController.delegate = self
        imagePickerController.sourceType = .photoLibrary
        imagePickerController.isEditing = false
        //
        self.txtNombre.delegate = self
        txtApellidoPaterno.delegate = self
        
        print("Se ejecuto ViewDidLoad Form")
        txtIdRol.optionArray = ["User","Adm","Inv"]
        txtIdRol.optionIds = [1,2,3]
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
    
    @IBAction func openPickerImage() {
        self.present(imagePickerController, animated: true)
    }
    
    @IBAction func ActionButons(_ sender: UIButton) {
        
        guard txtNombre.text != "" else {
            //label.text = "El campo no puede ser vacio"
            txtNombre.layer.backgroundColor = UIColor.red.cgColor
            return
        }

        let imagen = imageView.image
        alumno.image = convertToBase64(imagen: imagen)//Convertir a base 64
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

// MARK: UITextFieldDelegate
extension FormController : UITextFieldDelegate {
    
    func textFieldShouldClear(_ textField: UITextField) -> Bool {
        //CODIGO
        return true
    }
    func textFieldDidEndEditing(_ textField: UITextField) {
        if textField.text == "" {
        }
    }
}

// MARK: ImageView
extension FormController : UIImagePickerControllerDelegate, UINavigationControllerDelegate {
    
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {

        let data = info[.originalImage]
        self.imageView.image = info[.originalImage] as! UIImage
        
        dismiss(animated: true)
    }
    func convertToBase64 (imagen : UIImage) -> String{
        let base64 = ""
        //PROCESO
        return base64
    }
    
}
