//
//  DetailViewController.swift
//  UIKit Programmatically
//
//  Created by engin gülek on 3.02.2023.
//

import UIKit
import Kingfisher
final class DetailViewController: UIViewController {
    
    var selectedProduct : ProductVM?
    
    
    //MARK: - UI'ların extension içerisinde tanımlanma örneği
    private let detailImage : UIImageView = {
        let image = UIImageView()
                return image.detailImage
        
    }()
    private let addCartButton : UIButton = {
        let button = UIButton()
        return button.addCartButton(backColor: .blue)
    }()
    
    // MARK: -IU'ların ViewController içersinde tanımlanma örneği
    private let titleProduct : UILabel = {
        let label = UILabel()
        label.text = "Product Name"
        label.font = UIFont.systemFont(ofSize: 25, weight: .bold)
        label.textAlignment = .center
        label.numberOfLines = 3
        return label
    }()
    
    
    private let categoryProduct : UILabel = {
        
        let label = UILabel()
        label.text = "Product Category"
        label.font = UIFont.systemFont(ofSize: 18, weight: .semibold)
        label.textAlignment = .center
       
        return label
        
    }()
    
    
    private let priceProduct : UILabel = {
        
        let label = UILabel()
        label.text = "$300"
        label.font = UIFont.systemFont(ofSize: 18, weight:.medium)
        
        label.textAlignment = .center
        return label
        
    }()
    
    
    private let descProduct : UILabel = {
        let label = UILabel()
        label.text = "$Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum."
        label.font = UIFont.preferredFont(forTextStyle: .subheadline)
        label.font = UIFont.systemFont(ofSize: 15,weight: .medium)
        label.textAlignment = .center
        label.numberOfLines = 10
        return label
    }()
 
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.tabBarController?.tabBar.isHidden = true
        view.backgroundColor = .white
        navigationItem.title = "Detail Page"
        navigationItem.backButtonTitle = "Home Page"
        addSubviewConfigure()
        
        dataConfigure()
        configure()
        
    }
    
    
    
    private func dataConfigure(){
       // detailImage.kf.setImage(with: URL(string: selectedProduct!.image))
        titleProduct.text = selectedProduct?.title
        categoryProduct.text = selectedProduct?.category
        priceProduct.text = selectedProduct?.price
        descProduct.text = selectedProduct?.description
        
    }
    

    
  private  func addSubviewConfigure(){
        view.addSubview(detailImage)
        view.addSubview(titleProduct)
        view.addSubview(categoryProduct)
        view.addSubview(priceProduct)
        view.addSubview(descProduct)
        view.addSubview(addCartButton)
    }
    
  private  func configure() {
        self.detailImage.translatesAutoresizingMaskIntoConstraints = false
        self.titleProduct.translatesAutoresizingMaskIntoConstraints = false
        self.categoryProduct.translatesAutoresizingMaskIntoConstraints = false
        self.priceProduct.translatesAutoresizingMaskIntoConstraints = false
        self.descProduct.translatesAutoresizingMaskIntoConstraints = false
        self.addCartButton.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            //MARK: - DetailImage UIImageView
            
            detailImage.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor,constant: 10),
            detailImage.centerXAnchor.constraint(equalTo: view.safeAreaLayoutGuide.centerXAnchor),
            detailImage.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor,constant: 50),
            detailImage.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor,constant: -50),
            detailImage.heightAnchor.constraint(equalToConstant: view.frame.height / 3.5),
            
            
            titleProduct.topAnchor.constraint(equalTo: detailImage.bottomAnchor,constant: 25),
            titleProduct.centerXAnchor.constraint(equalTo: view.safeAreaLayoutGuide.centerXAnchor),
            titleProduct.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor,constant: 5),
            titleProduct.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor,constant: -5),
            
            
            categoryProduct.topAnchor.constraint(equalTo: titleProduct.bottomAnchor,constant: 10),
            categoryProduct.centerXAnchor.constraint(equalTo: view.safeAreaLayoutGuide.centerXAnchor),
            categoryProduct.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor),
            categoryProduct.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor),
            
            
            priceProduct.topAnchor.constraint(equalTo: categoryProduct.bottomAnchor,constant: 10),
            priceProduct.centerXAnchor.constraint(equalTo: view.safeAreaLayoutGuide.centerXAnchor),
            priceProduct.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor),
            priceProduct.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor),
            
            
            
            
            descProduct.topAnchor.constraint(equalTo: priceProduct.bottomAnchor,constant: 3),
            descProduct.centerXAnchor.constraint(equalTo: view.safeAreaLayoutGuide.centerXAnchor),
            descProduct.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor,constant:10),
            descProduct.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor,constant: -10),
            descProduct.heightAnchor.constraint(equalToConstant: view.frame.height / 5),
            
            
            addCartButton.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor,constant: -15),
            addCartButton.leftAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leftAnchor,constant: 10),
            addCartButton.rightAnchor.constraint(equalTo: view.safeAreaLayoutGuide.rightAnchor,constant: -10),
            addCartButton.centerXAnchor.constraint(equalTo: view.safeAreaLayoutGuide.centerXAnchor),
            addCartButton.heightAnchor.constraint(equalToConstant: view.frame.height / 15),
        ])
      
        
    }
}
