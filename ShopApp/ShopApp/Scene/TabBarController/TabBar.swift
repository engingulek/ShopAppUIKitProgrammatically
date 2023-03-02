//
//  TabBarController.swift
//  ShopApp
//
//  Created by engin gülek on 2.03.2023.
//

import UIKit

class TabBar: UITabBarController {

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .red
        UITabBar.appearance().barTintColor = .systemRed
        tabBar.tintColor = .label
        tabBar.backgroundColor = .white
        setupVC()
    }
    func setupVC(){
        viewControllers = [
            createNavController(for: HomePageViewController(), title: NSLocalizedString("Home", comment: ""), image: UIImage(systemName: "house.circle")!),
            createNavController(for: CartViewController(),  title: NSLocalizedString("Cart", comment: ""), image: UIImage(systemName: "cart.circle")!)
        ]
    }
    
    fileprivate func createNavController(for rootViewController: UIViewController,title:String,image:UIImage) -> UIViewController {
        let navController = UINavigationController(rootViewController: rootViewController)
        navController.tabBarItem.title = title
        navController.tabBarItem.image = image
        rootViewController.navigationItem.title = title
       
        return navController
    }
}
