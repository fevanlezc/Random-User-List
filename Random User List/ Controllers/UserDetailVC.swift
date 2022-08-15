//
//  UserDetailVC.swift
//  Random User List
//
//  Created by Andrés Fonseca on 13/08/2022.
//

import UIKit

class UserDetailVC: UIViewController {
    
    
    @IBOutlet var lblNombre: UILabel?
    @IBOutlet var lblDireccion: UILabel!
    @IBOutlet var lblTelefono: UILabel!
    @IBOutlet var userImageView: UIImageView!
    
    
    var user: User? {
        didSet {
            updateView()
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        updateView()
        
    }
    
    func updateView(){
        guard let user = user else { return }
        lblNombre?.text = "\(user.name?.first ?? "First") \(user.name?.last! ?? "Last")"
    }
    
    
}
