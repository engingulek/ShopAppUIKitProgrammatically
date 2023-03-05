//
//  RealmManager.swift
//  ShopApp
//
//  Created by engin gülek on 2.03.2023.
//

import Foundation
import RealmSwift

class RealmManager : ObservableObject {
    private(set) var localRealm : Realm?
    @Published var cartProductList : [CartProduct] = []
    static let realManager = RealmManager()
    
    init(){
        openRealm()
    }
    
    
    func openRealm(){
        do{
            let config = Realm.Configuration(schemaVersion: 1)
            Realm.Configuration.defaultConfiguration = config
            localRealm  = try Realm()
        }catch{
            print("Error opening Realm", error)
        }
    }
    
    func getCartProductList(){
        if let localRealm = localRealm {
            let allCartProductList = localRealm.objects(CartProduct.self)
            cartProductList = []
            allCartProductList.forEach { task in
                cartProductList.append(task)
            }
            print("RealmManager CartList : \(cartProductList)")
        }
    }
    
    func addCartProduct(cartProduct : CartProduct) {
        
        if let localRealm = localRealm {
            
            do{
                try localRealm.write{
                    localRealm.add(cartProduct)
                }
            }catch{
                print("Error adding task to Realm: \(error)")
            }
        }
    }
    
    
    func increaseCartProduct(id:Int) {
        
        if let localRealm = localRealm{
            do{
                let updateCartProduct = localRealm.objects(CartProduct.self).filter(NSPredicate(format: "id == %ld", id))
                guard !updateCartProduct.isEmpty else {return}
                
                try localRealm.write{
                    if  updateCartProduct[0].piece != 0 {
                        updateCartProduct[0].piece +=  1
                    }
                    getCartProductList()
                }
            }catch{
                print("Error updating task \(id) to Realm: \(error)")
            }
        }
    }
    
    
    func decraseCartProduct(id:Int) {
        
        if let localRealm = localRealm{
            do{
                let updateCartProduct = localRealm.objects(CartProduct.self).filter(NSPredicate(format: "id == %ld", id))
                guard !updateCartProduct.isEmpty else {return}
                
                try localRealm.write{
                    if  updateCartProduct[0].piece != 0 {
                        updateCartProduct[0].piece -=  1
                    }
                    getCartProductList()
                }
            }catch{
                print("Error updating task \(id) to Realm: \(error)")
            }
        }
    }
    
    
    func deleteProduct(id:ObjectId){
        if let localRealm = localRealm{
            do{
                let productDelete = localRealm.objects(CartProduct.self).filter(NSPredicate(format: "id == %@", id))
                guard !productDelete.isEmpty else {return}
                
                try localRealm.write{
                    localRealm.delete(productDelete)
                    getCartProductList()
                }
            }catch{
                print("Error updating task \(id) to Realm: \(error)")
            }
        }
    }
}
