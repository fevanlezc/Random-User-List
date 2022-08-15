//
//  User.swift
//  Random User List
//
//  Created by Andrés Fonseca on 13/08/2022.
//

import Foundation

struct UserResult: Decodable{
    let results: [User]?
}

struct User: Decodable{
    var name: Name?
    var email: String
    var gender: String?
    var address: String?
    var phone: String?
}

struct Name: Decodable{
    var first: String?
    var last: String?
}


