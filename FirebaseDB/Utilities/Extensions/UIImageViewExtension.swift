//
//  UIImageViewExtension.swift
//  Bali United
//
//  Created by Rifat Firdaus on 1/30/17.
//  Copyright © 2017 Suitmedia. All rights reserved.
//

import UIKit

extension UIImageView {
    
    func setBlur() {
        let blur:UIBlurEffect = UIBlurEffect(style: UIBlurEffect.Style.light)
        let effectView:UIVisualEffectView = UIVisualEffectView (effect: blur)
        effectView.frame = frame
        effectView.alpha = 0.75
        self.addSubview(effectView)
    }
    
    func circlifyImage(opacity:Float = 0.25, radius: Float = 2.5, heightOffset: Int = 0) {
        clipsToBounds = true
        let roundValue = frame.width / 2
        layer.cornerRadius = roundValue
//        layer.shadowColor = UIColor.black.cgColor
//        layer.shadowOpacity = opacity
//        layer.shadowOffset = CGSize(width: 0, height: heightOffset)
//        layer.shadowRadius = CGFloat(radius)
    }
    
}
