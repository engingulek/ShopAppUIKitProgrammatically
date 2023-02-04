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
    
    let tableViewCategory : UITableView = {
        let tableView = UITableView()
        tableView.register(CategoryTableViewCell.self, forCellReuseIdentifier: "categoryCell")
        tableView.largeContentTitle = "Category"
        return tableView
    }()
   
    
    private lazy var categoryList : Observable<[String]> = {
        return .just(["Category1","Category2","Category3","Category4"])
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        view.addSubview(tableViewCategory)
        view.backgroundColor = .white
        configure()
        
        
        categoryList.bind(to: tableViewCategory
            .rx
            .items(cellIdentifier: "categoryCell",cellType: CategoryTableViewCell.self)) {row,element,cell in
                cell.configureCell(element: element)
            
            
        }.disposed(by: disposeBag)
        

        
    }
    
    
    func configure(){
        tableViewCategory.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            tableViewCategory.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            tableViewCategory.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor),
            tableViewCategory.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor),
            tableViewCategory.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor)
        
        ])
    }
}
