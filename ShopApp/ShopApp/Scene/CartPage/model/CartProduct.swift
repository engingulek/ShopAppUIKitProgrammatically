//
//  CartProduct.swift
//  ShopApp
//
//  Created by engin gülek on 2.03.2023.
//

import Foundation
import RealmSwift
class CartProduct : Object,ObjectKeyIdentifiable{
    @Persisted(primaryKey: true) var id:Int?
    @Persisted var title = ""
    //@Persisted var price : Double?
    @Persisted var category = ""
    @Persisted var image = ""
    @Persisted var piece = 0
}
