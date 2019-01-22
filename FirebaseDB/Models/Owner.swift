//
//  Owner.swift
//  Model Generated using http://www.jsoncafe.com/ 
//  Created on October 3, 2018

import Foundation
import SwiftyJSON
import RealmSwift

class Owner: Object {
    
    @objc dynamic var identifier: Int = 0
    @objc dynamic var login: String?
    @objc dynamic var avatarUrl: String?
    @objc dynamic var url: String?
    @objc dynamic var htmlUrl: String?
    
    override public static func primaryKey() -> String? {
        return "identifier"
    }
    
    public static func with(realm: Realm, json: JSON) -> Owner? {
        let identifier = json["id"].intValue
        if identifier == 0 {
            return nil
        }
        var obj = realm.object(ofType: Owner.self, forPrimaryKey: identifier)
        if obj == nil {
            obj = Owner()
            obj?.identifier = identifier
        } else {
            obj = Owner(value: obj!)
        }
        
        if json["login"].exists() {
            obj?.login = json["login"].string
        }
        
        if json["avatar_url"].exists() {
            obj?.avatarUrl = json["avatar_url"].string
        }
        
        if json["url"].exists() {
            obj?.url = json["url"].string
        }
        
        if json["html_url"].exists() {
            obj?.htmlUrl = json["html_url"].string
        }
        
        return obj
    }
    
    public static func with(json: JSON) -> Owner? {
        return with(realm: try! Realm(), json: json)
    }
    
}
