//
//  CategoryTableViewCell.swift
//  UIKit Programmatically
//
//  Created by engin gülek on 4.02.2023.
//

import UIKit
import RxSwift
class CategoryTableViewCell: UITableViewCell {

    let disposeBagCell = DisposeBag()
   private let categoryLabel : UILabel = {
        let label = UILabel()
        label.textColor = .black
        label.textAlignment = .center
        return label
    }()
    
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        contentView.addSubview(categoryLabel)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    func configureCell(element:String) {
        categoryLabel.text  = element
    }
    
   
    
    
    override func layoutSubviews() {
        super.layoutSubviews()
        categoryLabel.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            categoryLabel.topAnchor.constraint(equalTo: contentView.topAnchor,constant: 15),
            categoryLabel.bottomAnchor.constraint(equalTo: contentView.bottomAnchor),
            categoryLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor),
            categoryLabel.trailingAnchor.constraint(equalTo: contentView.trailingAnchor),
            
        ])
    }



}
