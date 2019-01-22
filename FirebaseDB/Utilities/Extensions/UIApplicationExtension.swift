//
//  UIColorExtension.swift
//  bungkhus-ios-challenge-ui-profile-marchendise
//
//  Created by Bungkhus on 1/9/17.
//  Copyright © 2017 Bungkhus. All rights reserved.
//

import UIKit

extension UIApplication {
    var statusBarView: UIView? {
        return value(forKey: "statusBar") as? UIView
    }
}
