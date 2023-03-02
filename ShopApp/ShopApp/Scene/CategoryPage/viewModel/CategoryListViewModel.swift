//
//  CategoryListViewModel.swift
//  ShopApp
//
//  Created by engin gülek on 2.03.2023.
//

import Foundation
import RxSwift
import RxCocoa

class CategoryListViewModel {
    var categoryList = PublishSubject<[String]>()
    
    static let categoryViewModel = CategoryListViewModel()
    
    func getCategoryList() -> Observable<[String]> {
        CategoryService.categoryService.getCategory { response in
            switch response {
            case .success(let list):
                print(list!)
                self.categoryList.onNext(list!)
            case .failure(let error):
                self.categoryList.onNext([])
                print(error)
            }
        }
        return self.categoryList.map{$0}
    }
}
