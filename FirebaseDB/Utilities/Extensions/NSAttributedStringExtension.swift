//
//  NSAttributedStringExtension.swift
//  Bali United
//
//  Created by Rifat Firdaus on 1/30/17.
//  Copyright © 2017 Suitmedia. All rights reserved.
//

import UIKit

extension NSMutableAttributedString {
    
    static func setAttributedText(text: String = "", font: UIFont = UIFont.systemFont(ofSize: 12), color: UIColor = UIColor.black) -> NSMutableAttributedString {
        
        let attributes = [
            NSAttributedString.Key.font: font,
            NSAttributedString.Key.foregroundColor: color
        ]
        
        let attributedText = NSMutableAttributedString(
            string: text,
            attributes: attributes
        )
        return attributedText
    }
    
    func setUnderline() {
        self.addAttributes([
            NSAttributedString.Key.underlineStyle: NSUnderlineStyle.single.rawValue
            ], range: NSRange(location: 0, length: self.length))
    }
    
    @discardableResult func bold(_ text: String) -> NSMutableAttributedString {
        let attrs: [NSAttributedString.Key: Any] = [.font: UIFont.boldSystemFont(ofSize: 12)]
        let boldString = NSMutableAttributedString(string:text, attributes: attrs)
        append(boldString)
        
        return self
    }
    
    @discardableResult func normal(_ text: String) -> NSMutableAttributedString {
        let normal = NSAttributedString(string: text)
        append(normal)
        
        return self
    }
}
