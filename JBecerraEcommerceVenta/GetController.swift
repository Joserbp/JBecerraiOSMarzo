//
//  ViewController.swift
//  JBecerraEcommerceVenta
//
//  Created by MacbookMBA7 on 23/05/23.
//

import UIKit

class GetController: UITableViewController {

    var data : [Alumno] = []
    override func viewDidLoad() {
        super.viewDidLoad()
       
        
        let result = AlumnoViewModel.GetAll()
        if result.Correct! {
            for objAlumno in result.Objects! {
                data.append(objAlumno as! Alumno)
            }
            tableView.reloadData()
        }
        
    }
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        1
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        data.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "prototype", for: indexPath)
        cell.textLabel?.text = data[indexPath.row].ApellidoPaterno
        return cell
    }
}

