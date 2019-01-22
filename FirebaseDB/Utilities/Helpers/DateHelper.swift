//
//  DateHelper.swift
//
//  Created by Rifat Firdaus on 11/21/16.
//  Copyright © 2016 Suitmedia. All rights reserved.
//

import UIKit

open class DateHelper: NSObject {

    public static func iso8601(dateString: String) -> Date? {
        let dateFormatter = DateFormatter()
//        dateFormatter.locale = Locale(identifier: "id_ID")
//        dateFormatter.timeZone = NSTimeZone.local
//        dateFormatter.dateFormat = "yyyy-MM-dd'T'HH:mm:ssZZZZZ"
        dateFormatter.dateFormat = "yyyy-MM-dd'T'HH:mm:ssZ"
//        dateFormatter.dateFormat = "yyyy-MM-dd HH:mm:ss"
        return dateFormatter.date(from: dateString)
    }
    
    public static func iso8601withoutZone(dateString: String) -> Date? {
        let dateFormatter = DateFormatter()
        //        dateFormatter.locale = Locale(identifier: "id_ID")
        //        dateFormatter.timeZone = NSTimeZone.local
//        dateFormatter.dateFormat = "yyyy-MM-dd'T'HH:mm:ssZZZZZ"
                dateFormatter.dateFormat = "yyyy-MM-dd HH:mm:ss"
        return dateFormatter.date(from: dateString)
    }
    
    public static func date(_ dateString: String, withFormatString formatString: String) -> Date? {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = formatString
        return dateFormatter.date(from: dateString)
    }
    
    public static func calcAge(birthday: String) -> Int {
        let dateFormater = DateFormatter()
        dateFormater.dateFormat = "dd MMMM yyyy"
        let birthdayDate = dateFormater.date(from: birthday)
        let calendar: NSCalendar! = NSCalendar(calendarIdentifier: .gregorian)
        let now = Date()
        let calcAge = calendar.components(.year, from: birthdayDate!, to: now, options: [])
        let age = calcAge.year
        return age!
    }
    
}
