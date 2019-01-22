//
//  SMButtonPrimary.swift
//  FirebaseDB
//
//  Created by Rifat Firdaus on 13/12/18.
//  Copyright © 2018 Rifat Firdaus. All rights reserved.
//

import UIKit

@IBDesignable
class SMButtonPrimary: UIButton {
    
    init() {
        super.init(frame: CGRect.zero)
        
//        let primaryTheme = SMUITheme.instance.primaryButtonTheme
//        self.backgroundColor = primaryTheme.bgColor
//        self.setTitleColor(primaryTheme.titleColor, for: .normal)
//        self.setTitleColor(UIColor.lightGray, for: .selected)
//        self.setTitleColor(UIColor.lightGray, for: .highlighted)
        
        self.backgroundColor = .red
        self.setTitleColor(.white, for: .normal)
        self.clipsToBounds = true
        self.layer.cornerRadius = 10.0
    }
//
////    init() {
////        super.init()
////        let primaryTheme = SMUITheme.instance.primaryButtonTheme
////        self.backgroundColor = primaryTheme.bgColor
////        self.setTitleColor(primaryTheme.titleColor, for: .normal)
////        self.layer.cornerRadius = primaryTheme.rounded
////    }
////
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}
