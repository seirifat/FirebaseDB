//
//  ArticleFirebase.swift
//  FirebaseDB
//
//  Created by Rifat Firdaus on 23/01/19.
//  Copyright © 2019 Rifat Firdaus. All rights reserved.
//

import UIKit
import Firebase

class ArticleFirebase: NSObject {

    var identifier: String?
    var title: String?
    var content: String?
    var date: Date?
    var writter: Writter?
    
    init(documentID: String, dictionary: [String: Any]) {
        identifier = documentID
        title = dictionary["title"] as? String
        content = dictionary["content"] as? String
        if let timeStamp = dictionary["date"] as? Timestamp {
            date = timeStamp.dateValue()
        }
        if let writterData = dictionary["writter"] as? [String: Any]{
            writter = Writter(fromDictionary: writterData)
        }
    }
    
    func toDictionary() -> [String: Any] {
        var dictionary = [String: Any]()
        if title != nil {
            dictionary["title"] = title
        }
        if content != nil {
            dictionary["content"] = content
        }
        if date != nil {
            dictionary["date"] = date
        }
        if writter != nil {
            dictionary["writter"] = writter?.toDictionary()
        }
        return dictionary
    }
    
}

class Writter: NSObject {
    
    var identifier: String?
    var name: String?
    
    init(fromDictionary dictionary: [String: Any]){
        identifier = dictionary["id"] as? String
        name = dictionary["name"] as? String
    }
    
    func toDictionary() -> [String: Any] {
        var dictionary = [String: Any]()
        if identifier != nil {
            dictionary["id"] = identifier
        }
        if name != nil {
            dictionary["name"] = name
        }
        return dictionary
    }
}
