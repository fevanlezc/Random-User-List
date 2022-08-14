//
//  NetworkingProvider.swift
//  Random User List
//
//  Created by Andrés Fonseca on 13/08/2022.
//

import Foundation
import Alamofire

final class NetworkingProvider {
    static let shared = NetworkingProvider()
    
    private let urlListadoCompleto = "https://randomuser.me/api/?results=50"
    private let urlListadoFemenino = "https://randomuser.me/api/?results=50&gender=female"
    private let urlListadoMasculino = "https://randomuser.me/api/?results=50&gender=male"
    private let statusOK = 200...299
    
    var users: [User] = []
    
    func getUser(){
        
        AF.request(urlListadoCompleto, method: .get).validate(statusCode: statusOK).responseDecodable (of: UserResult.self){ response in
            print(response)
            if let user = response.value?.results{
                print(user)
            } else {
                print(response.error?.errorDescription ?? "No error")
            }
        }
    }
}
