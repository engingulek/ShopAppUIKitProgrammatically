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
    case filterProduct(String)
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
        case .filterProduct(let category):
            return "category/\(category)"
            
        }
    }
    
    var method: AlamofireMethod {
        switch self {
            
        case .products:
            return .get
        case .categories:
            return .get
        case .filterProduct(_):
            return .get
        }
    }
    
    var requestType: RequestType {
        switch self {
            
        case .products:
            return .requestPlain
        case .categories:
            return .requestPlain
        case .filterProduct(_):
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
