//
//  HomePageService.swift
//  UIKit Programmatically
//
//  Created by engin gülek on 4.02.2023.
//

import Foundation

class HomePageService {
    static let homePageService = HomePageService()
    
    func fetchProduct(completion:@escaping(Result<[Product],Error>)->()){
        ServiceManager.serviceManager.fetch(target: .products) { (response:Result<[Product]?,Error>) in
            switch response {
            case .success(let list):
                completion(.success(list!))
            case .failure(let error):
                completion(.failure(error))
                
            }
        }
    }
    
    func fetchProductFilter(selectedCategory:String,completion:@escaping(Result<[Product],Error>)->()){
        ServiceManager.serviceManager.fetch(target: .filterProduct(selectedCategory)) { (response:Result<[Product]?,Error>) in
            switch response {
            case .success(let list):
                completion(.success(list!))
            case .failure(let error):
                completion(.failure(error))
            }
            
        }
    }
}
