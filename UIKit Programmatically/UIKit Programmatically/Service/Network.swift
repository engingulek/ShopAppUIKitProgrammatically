//
//  Networj.swift
//  UIKit Programmatically
//
//  Created by engin gülek on 3.02.2023.
//

import Foundation


enum Network {
    case products
}

extension Network : RequestType {
    var baseURL: String {
        return "https://fakestoreapi.com/"
    }
    
    var path: String {
        switch self {
            
        case .products:
            return  "products"
        }
    
    }
    
    var method: SiestaMethod {
        switch self {
            
        case .products:
            return .get
        }
    }
    
    
}
