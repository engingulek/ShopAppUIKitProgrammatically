//
//  HomePageViewModel.swift
//  ShopApp
//
//  Created by engin gülek on 2.03.2023.
//

import Foundation
import RxSwift
import RxCocoa

class HomePageViewModel {
    var productList : BehaviorRelay<[ProductVM]> = .init(value: [])
    var productCount : BehaviorRelay<Int> = .init(value: 0)
    static let homePageViewModel = HomePageViewModel()
    let disposed = DisposeBag()
    
    var testList  = [Product]()
    
    
    func whenDoNotInternetConnection(){
        testList = [
            .init(id: 1, title: "Title1", price: 125.0, category: "Category1", description: "Desc1", image: "url"),
            .init(id: 2, title: "Title2", price: 225.0, category: "Category2", description: "Desc2", image: "url2"),
            .init(id: 3, title: "Title3", price: 325.0, category: "Category3", description: "Desc3", image: "url3"),
            .init(id: 4, title: "Title4", price: 425.0, category: "Category4", description: "Desc4", image: "url4"),
            .init(id: 5, title: "Title5", price: 525.0, category: "Category5", description: "Desc5", image: "url5"),
            .init(id: 6, title: "Title6", price: 625.0, category: "Category6", description: "Desc6", image: "url6"),
        ]
    }
    
    func getProductList()   {
        whenDoNotInternetConnection()
        self.productList.accept(testList.map(ProductVM.init))
        self.productCount.accept(testList.count)
        /*HomePageService.homePageService.fetchProduct { response in
            switch response {
            case .success(let list):
                self.productList.accept(list.map(ProductVM.init))
                self.productCount.accept(list.count)
            case .failure(let error):
                self.productList.accept([])
                print(error)
            }
        }*/
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
    
    func getProductSearch(searchText:String){
        print(searchText)
        
        HomePageService.homePageService.fetchProduct { response in
            switch response {
            case .success(let list):
                let filterList = list.map(ProductVM.init).filter{$0.title.lowercased().contains(searchText.lowercased())}
                self.productList.accept(filterList)
                self.productCount.accept(filterList.count)
            case .failure(let error):
                self.productList.accept([])
                print(error)
            }
        }
        /*self.productList.subscribe(onNext : { list in
            let filterList = list.filter{$0.title.contains(searchText)}
            self.productList.accept(filterList)
            
        }).disposed(by: disposed )*/
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

