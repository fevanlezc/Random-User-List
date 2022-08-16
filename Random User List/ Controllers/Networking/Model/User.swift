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
    var location: Location?
    var phone: String?
    var picture: Picture?
}

struct Name: Decodable{
    var first: String?
    var last: String?
}

struct Location: Decodable{
    var street: Street?
    var city: String?
    var state: String?
    var country: String?
}

struct Street: Decodable{
    var name: String?
    var number: Int?
}
 
struct Picture: Decodable{
    var large: String?
    var medium: String?
    var thumbnail: String?
}
