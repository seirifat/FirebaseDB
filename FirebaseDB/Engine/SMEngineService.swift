//
//  SMEngineService.swift
//  FirebaseDB
//
//  Created by Rifat Firdaus on 10/1/18.
//  Copyright © 2018 Rifat Firdaus. All rights reserved.
//

import Foundation
import Alamofire
import RxAlamofire
import SwiftyJSON
import RealmSwift

import RxSwift
import RxCocoa

open class SMEngineService: NSObject {
    
    public static let instance = SMEngineService()
    
    public let manager = SMEngineManager()
    public var home = ""
    public let successCode = 1
    
    public var headers = [
        "X-PublicKey": "",
        "X-HashKey": ""
    ]
    
    public func setup(home: String) {
        self.home = home
    }
}

public class SMEngineManager: SessionManager {
    
    override public func request(_ url: URLConvertible, method: HTTPMethod, parameters: Parameters? = nil, encoding: ParameterEncoding = URLEncoding.default, headers: HTTPHeaders? = nil) -> DataRequest {
        do {
            let urlRequest = URLRequest(url: try url.asURL())
            let request = try! encoding.encode(urlRequest, with: parameters)
            print("[\(method.rawValue)] \(request)")
        } catch {
            print("🚫 Error URL Request")
        }
        return super.request(url, method: method, parameters: parameters, encoding: encoding, headers: headers)
    }
    
    public func requestJSON(_ method: Alamofire.HTTPMethod,
                            _ url: URLConvertible,
                            parameters: [String: Any]? = nil,
                            encoding: ParameterEncoding = URLEncoding.default,
                            headers: [String: String]? = nil)
        -> Observable<(HTTPURLResponse, Any)>
    {
        do {
            let urlRequest = URLRequest(url: try url.asURL())
            let request = try! encoding.encode(urlRequest, with: parameters)
            print("➡️ [\(method.rawValue)] \(request)")
        } catch {
            print("🚫 Error URL Request")
        }
        return SessionManager.default.rx.responseJSON(
            method,
            url,
            parameters: parameters,
            encoding: encoding,
            headers: headers
        )
    }
    
    public func encodeMultipartUpload(to url: URLConvertible, method: HTTPMethod = .post, headers: HTTPHeaders = [:], data: @escaping (MultipartFormData) -> Void) -> Observable<UploadRequest> {
        return Observable.create { observer in
            self.upload(multipartFormData: data,
                        to: url,
                        method: method,
                        headers: headers,
                        encodingCompletion: { (result: SessionManager.MultipartFormDataEncodingResult) in
                            switch result {
                            case .failure(let error):
                                observer.onError(error)
                            case .success(let request, _, _):
                                observer.onNext(request)
                                observer.onCompleted()
                            }
            })
            
            return Disposables.create()
        }
    }
}

public struct Pagination<T> {
    public let pageStatus: PageStatus
    public let data: T
    
    public init(pageStatus: PageStatus, data: T) {
        self.pageStatus = pageStatus
        self.data = data
    }
}

public struct PageStatus {
    public var total: Int = 0
    public var currentPage: Int = 1
    //    public var nextPage: Int = 1
    public var lastPage: Int = 0
    public var hasNext: Bool = false
    
    public static func with(json: JSON) -> PageStatus {
        var pageStatus = PageStatus()
        pageStatus.total = json["total"].intValue
        pageStatus.currentPage = json["current_page"].intValue
        pageStatus.lastPage = json["last_page"].intValue
        pageStatus.hasNext = false
        if let _ = json["next_page_url"].string {
            pageStatus.hasNext = true
        }
        return pageStatus
    }
}

public enum APIResult<T> {
    case success(T)
    case failure(NSError)
}
