//
//  Repo.swift
//  Model Generated using http://www.jsoncafe.com/ 
//  Created on October 3, 2018

import Foundation
import SwiftyJSON
import RealmSwift

class Repo: Object {
    
    @objc dynamic var identifier: Int = 0
    @objc dynamic var nodeId: String?
    @objc dynamic var name: String?
    @objc dynamic var fullName: String?
    @objc dynamic var owner: Owner?
    @objc dynamic var htmlUrl: String?
    @objc dynamic var descriptionField: String?
    @objc dynamic var createdAt: Date?
    @objc dynamic var updatedAt: Date?
    
    override public static func primaryKey() -> String? {
        return "identifier"
    }
    
    public static func with(realm: Realm, json: JSON) -> Repo? {
        let identifier = json["id"].intValue
        if identifier == 0 {
            return nil
        }
        var obj = realm.object(ofType: Repo.self, forPrimaryKey: identifier)
        if obj == nil {
            obj = Repo()
            obj?.identifier = identifier
        } else {
            obj = Repo(value: obj!)
        }
        
        if json["node_id"].exists() {
            obj?.nodeId = json["node_id"].string
        }
        
        if json["name"].exists() {
            obj?.name = json["name"].string
        }
        
        if json["full_name"].exists() {
            obj?.fullName = json["full_name"].string
        }
        
        if json["owner"].exists() {
            obj?.owner = Owner.with(json: json["owner"])
        }
        
        if json["html_url"].exists() {
            obj?.htmlUrl = json["html_url"].string
        }
        
        if json["description"].exists() {
            obj?.descriptionField = json["description"].string
        }
        
        if json["created_at"].exists() {
            obj?.createdAt = DateHelper.iso8601(dateString: json["created_at"].stringValue)
        }
        if json["updated_at"].exists() {
            obj?.updatedAt = DateHelper.iso8601(dateString: json["updated_at"].stringValue)
        }
        
        return obj
    }
    
    public static func with(json: JSON) -> Repo? {
        return with(realm: try! Realm(), json: json)
    }
    
}
