//
//  MXSegmentedPagerController+Extensions.swift
//  Bali United
//
//  Created by Rifat Firdaus on 1/13/17.
//  Copyright © 2017 Suitmedia. All rights reserved.
//

import UIKit

extension MXSegmentedPagerController {
    
    func defaultPagerStyle(selectionStyle: HMSegmentedControlSelectionStyle = .fullWidthStripe,
                           segmentWidthStyle: HMSegmentedControlSegmentWidthStyle = .fixed, includeInset: Bool = false) {
        let barbuttonFont = UIFont(name: "HelveticaNeue-Bold", size: 13) ?? UIFont.boldSystemFont(ofSize: 13)
        segmentedPager.segmentedControl.selectionIndicatorLocation = HMSegmentedControlSelectionIndicatorLocation.down;
        segmentedPager.segmentedControl.backgroundColor = UIColor.primary()
        segmentedPager.segmentedControl.titleTextAttributes = [NSAttributedString.Key.foregroundColor : UIColor.white(alpha: 0.5), NSAttributedString.Key.font: barbuttonFont];
        segmentedPager.segmentedControl.selectedTitleTextAttributes = [NSAttributedString.Key.foregroundColor : UIColor.white]
        segmentedPager.segmentedControl.selectionStyle = selectionStyle
        segmentedPager.segmentedControl.selectionIndicatorColor = UIColor.orange
        segmentedPager.segmentedControl.segmentWidthStyle = segmentWidthStyle
        if includeInset {
            segmentedPager.segmentedControl.segmentEdgeInset = UIEdgeInsets(top: 0, left: 20, bottom: 0, right: 20)
        }
    }
    
    func setupPagerStyleWith(bgColor: UIColor = UIColor.primary(), titleColor: UIColor = UIColor.groupTableViewBackground, selectedTitleColor: UIColor = UIColor.white) {
        // Segmented Control customization
        let titleFont = UIFont(name: "HelveticaNeue", size: 13) ?? UIFont.systemFont(ofSize: 13)
        let selectedTitleFont = UIFont(name: "HelveticaNeue-Bold", size: 13) ?? UIFont.boldSystemFont(ofSize: 13)
        segmentedPager.segmentedControl.selectionIndicatorLocation = HMSegmentedControlSelectionIndicatorLocation.down;
        segmentedPager.segmentedControl.backgroundColor = bgColor
        segmentedPager.segmentedControl.titleTextAttributes = [NSAttributedString.Key.foregroundColor : titleColor, NSAttributedString.Key.font: titleFont]
        segmentedPager.segmentedControl.selectedTitleTextAttributes = [NSAttributedString.Key.foregroundColor : selectedTitleColor, NSAttributedString.Key.font: selectedTitleFont]
        segmentedPager.segmentedControl.selectionStyle = HMSegmentedControlSelectionStyle.fullWidthStripe
        segmentedPager.segmentedControl.selectionIndicatorColor = UIColor.orange
        segmentedPager.segmentedControl.selectionIndicatorHeight = 1.5
        //        segmentedPager.segmentedControl.segmentWidthStyle = .dynamic
    }
    
    func defaultPagerStyleWithParallax() {
        
        // Parallax Header
//        segmentedPager.parallaxHeader.view = HeaderMX.instanceFromNib()
//        segmentedPager.parallaxHeader.mode = MXParallaxHeaderMode.fill
//        segmentedPager.parallaxHeader.height = UIScreen.main.bounds.width / 1.5
//        segmentedPager.parallaxHeader.minimumHeight = 20
        
        
        // Segmented Control customization
        segmentedPager.segmentedControl.selectionIndicatorLocation = HMSegmentedControlSelectionIndicatorLocation.down
        // will be used
        //        segmentedPager.segmentedControl.backgroundColor = UIColor(hex:0xD91A31)
        segmentedPager.segmentedControl.backgroundColor = UIColor.clear
        segmentedPager.segmentedControl.titleTextAttributes = [NSAttributedString.Key.foregroundColor : UIColor(hex:0x646464), NSAttributedString.Key.font: UIFont.PFBeauFont(size: 13)]
        segmentedPager.segmentedControl.selectedTitleTextAttributes = [NSAttributedString.Key.foregroundColor : UIColor(hex:0xfcb61e), NSAttributedString.Key.font: UIFont.PFBeauFont(size: 13)]
        segmentedPager.segmentedControl.selectionStyle = HMSegmentedControlSelectionStyle.textWidthStripe
        segmentedPager.segmentedControl.selectionIndicatorColor = UIColor(hex:0xfcb61e)
        segmentedPager.segmentedControl.selectionIndicatorHeight = 1.5
        segmentedPager.segmentedControl.selectionIndicatorEdgeInsets = UIEdgeInsets(top: 0, left: 0, bottom: -11, right: 0)
        segmentedPager.segmentedControl.type = .fixed
        segmentedPager.segmentedControl.widthFixedType = 12
    }
    
}
