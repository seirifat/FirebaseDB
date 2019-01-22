//
//  NumberHelper.swift
//
//  Created by Rifat Firdaus on 2/14/17.
//  Copyright © 2017 Suitmedia. All rights reserved.
//

import UIKit

class NumberHelper: NSObject {

    static let instance = NumberHelper()

    func format(currency: String? = nil, value: Int64) -> String {
        var currencyPrefix = ""
        if let currency = currency {
            currencyPrefix = currency
        }
        var result = ""
        let numberFormatter = NumberFormatter()
        numberFormatter.currencyCode = " "
        if #available(iOS 9.0, *) {
            numberFormatter.numberStyle = .currencyISOCode
        } else {
            // Fallback on earlier versions
            numberFormatter.numberStyle = .currency
        }
        numberFormatter.minimumFractionDigits = 0
        result = numberFormatter.string(from: NSNumber(value: value))!
        return "\(currencyPrefix)\(result)"
    }
    
    func formatDecimal(currency: String? = nil, value: Int64) -> String {
        var currencyPrefix = ""
        if let currency = currency {
            currencyPrefix = currency
        }
        var result = ""
        let numberFormatter = NumberFormatter()
        numberFormatter.currencyCode = " "
        numberFormatter.numberStyle = .decimal
        numberFormatter.minimumFractionDigits = 0
        result = numberFormatter.string(from: NSNumber(value: value))!
        return "\(currencyPrefix)\(result)"
    }
    
    func unformat(value: String) -> String {
        return value.components(separatedBy: CharacterSet.decimalDigits.inverted).joined()
    }
    
}
