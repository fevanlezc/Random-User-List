//
//  ViewController.swift
//  Random User List
//
//  Created by Andrés Fonseca on 13/08/2022.
//

import UIKit

class ViewController: UIViewController{
    
    var userDetail = UserDetailVC()
    
//    var networkingProvider = NetworkingProvider()
    @IBOutlet public var tableView: UITableView!
    
    private let myCountries = ["Argentina", "Colombia", "Argelia", "Perú", "Bolivia", "Uruguay"]
    
    var users: [User] = [] {
        didSet {
            tableView.reloadData() // if you using this then you don't need to reload in viewdidload closure
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        NetworkingProvider.shared.getUser { users, error in
                  if let users = users {
                      self.users = users
                  }
             }
        
        print(users.count)
//        self.tableView.reloadData()
        tableView.dataSource = self
        tableView.delegate = self
        tableView.register(UINib(nibName: "CustomTableViewCell", bundle: nil), forCellReuseIdentifier: "myCustomCell")
    }
    
    
}

extension ViewController: UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return users.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "myCustomCell", for: indexPath) as? TableViewCell
        cell?.lblName.text = "\(users.first?.name?.first ?? "" ) \(users.first?.name?.last ?? "")"
        cell?.lblGender.text = users.first?.gender
        cell?.lblEmail.text = users.first?.email
        cell?.accessoryType = .disclosureIndicator
        return cell!
        
    }
    
    
}
extension ViewController : UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        performSegue(withIdentifier: "userDetailSegue", sender: self)
        print("se seleccionó")
//        if let lblName = userDetail.lblNombre.text {
//            print("El nombre es \(lblName)")
//        } else {
//            print("falló")
//        }
//        userDetail.lblNombre.text = users.first?.name?.first!
        
    }
}


