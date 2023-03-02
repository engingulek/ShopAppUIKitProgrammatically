//
//  RequestType.swift
//  ShopApp
//
//  Created by engin gülek on 2.03.2023.
//

import Foundation
import Alamofire

enum AlamofireMethod : String {
    case get = "GET"
    case post = "POST"
    case delete = "DELETE"
}

enum RequestType {
    case requestPlain
    case requestParameters(parameters:[String:Any],encoding: ParameterEncoding)
}


protocol TargetType {
    var baseUrl : String {get}
    var path : String {get}
    var method : AlamofireMethod {get}
    var requestType : RequestType {get}
    var headers : [String:String]? {get}
}

