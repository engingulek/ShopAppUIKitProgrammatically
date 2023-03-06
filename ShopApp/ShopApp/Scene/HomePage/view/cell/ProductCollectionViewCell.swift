//
//  ProductCollectionViewCell.swift
//  ShopApp
//
//  Created by engin gülek on 2.03.2023.
//

import UIKit
import Kingfisher
import RxSwift
import RxCocoa


protocol ProductCollectionViewCellProtocol {
    func addCartProduct(product:ProductVM)
}


 class ProductCollectionViewCell: UICollectionViewCell {

    
      let disposeBagCell = DisposeBag()
    
   private let productionImage : UIImageView = {
        let image = UIImageView()
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
    
    
   let addCartButton : UIButton = {
        
        let button = UIButton()
       return button.addCartButton(backColor: .red)
    }()
     
     
     
     var cellProtocol : ProductCollectionViewCellProtocol?
     var index : Int?
     var product : ProductVM?


    override init(frame: CGRect) {
        super.init(frame: frame)
        
        
        
        // contentView.  diyerek burada ekle
        addSubview(productionImage)
        addSubview(productionTitle)
        addSubview(productionCategory)
        addSubview(productionPrice)
        addSubview(addCartButton)
        
        contentView.layer.borderWidth = 1
        contentView.layer.borderColor = UIColor.lightGray.cgColor
        contentView.layer.cornerRadius = 10
     
        
        
        addCartButton.rx.tap.subscribe { _ in
            self.cellProtocol?.addCartProduct(product: self.product!)
        }.disposed(by: disposeBagCell)
    }
     

     
 
     
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func configureCell(product:ProductVM){
        productionTitle.text = product.title
        productionCategory.text = product.category
        productionImage.kf.setImage(with: URL(string: product.image))
        productionPrice.text = "$\(product.price)"

    }
    override func layoutSubviews() {
        
        productionImage.translatesAutoresizingMaskIntoConstraints = false
        productionTitle.translatesAutoresizingMaskIntoConstraints = false
        productionCategory.translatesAutoresizingMaskIntoConstraints = false
        productionPrice.translatesAutoresizingMaskIntoConstraints = false
        addCartButton.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            
            
            //MARK: - Production UI
            
            /// Production Image
            productionImage.topAnchor.constraint(equalTo: contentView.safeAreaLayoutGuide.topAnchor,constant: 10),
            productionImage.leftAnchor.constraint(equalTo: contentView.leftAnchor,constant: 20),
            productionImage.rightAnchor.constraint(equalTo: contentView.rightAnchor,constant: -20),
            productionImage.centerXAnchor.constraint(equalTo: contentView.centerXAnchor),
            productionImage.heightAnchor.constraint(equalToConstant: contentView.frame.height / 2.5),
            
            /// Production Title
            productionTitle.topAnchor.constraint(equalTo: productionImage.bottomAnchor,constant: 5),
            productionTitle.leftAnchor.constraint(equalTo: contentView.leftAnchor,constant: 10),
            productionTitle.rightAnchor.constraint(equalTo: contentView.rightAnchor,constant: -10),
            productionTitle.centerXAnchor.constraint(equalTo: contentView.centerXAnchor),
            
            
            
            /// Production Category
            productionCategory.topAnchor.constraint(equalTo: productionTitle.bottomAnchor,constant: 5),
            productionCategory.leftAnchor.constraint(equalTo: contentView.leftAnchor),
            productionCategory.rightAnchor.constraint(equalTo: contentView.rightAnchor),
            productionCategory.centerXAnchor.constraint(equalTo: contentView.centerXAnchor),
            
            /// Production Price
            productionPrice.topAnchor.constraint(equalTo: productionCategory.bottomAnchor,constant: 5),
            productionPrice.leftAnchor.constraint(equalTo: contentView.leftAnchor),
            productionPrice.rightAnchor.constraint(equalTo: contentView.rightAnchor),
            productionPrice.centerXAnchor.constraint(equalTo: contentView.centerXAnchor),
            
            /// Add Cart Button
            addCartButton.bottomAnchor.constraint(equalTo: contentView.bottomAnchor,constant: -10),
            addCartButton.leftAnchor.constraint(equalTo: contentView.leftAnchor,constant: 10),
            addCartButton.rightAnchor.constraint(equalTo: contentView.rightAnchor,constant: -10),
            addCartButton.centerXAnchor.constraint(equalTo: contentView.centerXAnchor),
            
        ])
    }
}

