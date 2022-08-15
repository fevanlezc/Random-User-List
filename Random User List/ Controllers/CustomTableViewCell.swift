//
//  CustomTableViewCell.swift
//  Random User List
//
//  Created by Andrés Fonseca on 13/08/2022.
//

import UIKit
import Kingfisher

class TableViewCell: UITableViewCell {
    
    
    @IBOutlet var lblName: UILabel!
    @IBOutlet var lblEmail: UILabel!
    @IBOutlet var lblGender: UILabel!
    @IBOutlet var userImageView: UIImageView!
    
    
//    var user: User? {
//        didSet {
//            updateView()
//        }
//    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
//        updateView()
    }
    
//    func updateView(){
//        guard let user = user else { return }
//    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        
    }
    
}


