//
//  ViewController.swift
//  UIKit Programmatically
//
//  Created by engin gülek on 1.02.2023.
//

import UIKit
import RxSwift
import RxCocoa
final class ViewController: UIViewController {
    private let disposeBag = DisposeBag()
    
    
    private let titleLabel : UILabel = {
        let label = UILabel()
        label.text = "Title Label"
        label.textColor = UIColor.red
        label.font = UIFont.systemFont(ofSize: 30)
        return label
    }()
    
    private let textField : UITextField = {
        let textFiled = UITextField()
        textFiled.placeholder = "Text Field"
        textFiled.backgroundColor = UIColor.lightGray
        textFiled.textAlignment = .center
        textFiled.borderStyle = .roundedRect
        return textFiled
    }()
    
    private let warningLabel : UILabel = {
        let label = UILabel()
        label.text = "Must be at least 6 characters"
        label.textColor = .red
        label.textAlignment = .left
        label.isHidden = true
        return label
    }()
    
    private let button : UIButton = {
        let button = UIButton()
        button.backgroundColor = .red
        button.setTitleColor(.lightGray, for: .disabled)
        button.titleLabel?.textAlignment = .center
        button.setTitle("Click", for: .normal)
        button.setTitleColor(.white, for: .normal)
        button.layer.cornerRadius = 15
        
        if button.state == .disabled {
            button.backgroundColor = UIColor(red: 100, green: 132, blue: 132, alpha: 0)
        }
        
        
        return button
    }()
    

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
    
        view.addSubview(titleLabel)
        view.addSubview(textField)
        view.addSubview(button)
        view.addSubview(warningLabel)
        
        
        // Eğer işlemler gerçekleşir ise newTextField True değerini alacak ve bu değer ile button aktif olup olmama durumu kontrol edilecek
        let newTextField = textField
            .rx
            .text
            .orEmpty
            .map{$0.count >= 6}
            .debug("newTextField",trimOutput: true)
            .share()
            .throttle(.milliseconds(100), scheduler: MainScheduler.instance)
        
        newTextField
            .bind(to: button.rx.isEnabled)
            .disposed(by: disposeBag)
        
        newTextField
            .bind(to: warningLabel.rx.isHidden)
            .disposed(by: disposeBag)
        
        
        
        
        
        
            
        
        
       
        
        
        
        configure()
        
    }
    
    
    func configure(){
        // MARK: - Title UILabel
        titleLabel.translatesAutoresizingMaskIntoConstraints = false
        titleLabel.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor,constant: 20).isActive = true
        titleLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        
        //MARK : - UITextField
        textField.translatesAutoresizingMaskIntoConstraints = false
        textField.topAnchor.constraint(equalTo: titleLabel.bottomAnchor,constant: 30).isActive = true
        textField.leftAnchor.constraint(equalTo: view.leftAnchor,constant: 20).isActive = true
        textField.rightAnchor.constraint(equalTo: view.rightAnchor,constant: -20).isActive = true
        textField.heightAnchor.constraint(equalToConstant: 30).isActive = true
        textField.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        
        
        //MARK: Warning Label
        warningLabel.translatesAutoresizingMaskIntoConstraints = false
        warningLabel.topAnchor.constraint(equalTo: textField.bottomAnchor,constant: 5).isActive = true
        warningLabel.leftAnchor.constraint(equalTo: view.leftAnchor,constant: 20).isActive = true
        warningLabel.rightAnchor.constraint(equalTo: view.rightAnchor,constant: -20).isActive = true
        
        // MARK : - UIButtom
        button.translatesAutoresizingMaskIntoConstraints = false
        button.topAnchor.constraint(equalTo: warningLabel.bottomAnchor,constant: 35).isActive = true
        button.leftAnchor.constraint(equalTo: view.leftAnchor,constant: 50).isActive = true
        button.rightAnchor.constraint(equalTo: view.rightAnchor,constant: -50).isActive = true
        button.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        
    }
}

