//
//  UIButtonExtensions.swift
//  Bola Nusantara
//
//  Created by Rifat Firdaus on 8/16/18.
//  Copyright © 2018 Suitmedia. All rights reserved.
//

import UIKit

extension UIButton {
    func preventRepeatedPresses(inNext seconds: Double = 3) {
        self.isUserInteractionEnabled = false
        self.isHidden = true
        DispatchQueue.main.asyncAfter(deadline: DispatchTime.now() + seconds) {
            self.isUserInteractionEnabled = true
            self.isHidden = false
        }
    }
}
