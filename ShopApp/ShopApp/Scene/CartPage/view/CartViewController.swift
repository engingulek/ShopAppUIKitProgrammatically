//
//  CartViewController.swift
//  ShopApp
//
//  Created by engin gülek on 2.03.2023.
//

import Foundation
import RxSwift
import RxCocoa
import UIKit
class CartViewController: UIViewController {

    private let disposeBag = DisposeBag()
    
    private let amountView : UIView = {
        let uiView = UIView()
        uiView.backgroundColor = .red
        return uiView
    }()
    
    private let amountLabel : UILabel = {
        let label = UILabel()
        label.text = "Total : $300"
        label.textColor = .white
        label.textAlignment = .center
        label.font = UIFont.preferredFont(forTextStyle: .title2)
        return label
    }()
    
 
    
    
    
    
    private let collectionView  : UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .vertical
        layout.sectionInset = UIEdgeInsets(top: 10, left: 15, bottom: 10, right: 10)
 
        layout.minimumLineSpacing = 10
        layout.minimumInteritemSpacing = 10
        layout.itemSize = CGSize(width: UIScreen.main.bounds.width, height: UIScreen.main.bounds.height / 5)
        
        let collectionView = UICollectionView(frame: .infinite,collectionViewLayout: layout)
        collectionView.register(CartCollectionViewCell.self, forCellWithReuseIdentifier: "cell")
        
        return collectionView
        
        
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        view.addSubview(amountView)
        view.addSubview(collectionView)
        amountView.addSubview(amountLabel)
        configure()
        
        
       // HomePageViewModel.homePageViewModel.getProductList()
        var testList : BehaviorRelay<[String]> = .init(value: [])
        let  list = ["Deneme1", "Deneme2", "Deneme 3","Deneme 3","Deneme 3"]
        testList.accept(list)
        
        testList
            .bind(to: collectionView
                    .rx
                    .items(cellIdentifier: "cell", cellType: CartCollectionViewCell.self)) { row, element, cell in
                       // cell.configureCell(product: element)
                        cell.configureCell(testString: element)
                        cell.backgroundColor = .green
                        cell.contentView.isUserInteractionEnabled = false
                    }
                    .disposed(by: disposeBag)
       

        
      
                
              
               
    
    }
    func configure(){
        amountView.translatesAutoresizingMaskIntoConstraints = false
        amountLabel.translatesAutoresizingMaskIntoConstraints = false
        collectionView.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            collectionView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            collectionView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            collectionView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            collectionView.bottomAnchor.constraint(equalTo: amountView.topAnchor),
            collectionView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            
            
            
            
            amountView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor),
            amountView.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor),
            amountView.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor),
            amountView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            amountView.heightAnchor.constraint(equalToConstant: view.frame.height / 12),
            
            
            amountLabel.centerYAnchor.constraint(equalTo: amountView.safeAreaLayoutGuide.centerYAnchor),
            /*amountLabel.topAnchor.constraint(equalTo: amountView.safeAreaLayoutGuide.topAnchor,constant: 10),*/
            amountLabel.leadingAnchor.constraint(equalTo: amountView.safeAreaLayoutGuide.leadingAnchor),
            amountLabel.trailingAnchor.constraint(equalTo: amountView.safeAreaLayoutGuide.trailingAnchor),
            amountLabel.centerXAnchor.constraint(equalTo: amountView.safeAreaLayoutGuide.centerXAnchor)
        ])
    }
}

