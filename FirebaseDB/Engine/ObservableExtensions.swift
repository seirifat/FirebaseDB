//
//  ObservableExtensions.swift
//
//  Created by Rifat Firdaus on 10/1/18.
//  Copyright © 2018 Rifat Firdaus. All rights reserved.
//

import UIKit
import SwiftyJSON
import RxSwift

extension Observable {
    
    func printJson() -> Observable {
        return self.do(onNext: { item in
            //            print(item)
            if let data = item as? (HTTPURLResponse, Any) {
                print(data.1)
            } else {
                print(item)
            }
        })
    }
    
    func mapAPIResponse() -> Observable<APIResponse> {
        return map { (item: E) -> APIResponse in
            guard let data = item as? (HTTPURLResponse, Any) else {
                fatalError("response error")
            }
            let json = JSON(data.1)
            if let code = Int(json["status_code"].stringValue), let message = json["message"].string {
                return APIResponse(message: message, code: code, result: json["data"])
            } else if let code = Int(json["status"].stringValue), let message = json["message"].string {
                return APIResponse(message: message, code: code, result: json["data"])
            }
            print("⭕️ status_code or message does not exist")
            throw ErrorHelper.instance.getErrorWith(code: .unknownError)
        }
    }
    
    func mapJson() -> Observable<JSON> {
        return map { (item: E) -> JSON in
            guard let data = item as? (HTTPURLResponse, Any) else {
                fatalError("response error")
            }
            let json = JSON(data.1)
            return json
        }
    }
}

