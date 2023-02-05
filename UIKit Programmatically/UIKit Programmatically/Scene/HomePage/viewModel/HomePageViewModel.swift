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
    var productCount : BehaviorRelay<Int> = .init(value: 0)
    static let homePageViewModel = HomePageViewModel()
    
    func getProductList()   {
        HomePageService.homePageService.fetchProduct { response in
            switch response {
            case .success(let list):
                self.productList.accept(list.map(ProductVM.init))
                self.productCount.accept(list.count)
            case .failure(let error):
                self.productList.accept([])
                print(error)
            }
        }
    }
    
    
    func getProductFilterList(selectedCategory:String) {
        HomePageService.homePageService.fetchProductFilter(selectedCategory: selectedCategory) { response in
            switch response {
            case .success(let list):
                self.productList.accept(list.map(ProductVM.init))
                self.productCount.accept(list.count)
            case .failure(let error):
                self.productList.accept([])
                print(error)
            }
        }
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
