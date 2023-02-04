//
//  DetailViewController.swift
//  UIKit Programmatically
//
//  Created by engin gülek on 4.02.2023.
//

import UIKit
import RxSwift
import RxCocoa
class CategoryViewController: UIViewController {
    let disposeBag = DisposeBag()
    let categoryListViewModel = CategoryListViewModel()
    let tableViewCategory : UITableView = {
        let tableView = UITableView()
        tableView.register(CategoryTableViewCell.self, forCellReuseIdentifier: "categoryCell")
        tableView.largeContentTitle = "Category"
        return tableView
    }()
    
    let titleLabel : UILabel = {
        let label = UILabel()
        label.text = "Categories"
        label.textAlignment = .center
        label.font = UIFont.preferredFont(forTextStyle: .title1)
        label.textColor = .red
        return label
        
        
    }()
   
    
    private lazy var categoryList : Observable<[String]> = {
        return .just(["Category1","Category2","Category3","Category4"])
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        view.addSubview(tableViewCategory)
        view.addSubview(titleLabel)
        view.backgroundColor = .white
        configure()
        
        
        categoryListViewModel.getCategoryList().bind(to: tableViewCategory
            .rx
            .items(cellIdentifier: "categoryCell",cellType: CategoryTableViewCell.self)) {row,element,cell in
                cell.configureCell(element: element)
        }.disposed(by: disposeBag)
    }
    
    
    func configure(){
        tableViewCategory.translatesAutoresizingMaskIntoConstraints = false
        titleLabel.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            titleLabel.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor,constant: 20),
            titleLabel.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor),
            titleLabel.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor),
            
            
            tableViewCategory.topAnchor.constraint(equalTo: titleLabel.topAnchor,constant: 25),
            tableViewCategory.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor),
            tableViewCategory.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor),
            tableViewCategory.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor)
        
        ])
    }
}
