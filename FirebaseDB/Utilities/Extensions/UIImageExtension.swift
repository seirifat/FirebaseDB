//
//  UIImageExtension.swift
//  Bali United
//
//  Created by Muhammad Alam Akbar on 2/14/17.
//  Copyright © 2017 Suitmedia. All rights reserved.
//

import UIKit

extension UIImage {
    static func fromColor(color: UIColor) -> UIImage {
        let rect = CGRect(x: 0, y: 0, width: 1, height: 1)
        UIGraphicsBeginImageContext(rect.size)
        let context = UIGraphicsGetCurrentContext()!
        context.setFillColor(color.cgColor)
        context.fill(rect)
        let img = UIGraphicsGetImageFromCurrentImageContext()
        UIGraphicsEndImageContext()
        return img!
    }
    
    static func fromColorHex(hex: Int) -> UIImage {
        return UIImage.fromColor(color: UIColor(hex: hex))
    }
}
