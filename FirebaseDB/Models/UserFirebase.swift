//
//  UserFirebase.swift
//  FirebaseDB
//
//  Created by Rifat Firdaus on 23/01/19.
//  Copyright © 2019 Rifat Firdaus. All rights reserved.
//

import UIKit
import Firebase

class UserFirebase: NSObject {

    var identifier = ""
    var name: String?
    var photo: String?
    var email: String?
    
    init(documentID: String, dictionary: [String: Any]) {
        identifier = documentID
        name = dictionary["name"] as? String
        email = dictionary["email"] as? String
        photo = dictionary["photo"] as? String
    }
    
    func toDictionary() -> [String: Any] {
        var dictionary = [String: Any]()
        dictionary["name"] = name
        dictionary["photo"] = name
        dictionary["email"] = name
        return dictionary
    }
    
}
