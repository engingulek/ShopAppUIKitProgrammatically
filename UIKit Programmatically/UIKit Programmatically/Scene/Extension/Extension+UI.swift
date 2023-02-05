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
           
            image.layer.borderWidth = 1
            image.layer.borderColor = UIColor.lightGray.cgColor
            image.layer.cornerRadius =  20
            image.contentMode = .scaleAspectFit
            
           
            return image
        }
    }
}





