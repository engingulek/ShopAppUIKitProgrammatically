//
//  CartViewModel.swift
//  ShopApp
//
//  Created by engin gülek on 2.03.2023.
//

import Foundation
import RxSwift
import RxCocoa
import RealmSwift
class CartViewModel {
    var cartProductList : BehaviorRelay<[CartVM]> = .init(value: [])
    var cartProductCount :  BehaviorRelay<Int> = .init(value: 0)
    var cartProductTotal : BehaviorRelay<Double> = .init(value: 0)
    let disposed = DisposeBag()
    static let cartViewModel = CartViewModel()
    let list = RealmManager.realManager.cartProductList.map(CartVM.init)
    
    
    func getCartProductList() {
        RealmManager.realManager.getCartProductList()
        
        // adette hata alırsan ayrı bir fonksiyon yaz
        self.cartProductCount.accept(list.count)
        
        self.cartProductList.accept(list)
    }
    
    func getCartProductTotal(){
        let totalCount = list.map{Int($0.price)! * $0.piece}
        cartProductTotal.accept(Double(totalCount[0]))
       
    }
    func addCartProduct(product:CartProduct) {
        RealmManager.realManager.addCartProduct(cartProduct: product)
        // let _ = getProductList()
    }
    
    func decraaseProduct(productId:ObjectId) {
        RealmManager.realManager.decraseCartProduct(id: productId)
        // let _ = getProductList()
        
    }
    func increaseProduct(productId:ObjectId) {
        RealmManager.realManager.increaseCartProduct(id: productId)
        // let _ = getProductList()
    }
    
    func deleteProduct(productId:ObjectId) {
        RealmManager.realManager.deleteProduct(id: productId)
        
    }
}



struct CartVM {
    var cartProduct : CartProduct
    
    var id:Int {
        cartProduct.id!
    }
    var title:String {
        cartProduct.title
    }
    var price:String {
        
        "$\(cartProduct.price)"
    }
    var category:String {
        cartProduct.category
    }
    
    var image:String {
        cartProduct.image
    }
    
    var piece : Int {
        cartProduct.piece
    }
}
