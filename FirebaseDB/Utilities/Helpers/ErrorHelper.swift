//
//  ErrorHelper.swift
//
//  Created by Rifat Firdaus on 12/8/17.
//  Copyright © 2017 Suitmedia. All rights reserved.
//

import UIKit

// 1xx Auth Error
// 2xx

enum ErrorCode: Int {
    case emptyEmail = 101
    case emptyPassword = 102
    case minimumPassword = 103
    case emptyName = 104
    case emptyUsername = 105
    
    case userDataError = 301
    case errorPass = 302
    
    case expiredToken = 400
    
    case invalidGame = 500
    case invalidMatch = 501
    
    case unknownError = 1000
}

class ErrorHelper: NSObject {

    static let instance = ErrorHelper()
    
    private let domain = "BolaNusantara"
    
    func getErrorFrom(apiResponse: APIResponse) -> NSError {
        if let code = apiResponse.code, let message = apiResponse.message {
            let userInfo = [NSLocalizedDescriptionKey: message]
            return NSError(domain: domain, code: code, userInfo: userInfo)
        }
        return getErrorWith(code: .unknownError)
    }
    
    func getErrorWith(code: ErrorCode) -> NSError {
        let userInfo = [NSLocalizedDescriptionKey: getDescriptionWith(code: code)]
        return NSError(domain: domain, code: code.rawValue, userInfo: userInfo)
    }
    
    private func getDescriptionWith(code: ErrorCode) -> String {
        switch code {
        case .emptyEmail:
            return "Email tidak boleh kosong!"
        case .emptyName:
            return "Nama lengkap tidak boleh kosong!"
        case .emptyUsername:
            return "Username tidak boleh kosong!"
        case .emptyPassword:
            return "Password tidak boleh kosong!"
        case .minimumPassword:
            return "Password minimum 6 karakter!"
        case .unknownError:
            return "Something went wrong,\nPlease try again later!"
        case .userDataError:
            return "Invalid user data!"
        case .errorPass:
            return "Password yang dimasukan tidak tepat"
        case .expiredToken:
            return "Token Expired"
        case .invalidGame:
            return "Game Tidak Tersedia"
        case .invalidMatch:
            return "Match Tidak Tersedia"
        }
    }
    
}
