//
//  HomePageViewController.swift
//  ShopApp
//
//  Created by engin gülek on 2.03.2023.
//

import UIKit
import RxSwift
import RxCocoa
final class HomePageViewController: UIViewController,ProductCollectionViewCellProtocol {
  
  
    
    private let disposeBag = DisposeBag()
    var selectedCategory = ""
    
    private lazy var viewSize = view.frame.size
    private let titleLabel : UILabel = {
        let label = UILabel()
        label.text = "Product Count"
        label.textColor = UIColor.red
        label.font = UIFont.systemFont(ofSize: 20)
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
        label.text = "Product not found"
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
        collectionView.register(ProductCollectionViewCell.self, forCellWithReuseIdentifier: "cell")
        
        return collectionView
        
        
    }()

    

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        self.tabBarController?.tabBar.isHidden = false
        view.addSubview(titleLabel)
        view.addSubview(textField)
        view.addSubview(button)
        view.addSubview(warningLabel)
        view.addSubview(collectionView)
        navigationItem.title = "Home Page"
       
        

        
        textField.rx.controlEvent([.editingChanged])
            .asObservable().subscribe({ [unowned self] _ in
                if textField.text != ""{
                    HomePageViewModel.homePageViewModel.getProductSearch(searchText: textField.text!)
                }else{
                    HomePageViewModel.homePageViewModel.getProductList()
                }
                
            }).disposed(by: disposeBag)
        

        
        HomePageViewModel.homePageViewModel.productCount.subscribe(onNext: { count in
            self.titleLabel.text = "\(count) Itens"
            if count == 0 {
                self.warningLabel.isHidden = false
            }else{
                self.warningLabel.isHidden = true
            }
        }).disposed(by: disposeBag)
        
        CartViewModel.cartViewModel.getCartProductListCount().subscribe(onNext : { count in
            if count != 0 {
                self.tabBarController?.tabBar.items?.last?.badgeValue = "\(count)"
            }else {
                self.tabBarController?.viewControllers?[1].tabBarItem.badgeValue = nil
            }
        }).disposed(by: disposeBag)
        
        
        
        HomePageViewModel.homePageViewModel.getProductList()
        HomePageViewModel.homePageViewModel.productList
            .bind(to: collectionView
                    .rx
                    .items(cellIdentifier: "cell", cellType: ProductCollectionViewCell.self)) { row, element, cell in
                        cell.configureCell(product: element)
                        cell.contentView.isUserInteractionEnabled = false
                        
                        cell.product = element
                    
                        cell.cellProtocol = self
                    }
                    .disposed(by: disposeBag)
        
        collectionView.rx.modelSelected(ProductVM.self)
            .subscribe(onNext : { product in
                let dvc = DetailViewController()
                dvc.selectedProduct = product
                 self.navigationController?.pushViewController(dvc, animated: true)
                
            }).disposed(by: disposeBag)

        configure()
        
        
        button.rx.tap.subscribe { _ in
            let controller = CategoryViewController()
            controller.delegate = self
            self.present(controller, animated: true)
        }.disposed(by: disposeBag)
    }
   
    
    
    func addCartProduct(product: ProductVM) {
        print(product)
        
      
        CartViewModel.cartViewModel.addCartProduct(product: product)
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
    
    override func viewWillAppear(_ animated: Bool) {
        self.tabBarController?.tabBar.isHidden = false
    }
}

extension HomePageViewController : SelectCategoryDelegate {
    func selectCategory(category: String) {
        self.dismiss(animated: true) {
            HomePageViewModel.homePageViewModel.getProductFilterList(selectedCategory: category)
            self.collectionView.reloadData()
        }
    }
    
    
}

