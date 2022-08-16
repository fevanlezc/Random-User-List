//
//  UserDetailVC.swift
//  Random User List
//
//  Created by Andrés Fonseca on 13/08/2022.
//

import UIKit

class UserDetailVC: UIViewController {
    
    
    @IBOutlet var lblNombre: UILabel?
    @IBOutlet var lblDireccion: UILabel?
    @IBOutlet var lblTelefono: UILabel?
    @IBOutlet var handleLineView: UIView?
    @IBOutlet var userImageView: UIImageView?
    
    
    var user: User? {
        didSet {
            updateView()
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        updateView()
        
    }
    
    
    // Aquí se actualiza la información que debe cargarse en la vista de detalle de usuario
    func updateView(){
        guard let user = user else { return }
        lblNombre?.text = "\(user.name?.first ?? "First") \(user.name?.last! ?? "Last")"
        lblDireccion?.text = "\(user.location?.street?.name ?? "") \(user.location?.street?.number ?? 0), \(user.location?.city ?? ""), \(user.location?.state ?? ""), \(user.location?.country ?? "")"
        lblTelefono?.text = user.phone
        userImageView?.kf.setImage(with: URL(string: user.picture?.large ?? ""))
        userImageView?.layer.cornerRadius = 15
        handleLineView?.layer.cornerRadius = 3
        
    }
    
    
}
