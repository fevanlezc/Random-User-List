//
//  ViewController.swift
//  Random User List
//
//  Created by Andrés Fonseca on 13/08/2022.
//

import UIKit

class ViewController: UIViewController{
    
    var userDetail = UserDetailVC()
    
    @IBOutlet public var tableView: UITableView!
    @IBOutlet var segmentedControl: UISegmentedControl!
    
    private let myCountries = ["Argentina", "Colombia", "Argelia", "Perú", "Bolivia", "Uruguay"]
    
    var users: [User] = [] {
        didSet {
            tableView.reloadData() // if you using this then you don't need to reload in viewdidload closure
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        getUsers()
        tableView.dataSource = self
        tableView.delegate = self
        tableView.register(UINib(nibName: "CustomTableViewCell", bundle: nil), forCellReuseIdentifier: "myCustomCell")
    }
    
    func getUsers(){
        NetworkingProvider.shared.getUser { users, error in
                  if let users = users {
                      self.users = users
                  }
             }
    }
    
    
    @IBAction func segmentedControlAction(_ sender: Any) {
        switch segmentedControl.selectedSegmentIndex{
        case 0: NetworkingProvider.shared.urlListadoCompleto = NetworkingProvider.shared.urlListadoMasculino
            getUsers()
        case 1: NetworkingProvider.shared.urlListadoCompleto = NetworkingProvider.shared.urlListadoFemenino
            getUsers()
        default:
            print("unknown")
        }
    }
    
    @IBAction func btnLimpiarFiltro(_ sender: Any) {
        NetworkingProvider.shared.urlListadoCompleto = NetworkingProvider.shared.urlBase
        getUsers()
        print(NetworkingProvider.shared.urlListadoCompleto)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "userDetailSegue"{
            guard let userDetailVC = segue.destination as? UserDetailVC else { return }
            guard let indexPath = tableView.indexPathForSelectedRow else { return }
            let user = users[indexPath.row]
            userDetailVC.user = user
        }
    }
    
    
}

extension ViewController: UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return users.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "myCustomCell", for: indexPath) as? TableViewCell
        let user = users[indexPath.row]
        cell?.lblName.text = "\(user.name?.first ?? "First") \(user.name?.last! ?? "Last")"
        cell?.lblGender.text = "Gender: \(user.gender?.capitalized ?? "")"
        cell?.lblEmail.text = "Email: \(user.email)"
        cell?.accessoryType = .disclosureIndicator
        return cell!
        
    }
    
    
}
extension ViewController : UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        performSegue(withIdentifier: "userDetailSegue", sender: self)
        print("se seleccionó")
        
        
    }
}




