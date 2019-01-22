//
//  NSURLExtension.swift
//  Bali United
//
//  Created by Muhammad Alam Akbar on 3/23/17.
//  Copyright © 2017 Suitmedia. All rights reserved.
//

import Foundation

extension URL {
    
    public var queryParameters: [String: String]? {
        guard let components = URLComponents(url: self, resolvingAgainstBaseURL: true), let queryItems = components.queryItems else {
            return nil
        }
        
        var parameters = [String: String]()
        for item in queryItems {
            parameters[item.name] = item.value
        }
        
        return parameters
    }
    
    func getKeyVals() -> Dictionary<String, String>? {
        var results = [String:String]()
        if let query = self.query {
            let keyValues = query.components(separatedBy: "&")
            if keyValues.count > 0 {
                for pair in keyValues {
                    let kv = pair.components(separatedBy: "=")
                    if kv.count > 1 {
                        results.updateValue(kv[1], forKey: kv[0])
                    }
                }
            }
        }
        return results
    }
}
