//
//  SMCollectionViewController.swift
//  FirebaseDB
//
//  Created by Rifat Firdaus on 09/01/19.
//  Copyright © 2019 Rifat Firdaus. All rights reserved.
//

import UIKit
import TPKeyboardAvoiding

class SMCollectionViewController: UIViewController {

    lazy var collectionView: TPKeyboardAvoidingCollectionView = { [unowned self] in
        return SMContainerView.createCollectionView(viewParent: self.view)
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    public func setupCollectionView(cellSize: CGSize = CGSize(width: UIScreen.main.bounds.width, height: UIScreen.main.bounds.width / 2), scrollDirection: UICollectionView.ScrollDirection, padding: UIEdgeInsets? = nil, minimumLineSpacing: CGFloat = 0.0, minimumInteritemSpacing: CGFloat = 0.0) {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = scrollDirection
        layout.itemSize = cellSize
        layout.sectionInset = padding ?? UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 0)
        layout.minimumLineSpacing = minimumLineSpacing
        layout.minimumInteritemSpacing = minimumInteritemSpacing
        collectionView.setCollectionViewLayout(layout, animated: true)
    }
    
    public func forceEmbedCollectionInView(view: UIView) {
        collectionView.removeFromSuperview()
        collectionView = SMContainerView.createCollectionView(viewParent: view)
    }
}
