//
//  CartCollectionViewCell.swift
//  ShopApp
//
//  Created by engin gülek on 2.03.2023.
//

import UIKit
import Kingfisher
import RxSwift
import RxCocoa



class CartCollectionViewCell : UICollectionViewCell {
    private let productionImage : UIImageView = {
        let image = UIImageView()
        image.image = UIImage(systemName: "figure.walk")
        /*image.kf.setImage(with: URL(string: "https://static.nike.com/a/images/c_limit,w_592,f_auto/t_product_v1/0347d890-b837-475f-a1eb-850d09e7bd28/air-force-1-07-premium-ayakkab%C4%B1s%C4%B1-Jzt4p7.png"))*/
        return image
    }()
    
    private let productionTitle : UILabel  = {
        let label = UILabel()
        return label.productionTitle()
    }()
    
    
    private let productionCategory : UILabel  = {
        let label = UILabel()
        return label.productionCategory()
    }()
    
    private let productionPrice : UILabel  = {
        let label = UILabel()
        return label.productionPrice()
    }()
    
    private let productPiece : UILabel = {
        let label = UILabel()
        return label.piece()
    }()
    
    private let increaseButton : UIButton = {
        let button = UIButton()
        return button.pieceActionButton(actionTypeText: "+")
    }()
    
    private let decreaseButton : UIButton = {
        let button = UIButton()
        return button.pieceActionButton(actionTypeText: "-")
    }()
    
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        addSubview(productionImage)
        addSubview(productionTitle)
        addSubview(productionCategory)
        addSubview(productionPrice)
        addSubview(productPiece)
        addSubview(increaseButton)
        addSubview(decreaseButton)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func configureCell(cartProduct : CartVM) {
        productionTitle.text = cartProduct.title
        productionCategory.text = cartProduct.category
        productionPrice.text = "$200"
        productPiece.text = "\(cartProduct.piece)"
    }
    
    override func layoutSubviews() {
        productionImage.translatesAutoresizingMaskIntoConstraints = false
        productionTitle.translatesAutoresizingMaskIntoConstraints = false
        productionCategory.translatesAutoresizingMaskIntoConstraints = false
        productionPrice.translatesAutoresizingMaskIntoConstraints = false
        productPiece.translatesAutoresizingMaskIntoConstraints = false
        increaseButton.translatesAutoresizingMaskIntoConstraints = false
        decreaseButton.translatesAutoresizingMaskIntoConstraints = false
        
        
        NSLayoutConstraint.activate([
        //MARK: - CartProduct Cell UI
            
            productionImage.topAnchor.constraint(equalTo: contentView.safeAreaLayoutGuide.topAnchor,constant: 10),
            productionImage.leadingAnchor.constraint(equalTo: contentView.safeAreaLayoutGuide.leadingAnchor,constant: 5),
            productionImage.centerYAnchor.constraint(equalTo: contentView.centerYAnchor),
            productionImage.heightAnchor.constraint(equalToConstant: contentView.frame.height / 1.5),
            productionImage.widthAnchor.constraint(equalToConstant: contentView.frame.width / 2.5),
            
            productionTitle.topAnchor.constraint(equalTo: contentView.safeAreaLayoutGuide.topAnchor ,constant: 10),
            productionTitle.leadingAnchor.constraint(equalTo: productionImage.safeAreaLayoutGuide.trailingAnchor,constant: 20),
            
            productionCategory.topAnchor.constraint(equalTo: productionTitle.safeAreaLayoutGuide.topAnchor,constant: 20),
            productionCategory.leadingAnchor.constraint(equalTo: productionImage.safeAreaLayoutGuide.trailingAnchor,constant: 20),
            
            productionPrice.topAnchor.constraint(equalTo: productionCategory.safeAreaLayoutGuide.topAnchor,constant: 20),
            productionPrice.leadingAnchor.constraint(equalTo: productionImage.safeAreaLayoutGuide.trailingAnchor,constant: 20),
            
            decreaseButton.topAnchor.constraint(equalTo: productionPrice.safeAreaLayoutGuide.topAnchor,constant: 30),
            decreaseButton.leadingAnchor.constraint(equalTo: productionImage.safeAreaLayoutGuide.trailingAnchor,constant: 20),
            
            productPiece.topAnchor.constraint(equalTo: productionPrice.safeAreaLayoutGuide.topAnchor,constant: 35),
            productPiece.leadingAnchor.constraint(equalTo: decreaseButton.safeAreaLayoutGuide.trailingAnchor,constant: 20),
            
            increaseButton.topAnchor.constraint(equalTo: productionPrice.safeAreaLayoutGuide.topAnchor,constant: 30),
            increaseButton.leadingAnchor.constraint(equalTo: productPiece.safeAreaLayoutGuide.trailingAnchor,constant: 20)

        ])
    }
}
