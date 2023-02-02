//
//  CollectionViewCell.swift
//  UIKit Programmatically
//
//  Created by engin gülek on 1.02.2023.
//

import UIKit
import Kingfisher
import RxSwift
final class CollectionViewCell : UICollectionViewCell {
    static let identifer = "CollectionViewCell"
   private let productionImage : UIImageView = {
        let image = UIImageView()
        image.kf.setImage(with: URL(string: "https://static.nike.com/a/images/c_limit,w_592,f_auto/t_product_v1/0347d890-b837-475f-a1eb-850d09e7bd28/air-force-1-07-premium-ayakkab%C4%B1s%C4%B1-Jzt4p7.png"))
        
        return image
        
    }()
    
    private let productionTitle : UILabel  = {
        let label = UILabel()
        label.text = "Production Name"
        label.font = UIFont.preferredFont(forTextStyle: .callout)
        label.textAlignment = .center
        return label
    }()
    
    
    private let productionCategory : UILabel  = {
        let label = UILabel()
        label.text = "Category Name"
        label.font = UIFont.preferredFont(forTextStyle: .footnote)
        label.textAlignment = .center
        return label
    }()
    
    private let productionPrice : UILabel  = {
        let label = UILabel()
        label.text = "Price"
        label.font = UIFont.preferredFont(forTextStyle: .headline)
        label.textAlignment = .center
        return label
    }()
    
    
    private let addCartButton : UIButton = {
        
        let button = UIButton()
        button.backgroundColor = .blue
        button.titleLabel?.textAlignment = .center
        button.setTitle("Add Cart", for: .normal)
        button.setTitleColor(.white, for: .normal)
        button.titleLabel?.font = UIFont.preferredFont(forTextStyle: .callout)
        button.layer.cornerRadius = 15
        return button
        /*let button = UIButton()
        button.backgroundColor = .blue
        button.titleLabel?.textAlignment = .center
        button.titleLabel?.text = "Add Button"
        button.setTitleColor(.white, for: .)
        button.layer.cornerRadius = 15
        button.titleLabel?.font = UIFont.preferredFont(forTextStyle: .subheadline)
        return button*/
    }()
    
    
    
    
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
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
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
            productionImage.heightAnchor.constraint(equalToConstant: contentView.frame.height / 2),
            
            /// Production Title
            productionTitle.topAnchor.constraint(equalTo: productionImage.bottomAnchor,constant: 5),
            productionTitle.leftAnchor.constraint(equalTo: contentView.leftAnchor),
            productionTitle.rightAnchor.constraint(equalTo: contentView.rightAnchor),
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
