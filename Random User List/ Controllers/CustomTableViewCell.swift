//
//  CustomTableViewCell.swift
//  Random User List
//
//  Created by Andrés Fonseca on 13/08/2022.
//

import UIKit

class TableViewCell: UITableViewCell {
    
    
    @IBOutlet var lblName: UILabel!
    @IBOutlet var lblEmail: UILabel!
    @IBOutlet var lblGender: UILabel!
    @IBOutlet var userImageView: UIImageView!
    
    var context = UIViewController()
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        print("se seleccionó")
        
//        DispatchQueue.main.async {
//            let userDetailSB = UIStoryboard(name: "UserDetail", bundle: nil)
//            let userDetailVC = userDetailSB.instantiateViewController(identifier: "UserDetailVC") as! UserDetailVC
//            self.context.performSegue(withIdentifier: "UserDetailSegue", sender: self)
//        }
        
    }
    
}

