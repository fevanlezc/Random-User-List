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
    
    var viewController = ViewController()
    
    
    var urlBase = "https://randomuser.me/api/?results=50&inc=gender,name,email,picture,phone,location&noinfo"
    
    var urlListadoCompleto = "https://randomuser.me/api/?results=50&inc=gender,name,email,picture,phone,location&noinfo"
    var urlListadoFemenino = "https://randomuser.me/api/?results=50&gender=female"
    var urlListadoMasculino = "https://randomuser.me/api/?results=50&gender=male"
    private let statusOK = 200...299
    
    
    
    func getUser(completion: @escaping (_ users:[User]?,_ error:Error?) -> Void){
        
        AF.request(urlListadoCompleto, method: .get).validate(statusCode: statusOK).responseDecodable (of: UserResult.self){ response in
            if let user = response.value?.results{
                completion(user, nil)
            } else {
                print(response.error?.errorDescription ?? "No error")
                completion(nil, response.error)
            }
        }
    }
}
