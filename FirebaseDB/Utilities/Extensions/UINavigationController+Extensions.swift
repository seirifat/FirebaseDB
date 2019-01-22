//
//  UINavigationController+Extensions.swift
//  YesJob
//
//  Created by Rifat Firdaus on 11/25/16.
//  Copyright © 2016 Suitmedia. All rights reserved.
//

import UIKit

extension UINavigationController {
    func popToRootViewControllerWithHandler(animated: Bool, completion: @escaping ()->()) {
        CATransaction.begin()
        CATransaction.setCompletionBlock(completion)
        self.popToRootViewController(animated: animated)
        CATransaction.commit()
    }
    func popViewControllerWithHandler(animated: Bool, completion: @escaping ()->()) {
        CATransaction.begin()
        CATransaction.setCompletionBlock(completion)
        self.popViewController(animated: animated)
        CATransaction.commit()
    }
    func pushViewController(controller: UIViewController, animated: Bool, completion: (() -> Void)?) {
        CATransaction.begin()
        CATransaction.setCompletionBlock(completion)
        pushViewController(controller, animated: animated)
        CATransaction.commit()
    }
}
