//
//  UIFontExtension.swift
//  Fans Match Center
//
//  Created by Rifat Firdaus on 6/22/16.
//  Copyright © 2016 Suitmedia. All rights reserved.
//

import UIKit

enum PFBeauStyle {
    case semiBold
    case book
    case bold
    case reguler
}

extension UIFont {

//    Dictionary
//    -- PF BeauSans Pro
//    
//    PFBeauSansPro-SemiBold
//    PFBeauSansPro-Bbook
//    PFBeauSansPro-Regular
//    PFBeauSansPro-Bold
    
    static func PFBeauFont(size: CGFloat?, style: PFBeauStyle? = nil) -> UIFont {
        var fontSize:CGFloat = 12
        if let size = size {
            fontSize = size
        }
        if let style = style {
            switch style {
            case .semiBold:
                return UIFont(name: "PFBeauSansPro-SemiBold", size: fontSize)!
            case .book:
                return UIFont(name: "PFBeauSansPro-Bbook", size: fontSize)!
            case .bold:
                return UIFont(name: "PFBeauSansPro-Bold", size: fontSize)!
            case .reguler:
                return UIFont(name: "PFBeauSansPro-Regular", size: fontSize)!
            }
        } else {
            return UIFont(name: "PFBeauSansPro-Regular", size: fontSize)!
        }
    }
    
}
