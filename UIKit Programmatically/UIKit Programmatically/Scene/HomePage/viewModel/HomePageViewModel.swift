//
//  ProductListViewModel.swift
//  UIKit Programmatically
//
//  Created by engin gülek on 4.02.2023.
//

import Foundation
import RxSwift
import RxCocoa

class HomePageViewModel {
    var productList : BehaviorRelay<[ProductVM]> = .init(value: [])
    static let homePageViewModel = HomePageViewModel()
    
    func getProductList()  -> Observable <[ProductVM]>  {
        HomePageService.homePageService.fetchProduct { response in
            switch response {
            case .success(let list):
                self.productList.accept(list.map(ProductVM.init))
            case .failure(let error):
                self.productList.accept([])
                print(error)
            }
        }
        return   self.productList.map{$0.map{ProductVM(product: $0.product)}}
        
    }
}


struct ProductVM  {
    var product : Product
    
    var id:Int {
        product.id!
    }
    var title:String {
        product.title!
    }
    var price:String {
        
        "$\(product.price!)"
    }
    var category:String {
        product.category!
    }
    var description:String {
        product.description!
    }
    var image:String {
        product.image!
    }
    
}
