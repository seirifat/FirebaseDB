//
//  SMHeadingLabel.swift
//  FirebaseDB
//
//  Created by Rifat Firdaus on 17/12/18.
//  Copyright © 2018 Rifat Firdaus. All rights reserved.
//

import UIKit

@IBDesignable class SMHeadingLabel: UILabel {

    convenience init(font: UIFont? = nil, textColor: UIColor? = nil) {
        self.init()
        initialize(font: font, textColor: textColor)
    }
    
    override init(frame: CGRect) {
        super.init(frame: CGRect.zero)
        
        initialize()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        
        initialize()
    }
    
    override func prepareForInterfaceBuilder() {
        super.prepareForInterfaceBuilder()
        
        initialize()
    }
    
    private func initialize(font: UIFont? = nil, textColor: UIColor? = nil) {
        self.font = font ?? SMUITheme.fontLabelHeading
        self.textColor = textColor ?? SMUITheme.textColorLabelHeading
    }
    
}
