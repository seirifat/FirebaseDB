//
//  SMAuthProfileManager.swift
//  FirebaseDB
//
//  Created by Rifat Firdaus on 22/01/19.
//  Copyright © 2019 Rifat Firdaus. All rights reserved.
//

import UIKit
import Firebase
import GoogleSignIn
import FacebookCore
import FacebookLogin

protocol SMAuthProfileManagerSignInGoogle {
    func smAuthProfileManagerSignInGoogle(didSuccess user: GIDGoogleUser)
    func smAuthProfileManagerSignInGoogle(didSuccessAndRegistered user: User?, googleUser: GIDGoogleUser)
    func smAuthProfileManagerSignInGoogle(didFailed error: Error)
}

protocol SMAuthProfileManagerGoogleProfile {
    func smAuthProfileManagerGoogleProfileUpdateProfileDidSuccess()
    func smAuthProfileManagerGoogleProfileUpdateProfileDidFailed(error: Error)
}

protocol SMAuthProfileManagerSignInFacebook {
    func smAuthProfileManagerSignInFacebook(didSuccess user: User, accessToken: AccessToken)
    func smAuthProfileManagerSignInFacebook(didCancelled loginResult: LoginResult)
    func smAuthProfileManagerSignInFacebook(didFailed error: Error)
}

class SMAuthProfileManager: NSObject {
    
    private var signInGoogleWithFirebaseAuth = false
    
    var signInGoogleDelegate: SMAuthProfileManagerSignInGoogle?
    var profileGoogleDelegate: SMAuthProfileManagerGoogleProfile?
    var signInFacebookDelegate: SMAuthProfileManagerSignInFacebook?
    
    override init() {
        super.init()
        
        GIDSignIn.sharedInstance()?.delegate = self
    }
    
    // MARK: Google
    
    func signInWithGoogle() {
        signInGoogleWithFirebaseAuth = false
        GIDSignIn.sharedInstance().signIn()
    }
    
    func signInWithGoogleAndRegisterFirebaseAuth() {
        signInGoogleWithFirebaseAuth = true
        GIDSignIn.sharedInstance().signIn()
    }
    
    func getFirebaseUser() -> User? {
        return Auth.auth().currentUser
    }
    
    func signOut() {
        signOutGoogle()
        signOutFacebook()
    }
    
    func signOutGoogle() {
        GIDSignIn.sharedInstance()?.signOut()
        
        let firebaseAuth = Auth.auth()
        do {
            try firebaseAuth.signOut()
        } catch let signOutError as NSError {
            print ("Error signing out: %@", signOutError)
        }
    }
    
    func updateGoogleProfile(name: String?, photoURL: URL?) {
        let changeRequest = Auth.auth().currentUser?.createProfileChangeRequest()
        changeRequest?.displayName = name
        changeRequest?.photoURL = photoURL
        changeRequest?.commitChanges { [weak self] (error) in
            if let error = error {
                self?.profileGoogleDelegate?.smAuthProfileManagerGoogleProfileUpdateProfileDidFailed(error: error)
                return
            }
            self?.profileGoogleDelegate?.smAuthProfileManagerGoogleProfileUpdateProfileDidSuccess()
        }
    }
    
    // MARK: Facebook
    
    func signInWithFacebook(in controller: UIViewController) {
        let loginManager = LoginManager()
        loginManager.logIn(readPermissions: [.publicProfile, .email], viewController: controller, completion: { [weak self] loginResult in
            guard let self = self else { return }
            
            switch loginResult {
            case .failed(let error):
                self.signInFacebookDelegate?.smAuthProfileManagerSignInFacebook(didFailed: error)
            case .cancelled:
                self.signInFacebookDelegate?.smAuthProfileManagerSignInFacebook(didCancelled: loginResult)
            case .success( _, _, let accessToken):
                let credential = FacebookAuthProvider.credential(withAccessToken: accessToken.authenticationToken)
                Auth.auth().signInAndRetrieveData(with: credential) { [weak self] (authResult, error) in
                    guard let self = self else { return }
                    
                    if let error = error {
                        self.signInFacebookDelegate?.smAuthProfileManagerSignInFacebook(didFailed: error)
                        return
                    }
                    
                    guard let authResult = authResult else {
                        return
                    }
                    
                    self.signInFacebookDelegate?.smAuthProfileManagerSignInFacebook(didSuccess: authResult.user, accessToken: accessToken)
                }
            }
        })
    }
    
    func signOutFacebook() {
        let loginManager = LoginManager()
        loginManager.logOut()
    }
    
}

extension SMAuthProfileManager: GIDSignInDelegate {
    func sign(_ signIn: GIDSignIn!, didSignInFor user: GIDGoogleUser!, withError error: Error!) {
        if let error = error {
            signInGoogleDelegate?.smAuthProfileManagerSignInGoogle(didFailed: error)
            return
        }
        
        guard let authentication = user.authentication else { return }
        
        let credential = GoogleAuthProvider.credential(withIDToken: authentication.idToken, accessToken: authentication.accessToken)
        
        if signInGoogleWithFirebaseAuth {
            Auth.auth().signInAndRetrieveData(with: credential) { [weak self] (resultUser, error) in
                if let error = error {
                    self?.signInGoogleDelegate?.smAuthProfileManagerSignInGoogle(didFailed: error)
                    return
                }
                self?.signInGoogleDelegate?.smAuthProfileManagerSignInGoogle(didSuccessAndRegistered: resultUser?.user, googleUser: user)
            }
        } else {
            signInGoogleDelegate?.smAuthProfileManagerSignInGoogle(didSuccess: user)
        }
    }
    
    func sign(_ signIn: GIDSignIn!, didDisconnectWith user: GIDGoogleUser!, withError error: Error!) {
        signInGoogleDelegate?.smAuthProfileManagerSignInGoogle(didFailed: error)
    }
    
}
