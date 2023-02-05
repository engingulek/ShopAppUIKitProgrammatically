//
//  CartProduct.swift
//  UIKit Programmatically
//
//  Created by engin gülek on 5.02.2023.
//

import Foundation
import RealmSwift
class CartProduct : Object,ObjectKeyIdentifiable{
    @Persisted(primaryKey: true) var id:Int?
    @Persisted var title = ""
    @Persisted var price = 0
    @Persisted var category = ""
    @Persisted var image = ""
    @Persisted var piece = 0
}

