//
//  Product.swift
//  ShopApp
//
//  Created by engin gülek on 2.03.2023.
//

import Foundation

struct Product : Codable {
    let id:Int?
    let title:String?
    let price:Double?
    let category:String?
    let description:String?
    let image:String?
}
