//
//  RolGetAllController.swift
//  JBecerraEcommerce
//
//  Created by MacbookMBA7 on 10/05/23.
//

import UIKit
import SwipeCellKit

// MARK: MAIN
class RolGetAllController: UIViewController{
        
    let Roles : [String] = ["Administrador","Invitado","Cliente"]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        RolTableView.delegate = self
        RolTableView.dataSource = self
    }
    
    @IBOutlet weak var RolTableView: UITableView!
}

// MARK: TABLEVIEW
extension RolGetAllController : UITableViewDataSource, UITableViewDelegate{

    func numberOfSections(in tableView: UITableView) -> Int {
        1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        self.Roles.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cellRol", for: indexPath)
        cell.textLabel?.text = self.Roles[indexPath.row]
        return cell
    }
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
}

// MARK: SWIPECELLKIT
//extension RolGetAllController : SwipeTableViewCellDelegate {

    
    
    
//}

