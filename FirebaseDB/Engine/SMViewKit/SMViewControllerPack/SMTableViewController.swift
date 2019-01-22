//
//  SMTableViewController.swift
//  FirebaseDB
//
//  Created by Rifat Firdaus on 11/01/19.
//  Copyright © 2019 Rifat Firdaus. All rights reserved.
//

import UIKit
import TPKeyboardAvoiding

class SMTableViewController: UIViewController {
    
    lazy var tableView: TPKeyboardAvoidingTableView = { [unowned self] in
        return SMContainerView.createTableView(viewParent: self.view)
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    public func setupDefaultTableView() {
        tableView.separatorStyle = .none
        tableView.rowHeight = UITableView.automaticDimension
        tableView.estimatedRowHeight = 300
    }
    
    public func forceEmbedCollectionInView(view: UIView) {
        tableView.removeFromSuperview()
        tableView = SMContainerView.createTableView(viewParent: view)
    }

}
