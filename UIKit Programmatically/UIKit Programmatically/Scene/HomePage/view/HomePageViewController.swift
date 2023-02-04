//
//  ViewController.swift
//  UIKit Programmatically
//
//  Created by engin gülek on 1.02.2023.
//

import UIKit
import RxSwift
import RxCocoa
final class HomePageViewController: UIViewController,CollecrtionViewCellProtocol {
  
    
    private let disposeBag = DisposeBag()
    
    private lazy var viewSize = view.frame.size
    
    private lazy var collectionViewTestList : Observable<[Product]> = {
       let product1 = Product(id: 1, title: "Product Nmae 1", priece: "1", category: "Category Name 1", description: "Des 1", image: "https://static.nike.com/a/images/c_limit,w_592,f_auto/t_product_v1/0347d890-b837-475f-a1eb-850d09e7bd28/air-force-1-07-premium-ayakkab%C4%B1s%C4%B1-Jzt4p7.png")
        
        let product2 = Product(id: 2, title: "Product Nmae 2", priece: "2", category: "Category Name 2", description: "Des 2", image: "https://static.nike.com/a/images/c_limit,w_592,f_auto/t_product_v1/0347d890-b837-475f-a1eb-850d09e7bd28/air-force-1-07-premium-ayakkab%C4%B1s%C4%B1-Jzt4p7.png")
        
        return .just([product1,product2])
        
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
        button.setTitle("Category", for: .normal)
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
        layout.itemSize = CGSize(width: 160, height: 260)
        
        let collectionView = UICollectionView(frame: .infinite,collectionViewLayout: layout)
        collectionView.register(CollectionViewCell.self, forCellWithReuseIdentifier: "cell")
        
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
        navigationItem.title = "Home Page"
        
        
        // Eğer işlemler gerçekleşir ise newTextField True değerini alacak ve bu değer ile button aktif olup olmama durumu kontrol edilecek
        let newTextField = textField
            .rx
            .text
            .orEmpty
            .map{$0.count >= 6}
            .debug("newTextField",trimOutput: true)
            .share()
            .throttle(.milliseconds(100), scheduler: MainScheduler.instance)
        
       /*newTextField
            .bind(to: button.rx.isEnabled)
            .disposed(by: disposeBag)*/
        
        newTextField
            .bind(to: warningLabel.rx.isHidden)
            .disposed(by: disposeBag)
        
        
        
        
        collectionViewTestList
            .bind(to: collectionView
                    .rx
                    .items(cellIdentifier: "cell", cellType: CollectionViewCell.self)) { row, element, cell in
                        cell.configureCell(product: element)
                        cell.contentView.isUserInteractionEnabled = false
                        cell.index = row
                        cell.cellProtocol = self
                    }
                  .disposed(by: disposeBag)
        
        collectionView.rx.itemSelected.subscribe(onNext : { product in
            self.navigationController?.pushViewController(DetailViewController(), animated: true)
           
            
            if let  selectedItemsIndexPath = self.collectionView.indexPathsForSelectedItems {
                self.collectionView.deleteItems(at: selectedItemsIndexPath)
            }
        }).disposed(by: disposeBag)
        
        
       // button.addTarget(self, action: #selector(searchList), for: .touchUpInside)
        button.rx.tap.subscribe { _ in
            print("Categori Buttonuna tıklandı")
        }.disposed(by: disposeBag)
        configure()
        
        
        button.rx.tap.subscribe { _ in
            self.present(CategoryViewController(), animated: true)
        }.disposed(by: disposeBag)
        
        
        
    }
    
    
    func addCartProduct(index: Int) {
        print(index)
    }
    
    
    @objc func searchList() {
        
    }
    
    
    
    
    func configure(){
        
        titleLabel.translatesAutoresizingMaskIntoConstraints = false
        textField.translatesAutoresizingMaskIntoConstraints = false
        warningLabel.translatesAutoresizingMaskIntoConstraints = false
        button.translatesAutoresizingMaskIntoConstraints = false
        collectionView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            // MARK: - Title UILabel
            titleLabel.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor,constant: 20),
            titleLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            
            //MARK: - UITextField
            textField.topAnchor.constraint(equalTo: titleLabel.bottomAnchor,constant: 20),
            textField.leftAnchor.constraint(equalTo: view.leftAnchor,constant: 20),
            textField.rightAnchor.constraint(equalTo: view.rightAnchor,constant: -20),
            textField.heightAnchor.constraint(equalToConstant: 30),
            textField.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            
            //MARK: -Warning Label
            warningLabel.topAnchor.constraint(equalTo: textField.bottomAnchor,constant: 5),
            warningLabel.leftAnchor.constraint(equalTo: view.leftAnchor,constant: 20),
            warningLabel.rightAnchor.constraint(equalTo: view.rightAnchor,constant: -20),
            
            // MARK: - UIButtom
            button.topAnchor.constraint(equalTo: warningLabel.bottomAnchor,constant: 20),
            button.leftAnchor.constraint(equalTo: view.leftAnchor,constant: 50),
            button.rightAnchor.constraint(equalTo: view.rightAnchor,constant: -50),
            button.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            
            //MARK: CollectionView
            collectionView.topAnchor.constraint(equalTo: button.bottomAnchor,constant: 30),
            collectionView.leftAnchor.constraint(equalTo: view.leftAnchor,constant: 5),
            collectionView.rightAnchor.constraint(equalTo: view.rightAnchor,constant: -5),
            collectionView.bottomAnchor.constraint(equalTo: view.bottomAnchor,constant: -10),
            collectionView.centerXAnchor.constraint(equalTo: view.centerXAnchor)

        
        ])
    }
}

