//
//  NewsListViewController.swift
//  FirebaseDB
//
//  Created by Rifat Firdaus on 18/12/18.
//  Copyright © 2018 Rifat Firdaus. All rights reserved.
//

import UIKit
import TPKeyboardAvoiding
import Firebase

class NewsListViewController: UIViewController {

    var tableView: TPKeyboardAvoidingTableView!
    
    let dbFirebase = Firestore.firestore()
    var listener: ListenerRegistration!
    
    var singleView = false
    var isHasNav = false
    
    var presenter = NewsListPresenter()
    
    static func instantiate(isSingleView: Bool = false) -> NewsListViewController {
//        let controller = UIStoryboard.sample.instantiateViewController(withIdentifier: self.className()) as! NewsListViewController
//        return controller
        let controller = NewsListViewController()
        controller.singleView = isSingleView
        return controller
    }
    
    static func instantiateNav(isSingleView: Bool = false) -> UINavigationController {
        let controller = UIStoryboard.sample.instantiateViewController(withIdentifier: self.className()) as! NewsListViewController
        controller.singleView = isSingleView
        controller.isHasNav = true
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
        
        if isHasNav {
            setupBackBarButtonItems()
        }
        
        presenter.view = self
        presenter.setDataListener()
        
//        if singleView {
//            listener = dbFirebase.collection("articles").whereField("writter.id", isEqualTo: "").addSnapshotListener { (querySnapshot, error) in
//                guard let documents = querySnapshot?.documents else {
//                    print("Error fetching documents: \(error!)")
//                    return
//                }
//                documents.forEach({ (snapshot) in
//                    print(snapshot.data())
//                })
//            }
//        } else {
//            listener = dbFirebase.collection("articles").addSnapshotListener { (querySnapshot, error) in
//                guard let documents = querySnapshot?.documents else {
//                    print("Error fetching documents: \(error!)")
//                    return
//                }
//                documents.forEach({ (snapshot) in
//                    print(snapshot.data())
//                    print(snapshot.documentID)
//                })
//            }
//        }
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        self.parent?.title = "ARTICLES"
        self.setSolidNavbarWith(color: UIColor(hexString: "#SMUITheme.primaryColor") ?? .blue)
    }
    
    override func viewDidDisappear(_ animated: Bool) {
        super.viewDidDisappear(animated)
        
        presenter.removeListener()
    }

}

extension NewsListViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return presenter.data.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: NewsCell.className(), for: indexPath) as! NewsCell
        cell.article = presenter.data[indexPath.row]
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

extension NewsListViewController: BaseViewProtocol {
    func showData() {
        tableView.reloadData()
    }
    
    func showError(error: Error?) {
        print(error?.localizedDescription ?? "")
    }
}
