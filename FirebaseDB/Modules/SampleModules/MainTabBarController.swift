//
//  MainTabBarController.swift
//  FirebaseDB
//
//  Created by Rifat Firdaus on 19/12/18.
//  Copyright © 2018 Rifat Firdaus. All rights reserved.
//

import UIKit

class MainTabBarController: SMTabBarController {

    static func instantiate(tabBarList: [UIViewController]) -> MainTabBarController {
        let controller = UIStoryboard.sample.instantiateViewController(withIdentifier: self.className()) as! MainTabBarController
        controller.tabBarList = tabBarList
        return controller
    }
    
    static func instantiateNav() -> UINavigationController {
        let controller = UIStoryboard.sample.instantiateViewController(withIdentifier: self.className()) as! MainTabBarController
        
        let newsListViewController = NewsListViewController.instantiate()
        newsListViewController.tabBarItem = UITabBarItem(title: "News", image: UIImage(named: "ic_file"), tag: 0)
        
        let profileViewController = ProfileViewController.instantiate()
        profileViewController.tabBarItem = UITabBarItem(title: "Profile", image: UIImage(named: "ic_person"), tag: 1)
        
        controller.tabBarList = [newsListViewController, profileViewController]
        
        let nav = ViewManager.createNavigationController(rootController: controller)
        return nav
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.initialize()
        let backItem = UIBarButtonItem()
        backItem.title = " "
        self.navigationItem.backBarButtonItem = backItem
    }
}
