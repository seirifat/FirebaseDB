//
//  DetachableObject.swift
//
//  Created by Alam Akbar M on 10/10/17.
//  Copyright © 2017 Suitmedia. All rights reserved.
//

import Foundation
import RealmSwift
import Realm

protocol DetachableObject: AnyObject {
    func detached() -> Self
}

extension Object: DetachableObject {
    
    public func detached() -> Self {
        let detached = type(of: self).init()
        for property in objectSchema.properties {
            guard let value = value(forKey: property.name) else { continue }
            if let detachable = value as? DetachableObject {
                detached.setValue(detachable.detached(), forKey: property.name)
            } else {
                detached.setValue(value, forKey: property.name)
            }
        }
        return detached
    }
    
}

extension List: DetachableObject {
    
    public func detached() -> List<Element> {
        let result = List<Element>()
        forEach { item in
            if let obj = item as? DetachableObject, let detached = obj.detached() as? Element {
                result.append(detached)
            } else {
                result.append(item)
            }
        }
        return result
    }
    
    public func detachedArray() -> [Element] {
        return Array(detached())
    }
    
}

extension Array {
    
    public func detached() -> [Object] {
        var detachedArray = [Object]()
        forEach { item in
            if let obj = item as? Object {
                detachedArray.append(obj.detached())
            }
        }
        return detachedArray
    }
    
}
