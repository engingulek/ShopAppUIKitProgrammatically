//
//  ViewController.swift
//  UIKit Programmatically
//
//  Created by engin gülek on 1.02.2023.
//

import UIKit

final class ViewController: UIViewController {
    
    private let titleLabel : UILabel = {
        let label = UILabel()
        label.text = "Title Label"
        label.textColor = UIColor.red
        label.font = UIFont.systemFont(ofSize: 30)
        return label
    }()
    


    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
    
        view.addSubview(titleLabel)
        
    }
    
    
    func configure(){
        // MARK: - Title UILabel
        titleLabel.translatesAutoresizingMaskIntoConstraints = false
        titleLabel.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor,constant: 20).isActive = true
        titleLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
    }
}

