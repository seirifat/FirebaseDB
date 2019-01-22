//
//  UITextViewExtension.swift
//  Bola Nusantara
//
//  Created by Rifat Firdaus on 4/6/18.
//  Copyright © 2018 Suitmedia. All rights reserved.
//

import UIKit

extension UITextView{
        
        func numberOfLines() -> Int{
            if let fontUnwrapped = self.font{
                return Int(self.contentSize.height / fontUnwrapped.lineHeight)
            }
            return 0
        }
        
}
