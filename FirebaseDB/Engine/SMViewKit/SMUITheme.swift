//
//  SMUITheme.swift
//  FirebaseDB
//
//  Created by Rifat Firdaus on 14/12/18.
//  Copyright © 2018 Rifat Firdaus. All rights reserved.
//

// UITheme Version 1.0.0 January 09, 2018
// Last project: None

import UIKit

class SMUITheme: NSObject {
    
    // Theme for FirebaseDB project
    
    static let primaryColorString = "#0984e3" // blueSky
    static let secondaryColorString = "#74b9ff" // bluePale
    static let accentColorString = "#81ecec"
    
    static let primaryColor = UIColor(hexString: SMUITheme.primaryColorString, alpha: 1.0) ?? .black
    static let secondaryColor = UIColor(hexString: SMUITheme.secondaryColorString, alpha: 1.0) ?? .black
    static let accentColor = UIColor(hexString: SMUITheme.accentColorString, alpha: 1.0) ?? .black
    
    // MARK: BUTTON
    
    // MARK: Primary Button
    //
    static let bgColorButtonPrimary: UIColor = SMUITheme.primaryColor
    static let titleColorButtonPrimary: UIColor = .white
    static let fontButtonPrimary: UIFont = .systemFont(ofSize: 12)
    static let cornerRadiusButtonPrimary: CGFloat = 7.0
    
    // MARK: Secondary Button
    //
    static let bgColorButtonSecondary: UIColor = .white
    static let titleColorButtonSecondary: UIColor = SMUITheme.primaryColor
    static let fontButtonSecondary: UIFont = .systemFont(ofSize: 12)
    static let cornerRadiusButtonSecondary: CGFloat = 7.0
    
    // MARK: LABEL
    
    // MARK: Heading Label
    //
    static let fontLabelHeading: UIFont = .systemFont(ofSize: 15, weight: .medium)
    static let textColorLabelHeading: UIColor = SMUITheme.primaryColor
    
    // MARK: Normal Label
    //
    static let fontLabelNormal: UIFont = .systemFont(ofSize: 13)
    static let textColorLabelNormal: UIColor = SMUITheme.primaryColor
    
    // MARK: Strong Label
    //
    static let fontLabelStrong: UIFont = .systemFont(ofSize: 13, weight: .medium)
    static let textColorLabelStrong = UIColor(hex: 0x333333)
    
    // MARK: Sub Label (date)
    //
    static let fontLabelSub: UIFont = .italicSystemFont(ofSize: 12)
    static let textColorLabelSub = UIColor(hex: 0x8b8b8b)

    // MARK: NavBar
    
    static let navBgColor: UIColor = SMUITheme.primaryColor
    static let navTintColor: UIColor = .white
    
    // MARK: TABBAR
    
    static let tabBarBarTintColor: UIColor = .white
    static let tabBarTintColor: UIColor = SMUITheme.primaryColor
    static let tabBarUnselectedItemTintColor: UIColor = .lightGray
    
}
