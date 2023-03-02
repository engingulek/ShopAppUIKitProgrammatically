//
//  CategoryService.swift
//  ShopApp
//
//  Created by engin gülek on 2.03.2023.
//

import Foundation

class CategoryService {
    static let categoryService = CategoryService()
    
    func getCategory(completion:@escaping(Result<[String]?,Error>)->()) {
        ServiceManager.serviceManager.fetch(target: .categories) {  (response:Result<[String]?,Error>) in
            switch response {
            case .success(let list):
                completion(.success(list))
            case .failure(let error):
                completion(.failure(error))
            }
        }
    }
}
