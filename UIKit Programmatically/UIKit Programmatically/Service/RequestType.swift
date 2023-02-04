//
//  RequestType.swift
//  UIKit Programmatically
//
//  Created by engin gülek on 3.02.2023.
//

import Foundation

enum SiestaMethod : String {
    case get = "Get"
}



protocol RequestType {
    var baseURL : String {get}
    var path :  String {get}
    var method : SiestaMethod {get}
}
