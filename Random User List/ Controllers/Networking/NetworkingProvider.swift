//
//  NetworkingProvider.swift
//  Random User List
//
//  Created by Andrés Fonseca on 13/08/2022.
//

import Foundation
import Alamofire
import Kingfisher

final class NetworkingProvider {
    static let shared = NetworkingProvider()
    
    var viewController = ViewController()
   
    // Aquí guardamos el valor base del endpoint para recuperarlo después de filtrar
    var kUrlBaseKey = "https://randomuser.me/api/?results=50&inc=gender,name,email,picture,phone,location&noinfo"
    
    var urlListadoCompleto = "https://randomuser.me/api/?results=50&inc=gender,name,email,picture,phone,location&noinfo"
    var kUrlListadoFemeninoKey = "https://randomuser.me/api/?results=50&gender=female"
    var kUrlListadoMasculinoKey = "https://randomuser.me/api/?results=50&gender=male"
    private let statusOK = 200...299
    
    
    // Aquí hacemos el llamado a la API usando Alamofire
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
