//
//  SVProgressHUD+Additions.swift
//  Soundrenaline
//
//  Created by Rifat Firdaus on 8/17/16.
//  Copyright © 2016 Suitmedia. All rights reserved.
//

import Foundation
import SVProgressHUD

extension SVProgressHUD {
    static func delayDismiss(delay: Double) {
        let dispatch = DispatchTime.now() + delay
        DispatchQueue.main.asyncAfter(deadline: dispatch) {
            SVProgressHUD.dismiss()
        }
    }
}
