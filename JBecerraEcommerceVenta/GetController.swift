//
//  ViewController.swift
//  JBecerraEcommerceVenta
//
//  Created by MacbookMBA7 on 23/05/23.
//

import UIKit

class GetController: UICollectionViewController {
    
    let carritoViewModel = CarritoViewModel()
    var data : [Alumno] = []
    override func viewDidLoad() {
        super.viewDidLoad()
        collectionView.register(UINib(nibName: "VentaCollectionViewCell", bundle: .main), forCellWithReuseIdentifier: "ventaCell")
        
        let result = AlumnoViewModel.GetAll()
        if result.Correct! {
            for objAlumno in result.Objects! {
                data.append(objAlumno as! Alumno)
            }
            collectionView.reloadData()
        }
        
    }
    override func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }
    
    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return data.count
    }
    
    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "ventaCell", for: indexPath) as! VentaCollectionViewCell
        cell.IdTxt.text = String(data[indexPath.row].IdAlumno!)
        cell.nombreTxt.text =  data[indexPath.row].ApellidoPaterno
        
        cell.btnAdd.tag = indexPath.row
        cell.btnAdd.addTarget(self, action: #selector(AddCarrito), for: .touchUpInside)
        return cell
    }
    
    @objc func AddCarrito(sender : UIButton){
        let idAlumno = data[sender.tag].IdAlumno!
        
        let result = carritoViewModel.Add(idAlumno)
        if result.Correct! {
            //Alert
        }else{
            //Alert
        }
 //       carritoViewModel.GetAll()
        carritoViewModel.GetById(IdAlumno: idAlumno)
    }
}

