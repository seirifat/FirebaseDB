//
//  PreferenceManager.swift
//
//
//  Created by Rifat Firdaus on 9/8/16.
//  Copyright © 2016 Suitmedia. All rights reserved.
//

import Foundation

class PreferenceManager: NSObject {
    
    private static let token = "token"
    private static let userid = "id"
    private static let firstLaunch = "firstLaunch"
    private static let coachMarkShown = "CochMarkShown"
    private static let FCMToken = "fcm_token"
    
    static let instance = PreferenceManager()
    
    internal var userDefaults: UserDefaults
    
    override init() {
        userDefaults = UserDefaults.standard
    }
    
    init(userDefaults: UserDefaults) {
        self.userDefaults = userDefaults
    }
    
    var token: String? {
        get {
            return userDefaults.string(forKey: PreferenceManager.token)
        }
        set(newToken) {
            if let token = newToken {
                userDefaults.set(token, forKey: PreferenceManager.token)
            } else {
                userDefaults.removeObject(forKey: PreferenceManager.token)
            }
        }
    }
    
    var userid: Int64? {
        get {
            return userDefaults.object(forKey: PreferenceManager.userid) as? Int64
        }
        set(newUserid) {
            if let userid = newUserid {
                userDefaults.set(userid, forKey: PreferenceManager.userid)
            } else {
                userDefaults.removeObject(forKey: PreferenceManager.userid)
            }
        }
    }
    
    var firstLaunch: Bool {
        get {
            if let firstLaunch = userDefaults.object(forKey: PreferenceManager.firstLaunch) as? Bool {
                return firstLaunch
            }
            return true
        }
        set(newFirstLaunch) {
            userDefaults.set(newFirstLaunch, forKey: PreferenceManager.firstLaunch)
        }
    }
    
    var coachMarkShown: Bool? {
        get {
            if let coachMarkShown = userDefaults.object(forKey: PreferenceManager.coachMarkShown) as? Bool {
                return coachMarkShown
            }
            return false
        }
        set(newCoachMarkShown) {
            if let coachMarkShown = newCoachMarkShown {
                userDefaults.set(coachMarkShown, forKey: PreferenceManager.coachMarkShown)
            } else {
                userDefaults.removeObject(forKey: PreferenceManager.coachMarkShown)
            }
        }
    }
    
    var FCMToken: String? {
        get {
            return userDefaults.string(forKey: PreferenceManager.FCMToken)
        }
        set(FCMToken) {
            if let FCMToken = FCMToken {
                userDefaults.set(FCMToken, forKey: PreferenceManager.FCMToken)
            } else {
                userDefaults.removeObject(forKey: PreferenceManager.FCMToken)
            }
        }
    }
    
}
