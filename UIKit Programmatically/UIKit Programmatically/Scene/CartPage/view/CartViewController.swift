//
//  CartViewController.swift
//  UIKit Programmatically
//
//  Created by engin gülek on 5.02.2023.
//

import UIKit
import RxSwift
import RxCocoa
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
        layout.itemSize = CGSize(width: 160, height: 260)
        
        let collectionView = UICollectionView(frame: .infinite,collectionViewLayout: layout)
        collectionView.register(CollectionViewCell.self, forCellWithReuseIdentifier: "cell")
        
        return collectionView
        
        
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        view.addSubview(amountView)
        view.addSubview(collectionView)
        amountView.addSubview(amountLabel)
        configure()
        
        
        HomePageViewModel.homePageViewModel.getProductList()
        CartViewModel.cartViewModel.cartProductList
            .bind(to: collectionView
                    .rx
                    .items(cellIdentifier: "cell", cellType: CollectionViewCell.self)) { row, element, cell in
                       // cell.configureCell(product: element)
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
