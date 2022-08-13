//
//  ViewController.swift
//  Random User List
//
//  Created by Andrés Fonseca on 13/08/2022.
//

import UIKit

class ViewController: UIViewController{
    
    
    @IBOutlet var tableView: UITableView!
    
    private let myCountries = ["Argentina", "Colombia", "Argelia", "Perú", "Bolivia", "Uruguay"]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        tableView.dataSource = self
        tableView.delegate = self
        tableView.register(UINib(nibName: "CustomTableViewCell", bundle: nil), forCellReuseIdentifier: "myCustomCell")
    }
    
    
}

extension ViewController: UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return myCountries.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "myCustomCell", for: indexPath) as? TableViewCell
        cell?.lblName.text = "Sergio Contreras"
        cell?.lblGender.text = "Masculino"
        cell?.lblEmail.text = "sergiocon@test.com"
        cell?.accessoryType = .disclosureIndicator
        return cell!
        
    }
    
    
}
extension ViewController : UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        performSegue(withIdentifier: "userDetailSegue", sender: self)
        
    }
}


