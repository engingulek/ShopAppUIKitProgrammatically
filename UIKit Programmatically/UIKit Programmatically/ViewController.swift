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
    
    private lazy var viewSize = view.frame.size
    
    private lazy var collectionViewTestList : Observable<[String]> = {
        let item = "Item 1"
        let item2 = "Item 2"
        let item3 = "Item 3"
        let item4 = "Item 4"
        let item5 = "Item 5"
        let item6 = "Item 6"
        let item7 = "Item 7"
        
        return .just([item,item2,item3,item4,item5,item6,item7,item2,item3,item4,item5,item6,item7])
        
    }()
    
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
        return button
    }()
    
    private let collectionView  : UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .vertical
        
        
        
        layout.sectionInset = UIEdgeInsets(top: 10, left: 15, bottom: 10, right: 10)
        layout.minimumLineSpacing = 10
        layout.minimumInteritemSpacing = 10
        layout.itemSize = CGSize(width: 160, height: 200)
        let collectionView = UICollectionView(frame: .infinite,collectionViewLayout: layout)
        collectionView.register(CollectionViewCell.self, forCellWithReuseIdentifier: "cell")
        collectionView.backgroundColor = .black
        
        
        return collectionView
        
        
    }()

    

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
    
        view.addSubview(titleLabel)
        view.addSubview(textField)
        view.addSubview(button)
        view.addSubview(warningLabel)
        view.addSubview(collectionView)
        
        
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
        
        
        collectionViewTestList
            .bind(to: collectionView
                    .rx
                    .items(cellIdentifier: "cell", cellType: CollectionViewCell.self)) { row, element, cell in // 3
                        cell.backgroundColor = .red
                  }
                  .disposed(by: disposeBag)
        
        
        button.addTarget(self, action: #selector(searchList), for: .touchUpInside)
        configure()
        
    }
    
    
    @objc func searchList() {
    }
    
    
    func configure(){
        // MARK: - Title UILabel
        titleLabel.translatesAutoresizingMaskIntoConstraints = false
        titleLabel.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor,constant: 20).isActive = true
        titleLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        
        //MARK: - UITextField
        textField.translatesAutoresizingMaskIntoConstraints = false
        textField.topAnchor.constraint(equalTo: titleLabel.bottomAnchor,constant: 30).isActive = true
        textField.leftAnchor.constraint(equalTo: view.leftAnchor,constant: 20).isActive = true
        textField.rightAnchor.constraint(equalTo: view.rightAnchor,constant: -20).isActive = true
        textField.heightAnchor.constraint(equalToConstant: 30).isActive = true
        textField.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        
        
        //MARK: -Warning Label
        warningLabel.translatesAutoresizingMaskIntoConstraints = false
        warningLabel.topAnchor.constraint(equalTo: textField.bottomAnchor,constant: 5).isActive = true
        warningLabel.leftAnchor.constraint(equalTo: view.leftAnchor,constant: 20).isActive = true
        warningLabel.rightAnchor.constraint(equalTo: view.rightAnchor,constant: -20).isActive = true
        
        // MARK: - UIButtom
        button.translatesAutoresizingMaskIntoConstraints = false
        button.topAnchor.constraint(equalTo: warningLabel.bottomAnchor,constant: 35).isActive = true
        button.leftAnchor.constraint(equalTo: view.leftAnchor,constant: 50).isActive = true
        button.rightAnchor.constraint(equalTo: view.rightAnchor,constant: -50).isActive = true
        button.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        
        
        //MARK: CollectionView
        collectionView.translatesAutoresizingMaskIntoConstraints = false
        collectionView.topAnchor.constraint(equalTo: button.bottomAnchor,constant: 30).isActive = true
        collectionView.leftAnchor.constraint(equalTo: view.leftAnchor,constant: 5).isActive = true
        collectionView.rightAnchor.constraint(equalTo: view.rightAnchor,constant: -5).isActive = true
        collectionView.bottomAnchor.constraint(equalTo: view.bottomAnchor,constant: -10).isActive = true
        collectionView.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        
        
        
    }
}

