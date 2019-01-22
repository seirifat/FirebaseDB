//
//  NewsListViewController.swift
//  FirebaseDB
//
//  Created by Rifat Firdaus on 18/12/18.
//  Copyright © 2018 Rifat Firdaus. All rights reserved.
//

import UIKit
import TPKeyboardAvoiding

class NewsListViewController: UIViewController {

    var tableView: TPKeyboardAvoidingTableView!
    
    static func instantiate() -> NewsListViewController {
//        let controller = UIStoryboard.sample.instantiateViewController(withIdentifier: self.className()) as! NewsListViewController
//        return controller
        let controller = NewsListViewController()
        return controller
    }
    
    static func instantiateNav() -> UINavigationController {
        let controller = UIStoryboard.sample.instantiateViewController(withIdentifier: self.className()) as! NewsListViewController
        let nav = ViewManager.createNavigationController(rootController: controller, transparent: false)
        return nav
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.loadViewIfNeeded()
        tableView = SMContainerView.createTableView(viewParent: self.view)
        tableView.separatorStyle = .none
        tableView.delegate = self
        tableView.dataSource = self
        tableView.register(NewsCell.self, forCellReuseIdentifier: NewsCell.className())
        tableView.estimatedRowHeight = 100
        tableView.rowHeight = UITableView.automaticDimension
        self.loadViewIfNeeded()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        self.parent?.title = "News"
        self.setSolidNavbarWith(color: UIColor(hexString: "#SMUITheme.primaryColor") ?? .blue)
    }

}

extension NewsListViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 10
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: NewsCell.className(), for: indexPath) as! NewsCell
        return cell
    }
}

extension NewsListViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        let controller = NewsDetailViewController.instantiate()
        pushController(controller: controller, withbackTitle: " ", animated: true, color: .white)
    }
}
