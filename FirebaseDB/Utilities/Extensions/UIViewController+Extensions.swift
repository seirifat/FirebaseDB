//
//  UIViewController+Extensions.swift
//  Bali United
//
//  Created by Rifat Firdaus on 1/11/17.
//  Copyright © 2017 Suitmedia. All rights reserved.
//

import UIKit
import SVProgressHUD
//import Firebase
import Realm
import RealmSwift

extension UIViewController {
    
    static func className() -> String {
        return String(describing: self)
    }
    
    func isIphoneX() -> Bool {
        if UIScreen.main.nativeBounds.height == 2436 && UIDevice().userInterfaceIdiom == .phone {
            return true
        }
        return false
    }
    
    func setScrollNavbarAlpha(offset: CGFloat = 0.0, color: UIColor, scrollView: UIScrollView) {
        if scrollView.contentOffset.y < -(offset) {
            let bgColor = UIColor(hexString: SMUITheme.primaryColorString, alpha: 0)
            self.navigationController?.navigationBar.backgroundColor = bgColor
            UIApplication.shared.statusBarView?.backgroundColor = bgColor
        } else if scrollView.contentOffset.y < offset {
            let alpha = (scrollView.contentOffset.y * 100 / offset + 100) / 100
            let bgColor = UIColor(hexString: SMUITheme.primaryColorString, alpha: alpha)
            self.navigationController?.navigationBar.backgroundColor = bgColor
            UIApplication.shared.statusBarView?.backgroundColor = bgColor
        } else {
            let bgColor = UIColor(hexString: SMUITheme.primaryColorString, alpha: 1)
            self.navigationController?.navigationBar.backgroundColor = bgColor
            UIApplication.shared.statusBarView?.backgroundColor = bgColor
        }
    }
    
    func setupBackBarButtonItems(title: String? = "", closeButton close: Bool = true, customCloseButton imageClose: UIImage? = nil, tintColor: UIColor? = UIColor.white) {
        var items = [UIBarButtonItem]()
        if close {
            var defaultImageClose = UIImage(named: "ic_close")
            if let imageClose = imageClose {
                defaultImageClose = imageClose
            }
            let barButtonItemClose = UIBarButtonItem(image: defaultImageClose, style: .plain, target: self, action: #selector((closePressed)))
            barButtonItemClose.tintColor = tintColor
            items.append(barButtonItemClose)
        } else {
            let backButton = UIBarButtonItem(image: UIImage(named: "ic_back_red"), style: .plain, target: self, action: #selector((backPressed)))
            let barButtonItemMenu = backButton
            barButtonItemMenu.tintColor = UIColor.white
            items.append(barButtonItemMenu)
        }
        if let title = title, title != "" {
            let label = UILabel(frame: CGRect(x: 0, y: 0, width: 120, height: 60))
            label.textColor = tintColor
            label.textAlignment = .left
            label.text = title
            label.lineBreakMode = .byTruncatingTail
//            label.font = UIFont.PFBeauFont(size: 15)
            let barButtonItemMenu = UIBarButtonItem(customView: label)
            items.append(barButtonItemMenu)
        }
        navigationItem.leftBarButtonItems = items
    }

    func setupTitle(_ title: String? = "title") {
        navigationItem.leftBarButtonItems = nil
        var items = [UIBarButtonItem]()
        if let title = title {
            let label = UILabel(frame: CGRect(x: 0, y: 0, width: 200, height: 60))
            label.textColor = UIColor.white
            label.textAlignment = .left
            label.text = title
//            label.font = UIFont.systemFont(ofSize: 17)
//            label.font = UIFont.PFBeauFont(size: 17)
            let barButtonItemMenu = UIBarButtonItem(customView: label)
            items.append(barButtonItemMenu)
        }
        navigationItem.leftBarButtonItems = items
    }
    
    func setupMainNavbar(withTitle title: String? = "") {
        let logo = UIImage(named: "ic_logo_bolnus")
        let imageViewLogo = UIImageView(image:logo)
        imageViewLogo.frame = CGRect(x: 0, y: 0, width: 100, height: 35)
        imageViewLogo.contentMode = .scaleAspectFit
        imageViewLogo.clipsToBounds = true
        let logoContainer = UIView()
        logoContainer.frame = CGRect(x: 0, y: 0, width: 100, height: 35)
        logoContainer.addSubview(imageViewLogo)
        view.addConstraintsWithFormat("V:[v0(35)]", views: logoContainer)
        view.addConstraintsWithFormat("H:[v0(100)]", views: logoContainer)
        view.addConstraintsWithFormat("V:|-(>=0)-[v0(35)]-(>=0)-|", views: imageViewLogo)
        view.addConstraintsWithFormat("H:|-(>=0)-[v0(100)]-(>=0)-|", views: imageViewLogo)
        self.navigationItem.titleView = logoContainer
        
//        setupTitle(title)
        navigationItem.rightBarButtonItems = nil
        navigationItem.leftBarButtonItems = nil

        let fixedSpace = UIBarButtonItem(barButtonSystemItem: UIBarButtonItem.SystemItem.fixedSpace, target: nil, action: nil)
        fixedSpace.width = 1
        
        // SEARCH ============
        let buttonSearch = UIButton()
        buttonSearch.frame = CGRect(x: 0, y: 0, width: 30, height: 30)
        buttonSearch.setImage(UIImage(named:"ic_search"), for: UIControl.State.normal)
        buttonSearch.addTarget(self, action: #selector(buttonSearchPressed), for: UIControl.Event.touchUpInside)
        buttonSearch.imageView?.contentMode = .scaleAspectFit
//        buttonSearch.width(30)
//        buttonSearch.height(30)
        view.addConstraintsWithFormat("V:[v0(30)]", views: buttonSearch)
        view.addConstraintsWithFormat("H:[v0(30)]", views: buttonSearch)
        let barButtonSearch = UIBarButtonItem(customView: buttonSearch)
        // =================
        
        // STORE ============

//        let buttonStore = UIButton()
//        buttonStore.setImage(UIImage(named:"ic_cart"), for: UIControlState.normal)
//        buttonStore.addTarget(self, action: #selector(buttonShopPressed), for: UIControlEvents.touchUpInside)
//        buttonStore.frame = CGRect(x: 0, y: 0, width: 30, height: 30)
//        buttonStore.imageView?.contentMode = .scaleAspectFit
////        buttonStore.width(30)
////        buttonStore.height(30)
//        view.addConstraintsWithFormat("V:[v0(30)]", views: buttonStore)
//        view.addConstraintsWithFormat("H:[v0(30)]", views: buttonStore)
//
//        let barButtonStore = UIBarButtonItem(customView: buttonStore)
        // =================
        
        navigationItem.rightBarButtonItems = [/*barButtonStore, */fixedSpace, barButtonSearch]
    }

    
    func setupButtonShare() {
        var items = [UIBarButtonItem]()
        let barButtonItemClose = UIBarButtonItem(image: UIImage(named: "ic_close"), style: .plain, target: self, action: #selector((closePressed)))
        barButtonItemClose.tintColor = UIColor.white
        items.append(barButtonItemClose)
        navigationItem.rightBarButtonItems = items
    }
    
    func setupTextRightItems(title: String? = "") {
        var items = [UIBarButtonItem]()
        if let title = title {
            let label = UILabel(frame: CGRect(x: 0, y: 0, width: 80, height: 60))
            label.textColor = UIColor.blue
            label.textAlignment = .right
            label.text = title
            label.font = UIFont.systemFont(ofSize: 12)
            let barButtonItemMenu = UIBarButtonItem(customView: label)
            items.append(barButtonItemMenu)
        }
        navigationItem.rightBarButtonItems = items
    }
    
    func pushController(controller: UIViewController, withbackTitle backTitle: String? = "", animated: Bool = true, color: UIColor = .white) {
        // Please add 'CustomNavBar.addTo(nav: self.navigationController, owner: self)'
        // in parent controller, before execute this methods
//        CustomNavBar.removeFrom(nav: self.navigationController)
        let backItem = UIBarButtonItem()
        backItem.tintColor = color
        backItem.title = "  \(backTitle ?? "")"
        navigationItem.backBarButtonItem = backItem
        self.navigationController?.pushViewController(controller, animated: animated)
    }
    
    func popToViewController(controllerClass: AnyClass) {
        if let nav = self.navigationController {
            for controller in nav.viewControllers as Array {
                if controller.isKind(of: controllerClass) {
                    self.navigationController?.popToViewController(controller, animated: true)
                    break
                }
            }
        }
    }
    
    @objc func closePressed(sender: UIBarButtonItem) {
        self.dismiss(animated: true, completion: nil)
    }
    
    func openSafary(with urlString: String) {
        if let url = URL(string: urlString) {
            if #available(iOS 10.0, *) {
                UIApplication.shared.open(url, options: [:])
            } else {
                UIApplication.shared.openURL(url)
            }
        }
    }
    
    func setTransparentNavbar() {
        self.navigationController?.navigationBar.backgroundColor = nil
        self.navigationController?.navigationBar.setBackgroundImage(UIImage(), for: .default)
        self.navigationController?.navigationBar.shadowImage = UIImage()
        self.navigationController?.navigationBar.isTranslucent = true
    }
    
    func setSolidNavbarWith(color: UIColor) {
        self.navigationController?.navigationBar.backgroundColor = color
//        self.navigationController?.navigationBar.shadowImage = UIImage()
        self.navigationController?.navigationBar.isTranslucent = false
    }
    
    func setScrollingTransparentNavbar() -> UIView {
        setTransparentNavbar()
        let gradient = UIImageView(image: UIImage(named: "gradient"))
        gradient.frame = CGRect(x: 0, y: 0, width: UIScreen.main.bounds.width, height: 64)
        self.view.addSubview(gradient)
        let navBarView = UIView(frame: CGRect(x: 0, y: 0, width: UIScreen.main.bounds.width, height: 64))
        navBarView.backgroundColor = UIColor(hex: 0xd91a31)
        return navBarView
    }
    
    func setNavbarBackgroundImage() {
        self.navigationController?.navigationBar.shadowImage = UIImage()
        self.navigationController?.navigationBar.isTranslucent = false
        self.navigationController!.navigationBar.setBackgroundImage(UIImage(), for: .default)
    }
    
    func setGradientLayerForBounds(firstColor: UIColor, secondColor: UIColor, bounds: CGRect) -> CAGradientLayer {
        let layer = CAGradientLayer()
        layer.frame = bounds
        layer.colors = [firstColor.cgColor, secondColor.cgColor]
        return layer
    }
    
    func setGradientBackground(firstColor: UIColor, secondColor: UIColor) {
        let gradient: CAGradientLayer = CAGradientLayer()
        gradient.colors = [firstColor.cgColor, secondColor.cgColor]
        gradient.locations = [0.0 , 1.0]
        gradient.startPoint = CGPoint(x: 1.0, y: 0.0)
        gradient.endPoint = CGPoint(x: 1.0, y: 1.0)
        gradient.frame = CGRect(x: 0.0, y: 0.0, width: self.view.frame.size.width, height: self.view.frame.size.height)
        self.view.layer.insertSublayer(gradient, at: 0)
    }
    
    func isModal() -> Bool {
        if self.navigationController?.viewControllers.count == 1 {
            return true
        }
        return false
    }
    
//    func loadFotoFromServer(interactor: UserInteractor, navItem: UINavigationItem) {
//        interactor.loadUserData()
//        if let rightItems = navItem.rightBarButtonItems, rightItems.count > 0 {
//            let size: CGFloat = 25
//            for index in 0..<rightItems.count {
//                let button = UIButton(frame: CGRect(x: CGFloat(0), y: CGFloat(0), width: size, height: 50.0))
//                let containView = UIView(frame: CGRect(x: CGFloat(0), y: CGFloat(0), width: size, height: size))
//                var image = ""
//                switch index {
//                case 0:
//                    image = "ic_profile_normal"
//                    button.addTarget(self, action: #selector((profilePresentController)), for: .touchUpInside)
//                    let itemImageView = UIImageView(image: UIImage(named: image))
//                    if let photoUrl = interactor.user?.attachment_small_dynamic_width, let url = URL(string: (photoUrl)) {
//                        itemImageView.af_setImage(withURL: url, placeholderImage: UIImage(named: image), imageTransition: .crossDissolve(0.2))
//                        itemImageView.circlify(masked: true)
//                        itemImageView.contentMode = .scaleAspectFill
//                    }
//                    itemImageView.frame = CGRect(x: CGFloat(0), y: CGFloat(0), width: size, height: size)
//                    containView.layer.cornerRadius = size/2
//                    containView.layer.masksToBounds = true
//                    containView.clipsToBounds = true
//                    containView.addSubview(itemImageView)
//                    containView.addSubview(button)
//                    rightItems[index].customView = containView
//                case 2:
//                    image = "ic_search"
//                    button.addTarget(self, action: #selector((searchPresentController)), for: .touchUpInside)
//                    let itemImageView = UIImageView(image: UIImage(named: image))
//                    itemImageView.frame = CGRect(x: CGFloat(0), y: CGFloat(0), width: size, height: size)
//                    containView.layer.cornerRadius = size/2
//                    containView.layer.masksToBounds = true
//                    containView.clipsToBounds = true
//                    containView.addSubview(itemImageView)
//                    containView.addSubview(button)
//                    rightItems[index].customView = containView
//                default: break
//                }
//            }
//        }
//    }
//
//    func setupPlaceholder(_ text: String, forTextField textField: UITextField, fontSize: CGFloat = 14) {
//        textField.attributedPlaceholder = NSAttributedString(string: text, attributes: [NSForegroundColorAttributeName: UIColor.placeholderText(), NSFontAttributeName: UIFont.PFBeauFont(size: fontSize)])
//    }
//
//    func goOut(completion: (() -> Void)?) {
//        let realm = try! Realm()
//        try! realm.write {
//            realm.deleteAll()
//        }
//        unsubscribeAllTopics()
//        let stickerInteractor = KeyboardStickerInteractor()
//        stickerInteractor.load()
//
//        for sticker in stickerInteractor.stickerCategoryList {
////            sticker.isDownloaded = true
//            print("isDownloaded \(sticker.isDownloaded)")
//            sticker.isDownloaded = true
//            stickerInteractor.saveStickerDownloaded(stickerCategory: sticker)
//        }
//        PreferenceManager.instance.userid = nil
//        PreferenceManager.instance.token = nil
//        PreferenceManager.instance.isLoggedInUsingEmail = nil
//        let controller = LoginViewController.instantiateNav()
//        self.present(controller, animated: true, completion: completion)
//    }
//
//    func unsubscribeAllTopics() {
//        PreferenceManager.instance.launced = nil
//        PreferenceManager.instance.isSubscribeLive = nil
//        PreferenceManager.instance.isSubscribeUpcoming = nil
//        PreferenceManager.instance.isSubscribeLatest = nil
//        PreferenceManager.instance.isSubscribeVideo = nil
//        PreferenceManager.instance.isSubscribeNews = nil
//        FIRMessaging.messaging().unsubscribe(fromTopic: "/topics/live")
//        FIRMessaging.messaging().unsubscribe(fromTopic: "/topics/upcoming")
//        FIRMessaging.messaging().unsubscribe(fromTopic: "/topics/latest")
//        FIRMessaging.messaging().unsubscribe(fromTopic: "/topics/video")
//        FIRMessaging.messaging().unsubscribe(fromTopic: "/topics/news")
//        FIRMessaging.messaging().unsubscribe(fromTopic: "/topics/home")
//    }
    
    func isTokenInvalid(withContainError error: String) -> Bool {
        return error.lowercased().contains("token is invalid")
    }
    
    func goOutWithComplationTokenInvalid(_ error: String) {
//        self.goOut(completion: {
//            SVProgressHUD.showError(withStatus: error+"\nPlease login again to get your new access token :)")
//            SVProgressHUD.delayDismiss(delay: 3.0)
//        })
    }
    
    func presentDetail(_ viewControllerToPresent: UIViewController) {
        let transition = CATransition()
        transition.duration = 0.25
        transition.type = CATransitionType.push
        transition.subtype = CATransitionSubtype.fromRight
        self.view.window!.layer.add(transition, forKey: kCATransition)
        present(viewControllerToPresent, animated: false)
    }
    
    func dismissDetail() {
        let transition = CATransition()
        transition.duration = 0.25
        transition.type = CATransitionType.push
        transition.subtype = CATransitionSubtype.fromLeft
        self.view.window!.layer.add(transition, forKey: kCATransition)
        
        dismiss(animated: false)
    }
    
    // MARK: SELECTOR
    
    @objc func backPressed(sender: UIBarButtonItem) {
        if isModal() {
            self.dismiss(animated: true, completion: nil)
        } else {
            let _ = self.navigationController?.popViewController(animated: true)
        }
    }
    
    @objc func ticketPresentController() {
//        let controller = TicketsViewController.instantiateNav()
//        ControllerManager.presentModalFromRight(controller: controller, from: self)
    }
    
    @objc func profilePresentController() {
//        let controller = ProfileViewController.instantiateNav()
//        ControllerManager.presentModalFromRight(controller: controller, from: self)
    }
    
    func rewardPresentController() {
//        let controller = RewardsViewContainer.instantiateNav()
//        ControllerManager.presentModalFromRight(controller: controller, from: self)
    }
    
    @objc func searchPresentController() {
//        if let navigationController = navigationController, let topViewController = navigationController.topViewController, topViewController is NewsViewController {
//            let controller = SearchViewController.instantiateNav(mode: "news")
//            ControllerManager.presentModalFromRight(controller: controller, from: self)
//        } else if let navigationController = navigationController, let topViewController = navigationController.topViewController, topViewController is VideoViewController {
//            let controller = SearchViewController.instantiateNav(mode: "video")
//            ControllerManager.presentModalFromRight(controller: controller, from: self)
//        } else if let navigationController = navigationController, let topViewController = navigationController.topViewController, topViewController is VideoListViewController {
//            let videoListViewController = topViewController as! VideoListViewController
//            let playlistId = videoListViewController.playlistId
//            let controller = SearchViewController.instantiateNav(mode: "video_list", playlistId: playlistId)
//            ControllerManager.presentModalFromRight(controller: controller, from: self)
//        } else if let navigationController = navigationController, let topViewController = navigationController.topViewController, topViewController is RewardsViewContainer {
//            let rewardsViewContainer = topViewController as! RewardsViewContainer
//            if rewardsViewContainer.segmentedPager.pager.indexForSelectedPage == 0 {
//                let controller = SearchViewController.instantiateNav(mode: nil)
//                ControllerManager.presentModalFromRight(controller: controller, from: self)
//            } else {
//                let controller = SearchViewController.instantiateNav(mode: nil)
//                ControllerManager.presentModalFromRight(controller: controller, from: self)
//            }
//        } else if let navigationController = navigationController, let topViewController = navigationController.topViewController, topViewController is HomeViewController {
//            let controller = SearchViewController.instantiateNav(mode: "all")
//            ControllerManager.presentModalFromRight(controller: controller, from: self)
//        } else {
//            let controller = SearchViewController.instantiateNav(mode: nil)
//            ControllerManager.presentModalFromRight(controller: controller, from: self)
//        }
    }
    
    @objc func cartPresentController() {
        
    }
    
    @objc func checkPresentController() {
        
    }
    
    @objc func buttonSearchPressed(sender: UIButton) {
        
    }
    
}
