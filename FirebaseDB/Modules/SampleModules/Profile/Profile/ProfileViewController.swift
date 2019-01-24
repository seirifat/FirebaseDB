//
//  ProfileViewController.swift
//  FirebaseDB
//
//  Created by Rifat Firdaus on 09/01/19.
//  Copyright © 2019 Rifat Firdaus. All rights reserved.
//

import UIKit
import AlamofireImage
import SVProgressHUD

struct ProfileItem {
    var tag: Int
    var imageProfile: UIImage?
    var title: String?
}

class ProfileViewController: SMCollectionViewController {

    @IBOutlet private weak var viewContainer: UIView!
    @IBOutlet private weak var imageViewPhoto: UIImageView!
    @IBOutlet private weak var labelName: UILabel!
    @IBOutlet private weak var labelEmail: UILabel!
    
    var userManager = SMAuthProfileManager()
    
    var profileItems = [
        ProfileItem(tag: 1, imageProfile: #imageLiteral(resourceName: "ic_person"), title: "Edit Profile"),
        ProfileItem(tag: 2, imageProfile: #imageLiteral(resourceName: "ic_file"), title: "Create Post"),
        ProfileItem(tag: 3, imageProfile: #imageLiteral(resourceName: "ic_folder"), title: "My Posts"),
        ProfileItem(tag: 4, imageProfile: #imageLiteral(resourceName: "ic_close"), title: "Logout"),
    ]
    
    static func instantiate() -> ProfileViewController {
        let controller = ProfileViewController(nibName: self.className(), bundle: nil)
        return controller
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        if let user = userManager.getFirebaseUser() {
            if let url = user.photoURL {
                imageViewPhoto.af_setImage(withURL: url, placeholderImage: nil)
            }
            labelName.text = user.displayName ?? "-"
            labelEmail.text = user.email ?? "-"
        }
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        self.parent?.title = "PROFILE"
        self.navigationController?.setNavigationBarHidden(false, animated: animated)
        self.view.layoutIfNeeded()
        setupView()
    }
    
    func setupView() {
        self.forceEmbedCollectionInView(view: viewContainer)
        let cellSize = CGSize(width: (UIScreen.main.bounds.width / 2) - 8, height: (UIScreen.main.bounds.width / 2) - 16)
        setupCollectionView(cellSize: cellSize, scrollDirection: .vertical)
        collectionView.register(ProfileItemCell.loadNib(), forCellWithReuseIdentifier: ProfileItemCell.className())
        collectionView.dataSource = self
        collectionView.delegate = self
        collectionView.isPagingEnabled = false
        collectionView.backgroundColor = .white
        collectionView.isUserInteractionEnabled = true
        collectionView.contentInset = UIEdgeInsets(top: 8, left: 8, bottom: 8, right: 8)
        collectionView.reloadData()
    }

}

extension ProfileViewController: UICollectionViewDataSource, UICollectionViewDelegate {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return profileItems.count
    }

    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: ProfileItemCell.className(), for: indexPath) as! ProfileItemCell
        cell.profileItem = profileItems[indexPath.row]
        return cell
    }

    // delegate

    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        switch profileItems[indexPath.row].tag {
        case 1:
            let controller = EditProfileViewController.instantiateNav()
            present(controller, animated: true, completion: nil)
        case 4:
            let alert = AlertHelper.createAlertDialog(title: "Logout", message: "Are you sure, You want to logout?", agreeText: "Yes", cancelText: "No", agreeHandler: { [weak self] (action) in
                self?.userManager.logoutGoogle()
                self?.dismiss(animated: true, completion: nil)
            }, cancelHandler: nil)
            present(alert, animated: true, completion: nil)
        default:
            SVProgressHUD.showInfo(withStatus: "\(profileItems[indexPath.row].title ?? "")")
        }
    }
}
