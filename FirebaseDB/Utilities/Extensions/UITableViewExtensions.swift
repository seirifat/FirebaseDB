//
//  UITableViewExtensions.swift
//  Bola Nusantara
//
//  Created by Rifat Firdaus on 2/22/18.
//  Copyright © 2018 Suitmedia. All rights reserved.
//

import UIKit

extension UITableView {

    func registerCell(withIdentifier identifier: AnyClass) {
        self.register(UINib(nibName: String(describing: identifier), bundle: nil), forCellReuseIdentifier: String(describing: identifier))
    }
    
}
