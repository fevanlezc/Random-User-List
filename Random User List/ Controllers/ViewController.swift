//
//  ViewController.swift
//  Random User List
//
//  Created by Andrés Fonseca on 13/08/2022.
//

import UIKit
import Kingfisher

class ViewController: UIViewController{
    
    var userDetail = UserDetailVC()
    
    @IBOutlet public var tableView: UITableView!
    @IBOutlet var segmentedControl: UISegmentedControl!
    
    private let myCountries = ["Argentina", "Colombia", "Argelia", "Perú", "Bolivia", "Uruguay"]
    
    // Aquí se define el array que va a guardar todos los datos traídos de la API, adicionalmente recarga la vista de la tabla cada vez que se agrega un valor nuevo a este array.
    var users: [User] = [] {
        didSet {
            tableView.reloadData()
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        getUsers()
        tableView.dataSource = self
        tableView.delegate = self
        tableView.register(UINib(nibName: "CustomTableViewCell", bundle: nil), forCellReuseIdentifier: "myCustomCell")
    }
    
    // Guarda el valor de los endpoints
    func setKeys(){
        UserDefaults.standard.set("Se guardó el endpoint base", forKey: NetworkingProvider.shared.kUrlBaseKey)
        UserDefaults.standard.set("Se guardó el endpoint base", forKey: NetworkingProvider.shared.kUrlListadoMasculinoKey)
        UserDefaults.standard.set("Se guardó el endpoint base", forKey: NetworkingProvider.shared.kUrlListadoFemeninoKey)
        UserDefaults.standard.synchronize()
    }
    
    // Se recupera el valor ya guardado
    func getKeys(){
        if let valueBase = UserDefaults.standard.string(forKey: NetworkingProvider.shared.kUrlBaseKey), let valueFemenino = UserDefaults.standard.string(forKey: NetworkingProvider.shared.kUrlListadoFemeninoKey), let valueMasculino = UserDefaults.standard.string(forKey: NetworkingProvider.shared.kUrlListadoMasculinoKey){
            print("Se guardaron los datos correctamente, los datos son: \(valueBase), \(valueFemenino) y \(valueMasculino)")
        } else {
            print("No hay valores guardados")
        }
    }
    
    // Aquí se le asignan los valores traídos de la API al array [users]
    func getUsers(){
        NetworkingProvider.shared.getUser { users, error in
                  if let users = users {
                      self.users = users
                  }
             }
    }
    
    // Aquí se cambia el endpoint base por el endpoint que filtra el género dependiendo de qué opción esté selecccionada.
    @IBAction func segmentedControlAction(_ sender: Any) {
        switch segmentedControl.selectedSegmentIndex{
        case 0: NetworkingProvider.shared.urlListadoCompleto = NetworkingProvider.shared.kUrlListadoMasculinoKey
            getUsers()
        case 1: NetworkingProvider.shared.urlListadoCompleto = NetworkingProvider.shared.kUrlListadoFemeninoKey
            getUsers()
        default:
            print("unknown")
        }
    }
    
    // Aquí el endpoint vuelve a su valor inicial
    @IBAction func btnLimpiarFiltro(_ sender: Any) {
        NetworkingProvider.shared.urlListadoCompleto = NetworkingProvider.shared.kUrlBaseKey
        getUsers()
        print(NetworkingProvider.shared.urlListadoCompleto)
    }
    
    // Aquí se prepara la información para llevarla a la segunda vista
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
    
    
    // Aquí se aclara que deben haber tantas celdas como elementos en el array [users]
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return users.count
    }
    
    
    // Aquí se definen los valores que debe tener la celda
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "myCustomCell", for: indexPath) as? TableViewCell
        let user = users[indexPath.row]
        cell?.lblName.text = "\(user.name?.first ?? "First") \(user.name?.last! ?? "Last")"
        cell?.lblGender.text = "Gender: \(user.gender?.capitalized ?? "")"
        cell?.lblEmail.text = "Email: \(user.email)"
        cell?.userImageView.kf.setImage(with: URL(string: user.picture?.thumbnail ?? ""))
        cell?.userImageView.layer.cornerRadius = 50
        cell?.accessoryType = .disclosureIndicator
        return cell!
        
    }
    
    
}
extension ViewController : UITableViewDelegate {
    
    // Aquí se invoca el camino que lleva de una vista a otra
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        performSegue(withIdentifier: "userDetailSegue", sender: self)
        print("se seleccionó")
        
        
    }
}




