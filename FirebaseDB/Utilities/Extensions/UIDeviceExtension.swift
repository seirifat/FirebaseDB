//
//  UIDeviceExtension.swift
//  Sampoerna Conference
//
//  Created by Rifat Firdaus on 10/5/17.
//  Copyright © 2017 Suitmedia. All rights reserved.
//

import UIKit

enum Device {
    case iPhoneClassic
    case iPhone4orS
    case iPhone5orS
    case iPhone6or7orS
    case iPhone6or7PlusOrS
    case iPhoneX
    case unknown
}

extension UIDevice {

    func isIPhoneX() -> Bool {
        if UIDevice().userInterfaceIdiom == .phone {
            switch UIScreen.main.nativeBounds.height {
            case 2436:
                return true
            default:
                return false
            }
        }
        return false
    }
    
    func currentDeviceIPhone() -> Device {
        if UIDevice().userInterfaceIdiom == .phone {
            switch UIScreen.main.nativeBounds.height {
            case 480:
                print("iPhone Classic")
                return .iPhoneClassic
            case 960:
                print("iPhone 4 or 4S")
                return .iPhone4orS
            case 1136:
                print("iPhone 5 or 5S or 5C")
                return .iPhone5orS
            case 1334:
                print("iPhone 6 or 6S")
                return .iPhone6or7orS
            case 2208:
                print("iPhone 6+ or 6S+")
                return .iPhone6or7PlusOrS
            case 2436:
                print("iPhone X")
                return .iPhoneX
            default:
                print("unknown")
                return .unknown
            }
        }
        return .unknown
    }
    
}
