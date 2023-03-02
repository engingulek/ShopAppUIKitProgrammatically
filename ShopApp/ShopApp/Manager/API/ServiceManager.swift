//
//  ServiceManager.swift
//  ShopApp
//
//  Created by engin gülek on 2.03.2023.
//

import Foundation
import Alamofire

final class ServiceManager {
    static let serviceManager = ServiceManager()
}


extension ServiceManager {
    func fetch<M:Codable>(target:Network,completion:@escaping(Result<[M]?,Error>)->()){
        //MARK: - Requested method is received
        let method = Alamofire.HTTPMethod(rawValue: target.method.rawValue)
        let heasers = Alamofire.HTTPHeaders(target.headers ?? [:])
        //MARK:  - If selecet post Getting the parameter to be sent amd convert
        let parameters = buildParams(requestType: target.requestType)
        
        AF.request(target.baseUrl + target.path,method: method,parameters: parameters.0,encoding: parameters.1,headers: heasers).response { (response) in
            if let data = response.data {
                do{
                    let result = try JSONDecoder().decode([M].self, from: data)
                    completion(.success(result))
                }catch{
                    completion(.failure(error))
                }
            }
        }
        
    }
    
    private func buildParams(requestType: RequestType) -> ([String: Any], ParameterEncoding) {
          switch requestType {
              
          case .requestPlain:
              print("Test 1")
              return ([:], URLEncoding.default)
          case .requestParameters(parameters: let parameters, encoding: let encoding):
              print("Test")
              return (parameters, encoding)
          }
      }
  }
