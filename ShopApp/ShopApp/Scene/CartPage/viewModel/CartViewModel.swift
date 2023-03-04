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
    
    var cartProductTotal : BehaviorRelay<Double> = .init(value: 0)
    let disposed = DisposeBag()
    static let cartViewModel = CartViewModel()
    let list = RealmManager.realManager.cartProductList.map(CartVM.init)
    

    
    func getCartProductList() -> Observable<[CartVM]> {
        RealmManager.realManager.getCartProductList()
        let list = RealmManager.realManager.cartProductList.map(CartVM.init)
        self.cartProductList.accept(list)
        return self.cartProductList.map{$0.map{CartVM(cartProduct: $0.cartProduct)}}
    }
    
    
    func getCartProductListCount()->Observable<Int> {
        RealmManager.realManager.getCartProductList()
        let list = RealmManager.realManager.cartProductList.map(CartVM.init)
        self.cartProductList.accept(list)
    
        return cartProductList.map{$0.count}
    }
    
    func getCartProductTotal() -> Observable<Double> {
        RealmManager.realManager.getCartProductList()
        let list = RealmManager.realManager.cartProductList.map(CartVM.init)
        self.cartProductList.accept(list)
    
        return cartProductList.map{Double($0.reduce(0, {$0 + (200 * $1.piece)}))}
        
      /* let totalCount =  list.reduce(0, {$0 + (200 * $1.piece)})
        
        cartProductTotal.accept(Double(totalCount))
        print("Total Control : \(cartProductTotal.value)")
        return self.cartProductTotal.element(at: 0)*/
        
    }

    
   /* func getCartProductTotal(){
        let totalCount = list.map{Int($0.price)! * $0.piece}
        cartProductTotal.accept(Double(totalCount[0]))
       
    }*/
    func addCartProduct(product:CartProduct) {
        
        RealmManager.realManager.addCartProduct(cartProduct: product)
        let _ = getCartProductList()
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
   /*var price:String {
        
       "$\(String(describing: cartProduct.price))"
    }*/
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
