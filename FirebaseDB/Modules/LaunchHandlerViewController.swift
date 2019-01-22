//
//  LaunchHandlerViewController.swift
//  FirebaseDB
//
//  Created by Rifat Firdaus on 19/12/18.
//  Copyright © 2018 Rifat Firdaus. All rights reserved.
//

import UIKit

class LaunchHandlerViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        
        launchLogin()
    }
    
    func launchMainTabbar() {
        let tabBarController = MainTabBarController.instantiateNav()
        tabBarController.modalTransitionStyle = .crossDissolve
        present(tabBarController, animated: true, completion: nil)
    }
    
    func launchLogin() {
        let controller = LoginViewController.instantiate()
        controller.modalTransitionStyle = .crossDissolve
        present(controller, animated: true, completion: nil)
    }

}
