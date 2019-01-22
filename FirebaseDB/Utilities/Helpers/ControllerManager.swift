//
//  ControllerManager.swift
//
//
//  Created by Rifat Firdaus on 9/8/16.
//  Copyright © 2016 Suitmedia. All rights reserved.
//

import UIKit

class ControllerManager: NSObject {

    static func setRoot(controller: UIViewController) {
        UIApplication.shared.keyWindow?.rootViewController = controller
        UIApplication.shared.keyWindow?.makeKeyAndVisible()
    }
    
    static func presentModalFromRight(controller: UIViewController, from parent:UIViewController, completion: (() -> Swift.Void)? = nil) {
        parent.present(controller, animated: true, completion: completion)
    }
    
    static func dismissFromLeft(controller: UIViewController, from parent:UIViewController, completion: (() -> Swift.Void)? = nil) {
        let transition = CATransition()
        transition.duration = 0.5
        transition.timingFunction = CAMediaTimingFunction(name: CAMediaTimingFunctionName.easeOut)
        transition.type = CATransitionType.push
        transition.subtype = CATransitionSubtype.fromLeft
        parent.view.window?.layer.add(transition, forKey: nil)
        controller.dismiss(animated: false, completion: completion)
    }
    
}
