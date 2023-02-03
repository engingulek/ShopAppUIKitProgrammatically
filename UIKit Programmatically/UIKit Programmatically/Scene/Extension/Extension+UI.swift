//
//  Extension+UI.swift
//  UIKit Programmatically
//
//  Created by engin gülek on 3.02.2023.
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
}


extension UIImageView {
    var detailImage : UIImageView {
        get{
            let image = UIImageView()
            image.kf.setImage(with: URL(string: "https://static.nike.com/a/images/c_limit,w_592,f_auto/t_product_v1/0347d890-b837-475f-a1eb-850d09e7bd28/air-force-1-07-premium-ayakkab%C4%B1s%C4%B1-Jzt4p7.png"))
            image.layer.borderWidth = 1
            image.layer.borderColor = UIColor.black.cgColor
            image.layer.cornerRadius =  20
            return image
        }
    }
}
