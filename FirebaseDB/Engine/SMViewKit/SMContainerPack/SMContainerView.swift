//
//  SMContainerView.swift
//  FirebaseDB
//
//  Created by Rifat Firdaus on 13/12/18.
//  Copyright © 2018 Rifat Firdaus. All rights reserved.
//

import UIKit
import TPKeyboardAvoiding

class SMContainerView: NSObject {
    
    static func createHorizontalWrap(align: UIStackView.Alignment = .fill, distribution: UIStackView.Distribution = .fill, spacing: CGFloat? = nil, padding: UIEdgeInsets? = nil) -> UIStackView {
        let stackView = UIStackView()
        stackView.axis = .horizontal
        stackView.distribution = distribution
        stackView.alignment = align
        if let spacing = spacing {
            stackView.spacing = spacing
        }
        if let padding = padding {
            stackView.setpadding(padding: padding)
        }
        return stackView
    }
    
    static func createVerticalWrap(align: UIStackView.Alignment = .fill, distribution: UIStackView.Distribution = .fill, spacing: CGFloat? = nil, padding: UIEdgeInsets? = nil) -> UIStackView {
        let stackView = UIStackView()
        stackView.axis = .vertical
        stackView.distribution = distribution
        stackView.alignment = align
        if let spacing = spacing {
            stackView.spacing = spacing
        }
        if let padding = padding {
            stackView.setpadding(padding: padding)
        }
        return stackView
    }
    
    static func createVerticalScrollViewContainer(viewParent: UIView) -> SMScrollViewContainer {
        
        let smScrollView = SMScrollViewContainer()
        
        let scrollView = smScrollView.scrollView
        scrollView.bounces = true
        scrollView.alwaysBounceVertical = true
        
        let viewContainer = UIView()
        
        let stackViewContainer = smScrollView.stackViewContainer
        stackViewContainer.axis = .vertical
        stackViewContainer.setpadding(padding: UIEdgeInsets(top: 8, left: 8, bottom: 8, right: 8))
        stackViewContainer.spacing = 8
        
        viewParent.addSubview(scrollView)
        scrollView.translatesAutoresizingMaskIntoConstraints = false
        viewParent.addConstraintsWithFormat("H:|-0-[v0]-0-|", views: scrollView)
        viewParent.addConstraintsWithFormat("V:|-0-[v0]-0-|", views: scrollView)
        
        scrollView.addSubview(viewContainer)
        viewContainer.translatesAutoresizingMaskIntoConstraints = false
        scrollView.addConstraintsWithFormat("H:|-0-[v0]-0-|", views: viewContainer)
        scrollView.addConstraintsWithFormat("V:|-0-[v0]-0-|", views: viewContainer)
        scrollView.addConstraintCenterX(view: viewContainer)
        
        viewContainer.addSubview(stackViewContainer)
        stackViewContainer.translatesAutoresizingMaskIntoConstraints = false
        viewContainer.addConstraintsWithFormat("H:|-0-[v0]-0-|", views: stackViewContainer)
        viewContainer.addConstraintsWithFormat("V:|-0-[v0]-0-|", views: stackViewContainer)
//        viewContainer.addConstraintsWithFormat("V:|-0-[v1(==v0)]-0-|", views: viewContainer, stackViewContainer)

        return smScrollView
    }
    
    static func createTableView(viewParent: UIView) -> TPKeyboardAvoidingTableView {
        
        let tableView = TPKeyboardAvoidingTableView()
        viewParent.addSubview(tableView)
        tableView.translatesAutoresizingMaskIntoConstraints = false
        viewParent.addConstraintsWithFormat("H:|-0-[v0]-0-|", views: tableView)
        viewParent.addConstraintsWithFormat("V:|-[v0]-0-|", views: tableView)
        
        return tableView
    }
    
    static func createCollectionView(viewParent: UIView) -> TPKeyboardAvoidingCollectionView {
        
        let collectionView = TPKeyboardAvoidingCollectionView(frame: CGRect.zero, collectionViewLayout: UICollectionViewLayout())
        viewParent.addSubview(collectionView)
        collectionView.translatesAutoresizingMaskIntoConstraints = false
        collectionView.addConstraintsWithFormat("H:|-0-[v0]-0-|", views: collectionView)
        collectionView.addConstraintsWithFormat("V:|-[v0]-0-|", views: collectionView)
        
        return collectionView
    }
    
}

extension UIStackView {
    
    func setpadding(padding: UIEdgeInsets) {
        self.isLayoutMarginsRelativeArrangement = true
        self.layoutMargins = padding
    }
    
    func setBackground(color: UIColor, cornerRadius: CGFloat = 0) {
        let viewBackground = UIView()
        viewBackground.backgroundColor = color
        viewBackground.layer.cornerRadius = cornerRadius
        self.addSubview(viewBackground)
        self.sendSubviewToBack(viewBackground)
        viewBackground.translatesAutoresizingMaskIntoConstraints = false
        self.addConstraintsWithFormat("H:|-0-[v0]-0-|", views: viewBackground)
        self.addConstraintsWithFormat("V:|-0-[v0]-0-|", views: viewBackground)
    }
    
    func addArrangedSubViews(views: [UIView]) {
        views.forEach { (view) in
            self.addArrangedSubview(view)
        }
    }
    
    func proportionWitdhEqual() {
        if self.arrangedSubviews.count > 1 {
            let leftView = arrangedSubviews[0]
            let rightView = arrangedSubviews[1]
            self.addConstraintsWithFormat("H:[v0(==v1)]", views: leftView, rightView)
        }
    }
    
    func proportionWitdhOneTwo() {
        if self.arrangedSubviews.count > 1 {
            let leftView = arrangedSubviews[0]
            let rightView = arrangedSubviews[1]
            self.addConstraintsWithFormat("H:[v0(==v1)]", views: leftView, rightView)
        }
    }
    
}
