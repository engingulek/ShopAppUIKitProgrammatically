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
        
    }

    func addCartProduct(product:ProductVM) {
        let newCartProduct =  CartProduct(value: [
            
            "id":product.id,
            "title":product.title,
            //"price":Double(product.price)!,
            "category":product.category,
            "image":product.image])
        
        print("Test Product \(newCartProduct)")
        
        RealmManager.realManager.getCartProductList()
        let list = RealmManager.realManager.cartProductList.map(CartVM.init)
        if list.contains(where: {$0.id == product.id}) {
            increaseProduct(productId: product.id)
        }else{
            RealmManager.realManager.addCartProduct(cartProduct: newCartProduct)
            
        }
       
    }
    
    func decraaseProduct(productId:Int) {
        RealmManager.realManager.decraseCartProduct(id: productId)
         let _ = getCartProductList()
        
    }
    func increaseProduct(productId:Int) {
        print(productId)
        RealmManager.realManager.increaseCartProduct(id: productId)
        let _ = getCartProductList()
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
