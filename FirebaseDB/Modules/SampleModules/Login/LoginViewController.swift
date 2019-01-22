//
//  LoginViewController.swift
//  FirebaseDB
//
//  Created by Rifat Firdaus on 22/01/19.
//  Copyright © 2019 Rifat Firdaus. All rights reserved.
//

import UIKit
import Firebase
import GoogleSignIn
import SVProgressHUD

class LoginViewController: UIViewController {

    lazy var buttonLoginGoogle: SMButtonPrimary = {
        let buttonLogin = SMButtonPrimary()
        buttonLogin.setTitle("Login with Google", for: .normal)
        return buttonLogin
    }()
    
    lazy var stackViewContainer: UIStackView = {
        let stackView = SMContainerView.createVerticalWrap()
        return stackView
    }()
    
    var userManager = SMAuthProfileManager()
    
    let dbFirebase = Firestore.firestore()
    
    static func instantiate() -> LoginViewController {
        let controller = LoginViewController()
        controller.view.backgroundColor = .white
        return controller
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let settings = dbFirebase.settings
        settings.areTimestampsInSnapshotsEnabled = true
        dbFirebase.settings = settings
        
        view.addSubview(stackViewContainer)
        stackViewContainer.translatesAutoresizingMaskIntoConstraints = false
        view.addConstraintCenterY(view: stackViewContainer)
        view.addConstraintsWithFormat("H:|-[v0]-|", views: stackViewContainer)
        
        stackViewContainer.addArrangedSubview(buttonLoginGoogle)
        view.addConstraintsWithFormat("V:[v0(50@999)]", views: buttonLoginGoogle)
        
        buttonLoginGoogle.addTarget(self, action: #selector(buttonLoginGooglePressed), for: .touchUpInside)
        
        GIDSignIn.sharedInstance().uiDelegate = self
        userManager.signInGoogleDelegate = self
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        
        SVProgressHUD.show()
        if let user = userManager.getFirebaseUser() {
            SVProgressHUD.dismiss()
            dbFirebase.collection("users").document(user.uid).getDocument { [weak self] (document, error) in
                if let document = document, document.exists {
                    let dataDescription = document.data().map(String.init(describing:)) ?? "nil"
                    print("Document data: \(dataDescription)")
                    self?.launchMainTabbar()
                } else {
                    print("Document does not exist")
                    self?.dbFirebase.collection("users").document(user.uid).setData([
                        "email": user.email ?? "",
                        "name": user.displayName ?? "",
                        "photo": user.photoURL?.absoluteString ?? "",
                        "create_at": Timestamp()
                        ], completion: { (err) in
                            if let err = err {
                                print("Error adding document: \(err)")
                            } else {
                                print("Document added")
                                self?.launchMainTabbar()
                            }
                    })
                }
            }
        } else {
            SVProgressHUD.dismiss()
        }
    }
    
    @objc func buttonLoginGooglePressed(_ sender: UIButton) {
        SVProgressHUD.show()
        userManager.signInWithGoogleAndRegisterFirebaseAuth()
    }
    
    func launchMainTabbar() {
        let tabBarController = MainTabBarController.instantiateNav()
        tabBarController.modalTransitionStyle = .crossDissolve
        present(tabBarController, animated: true, completion: nil)
    }
    
}

extension LoginViewController: GIDSignInUIDelegate { }
extension LoginViewController: SMAuthProfileManagerSignInGoogle {
    func smAuthProfileManagerSignInGoogle(didSuccessAndRegistered user: User?, googleUser: GIDGoogleUser) {
        if let user = user {
            dbFirebase.collection("users").document(user.uid).setData([
                "email": user.email ?? "",
                "name": user.displayName ?? "",
                "photo": user.photoURL?.absoluteString ?? "",
                "create_at": Timestamp()
                ], completion: { (err) in
                    if let err = err {
                        print("Error adding document: \(err)")
                    } else {
                        print("Document added")
                    }
            })
        }
        SVProgressHUD.dismiss()
        launchMainTabbar()
    }
    
    func smAuthProfileManagerSignInGoogle(didSuccess user: GIDGoogleUser) {
        SVProgressHUD.dismiss()
        launchMainTabbar()
    }
    
    func smAuthProfileManagerSignInGoogle(didFailed error: Error) {
        SVProgressHUD.showError(withStatus: error.localizedDescription)
    }
}
