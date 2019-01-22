//
//  SMScrollViewController.swift
//  FirebaseDB
//
//  Created by Rifat Firdaus on 21/12/18.
//  Copyright © 2018 Rifat Firdaus. All rights reserved.
//

import UIKit

class SMScrollViewController: UIViewController {

    var parallaxHeaderHeight: CGFloat = 250
    lazy var smContainer: SMScrollViewContainer = { [unowned self] in
        return SMContainerView.createVerticalScrollViewContainer(viewParent: self.view)
    }()
    lazy var imageViewHeader = UIImageView()
    lazy var navColor = SMUITheme.primaryColor
    
    private var isParallaxActive = false
    private var isScrollNavAlpha = false
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        smContainer.scrollView.delegate = self
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        if isParallaxActive {
            if isScrollNavAlpha {
                self.setTransparentNavbar()
                self.setScrollNavbarAlpha(offset: parallaxHeaderHeight, color: navColor, scrollView: smContainer.scrollView)
            }
        }
    }
    
    func setupParallaxHeader(image: UIImage?, contentMode: UIView.ContentMode = .scaleAspectFill, mode: MXParallaxHeaderMode, scrollNavAlpha: Bool = false) {
        isParallaxActive = true
        isScrollNavAlpha = scrollNavAlpha
        imageViewHeader.image = UIImage(named: "ic_news")
        imageViewHeader.contentMode = contentMode
        smContainer.scrollView.parallaxHeader.view = imageViewHeader
        smContainer.scrollView.parallaxHeader.height = parallaxHeaderHeight
        smContainer.scrollView.parallaxHeader.mode = mode;
        smContainer.scrollView.parallaxHeader.minimumHeight = 0;
    }
    
    public func forceEmbedScrollViewIn(view: UIView) {
        smContainer.scrollView.removeFromSuperview()
        smContainer = SMContainerView.createVerticalScrollViewContainer(viewParent: view)
    }

}

extension SMScrollViewController: UIScrollViewDelegate {
    
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        if isParallaxActive {
            self.setScrollNavbarAlpha(offset: parallaxHeaderHeight, color: navColor, scrollView: scrollView)
        }
    }
    
}
