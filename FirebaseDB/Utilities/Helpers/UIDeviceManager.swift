//
//  UIDeviceManager.swift
//  
//
//  Created by Rifat Firdaus on 9/7/16.
//  Copyright © 2016 Suitmedia. All rights reserved.
//

import UIKit

class UIDeviceManager: NSObject {
    
    static func isIpad() -> Bool {
        if UIDevice.current.userInterfaceIdiom == .pad {
            return true
        }
        return false
    }
    
    static func isIPhone() -> Bool {
        if UIDevice.current.userInterfaceIdiom == .phone {
            return true
        }
        return false
    }
    
    
}
