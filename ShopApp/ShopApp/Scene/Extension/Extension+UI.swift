//
//  Extension+UI.swift
//  ShopApp
//
//  Created by engin gülek on 2.03.2023.
//

import Foundation
import UIKit.UIButton
import UIKit.UIImageView
import UIKit.UILabel



extension UIButton {
    func addCartButton(backColor : UIColor) -> UIButton  {
               let button = UIButton()
               button.backgroundColor = .blue
               button.titleLabel?.textAlignment = .center
               button.setTitle("Add Cart", for: .normal)
               button.setTitleColor(.white, for: .normal)
               button.titleLabel?.font = UIFont.preferredFont(forTextStyle: .callout)
               button.layer.cornerRadius = 15
               return button
       }
    
    func pieceActionButton(actionTypeText:String) -> UIButton {
        let button = UIButton()
        button.backgroundColor = .red
        button.titleLabel?.textAlignment = .center
        button.setTitle(actionTypeText, for: .normal)
        button.titleLabel?.font = UIFont.preferredFont(forTextStyle: .headline)
        button.layer.cornerRadius = 15
        return button
    }
}

extension UILabel  {
    func productionTitle() -> UILabel {
        let label = UILabel()
        label.text = "Production Name"
        label.font = UIFont.preferredFont(forTextStyle: .callout)
        label.textAlignment = .center
        label.numberOfLines = 2
        return label
    }
    
    func productionCategory() -> UILabel {
        let label = UILabel()
        label.text = "Category Name"
        label.font = UIFont.preferredFont(forTextStyle: .footnote)
        label.textAlignment = .center
        return label
    }
    
    func productionPrice() -> UILabel {
        let label = UILabel()
        label.text = "Price"
        label.font = UIFont.preferredFont(forTextStyle: .headline)
        label.textAlignment = .center
        return label
    }
    
    func piece()-> UILabel {
        let label = UILabel()
        label.text = "1"
        label.font = UIFont.preferredFont(forTextStyle: .subheadline)
        label.textAlignment = .center
        return label
    }
}


extension UIImageView {
    var detailImage : UIImageView {
        get{
            let image = UIImageView()
           
            image.layer.borderWidth = 1
            image.layer.borderColor = UIColor.lightGray.cgColor
            image.layer.cornerRadius =  20
            image.contentMode = .scaleAspectFit
            
           
            return image
        }
    }
}
