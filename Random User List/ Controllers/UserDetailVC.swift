//
//  UserDetailVC.swift
//  Random User List
//
//  Created by Andrés Fonseca on 13/08/2022.
//

import UIKit

class UserDetailVC: UIViewController {
    
    
    @IBOutlet var lblDireccion: UILabel!
    @IBOutlet var lblTelefono: UILabel!
    @IBOutlet var lblNombre: UILabel!
    @IBOutlet var userImageView: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        lblNombre.text = "Gustavo Cerati"
      
    }


}
