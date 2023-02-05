//
//  Networj.swift
//  UIKit Programmatically
//
//  Created by engin gülek on 4.02.2023.
//

import Foundation


enum Network {
    case products
    case categories
}


extension Network : TargetType {
    var baseUrl: String {
        return "https://fakestoreapi.com/products/"
    }
    
    var path: String {
        switch self {
            
        case .products:
            return ""
        case .categories:
            return "categories"
        }
    }
    
    var method: AlamofireMethod {
        switch self {
            
        case .products:
            return .get
        case .categories:
            return .get
        }
    }
    
    var requestType: RequestType {
        switch self {
            
        case .products:
            return .requestPlain
        case .categories:
            return .requestPlain
        }
    }
    
    var headers: [String : String]? {
        switch self{
        default:
            return [:]
            
        }
    }
    
    
}
