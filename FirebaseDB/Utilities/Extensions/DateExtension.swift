//
//  DateExtension.swift
//
//  Created by Muhammad Alam Akbar on 3/9/17.
//  Copyright © 2017 Suitmedia. All rights reserved.
//

import Foundation
import SwiftDate

extension Date {
    
    func formatIntervalAgo() -> String {
        let date1: Date = Date() // Same you did before with timeNow variable
        let date2: Date = self
        
        let calender:Calendar = Calendar.current
        let components: DateComponents = calender.dateComponents([.year, .month, .day, .hour, .minute, .second], from: date2, to: date1)
        //print(components)
        var returnString:String = ""
        //print(components.second)
        
        if components.year! >= 1 {
            if components.year! == 1 {
                returnString = String(describing: components.year!)+" year ago"
            } else {
                returnString = String(describing: components.year!)+" years ago"
            }
        } else if components.month! >= 1{
            if components.month! == 1 {
                returnString = String(describing: components.month!)+" month ago"
            } else {
                returnString = String(describing: components.month!)+" months ago"
            }
        } else if components.day! >= 1{
            if components.day! == 1 {
                returnString = String(describing: components.day!) + " day ago"
            } else {
                returnString = String(describing: components.day!) + " days ago"
            }
        } else if components.hour! >= 1{
            if components.hour! == 1 {
                returnString = String(describing: components.hour!) + " hour ago"
            } else {
                returnString = String(describing: components.hour!) + " hours ago"
            }
        } else if components.minute! >= 1{
            if components.minute! == 1 {
                returnString = String(describing: components.minute!) + " minute ago"
            } else {
                returnString = String(describing: components.minute!) + " minutes ago"
            }
        } else if components.second! < 60 {
            returnString = "Just now"
        }
        
        return returnString
    }
    
    func convertToString(withFormat format: String) -> String {
        let formatter = DateFormatter()
        formatter.dateFormat = format
        formatter.amSymbol = "AM"
        formatter.pmSymbol = "PM"
        return formatter.string(from: self)
    }
    
    func toColloquialString() -> String {
        var qolloquialString = ""
        let region = Region.current
        let dateNow = DateInRegion()
        let dateDifference = DateInRegion(self, region: region)
        if dateDifference > dateNow - 7.days {
            qolloquialString = dateDifference.toRelative(style: RelativeFormatter.defaultStyle(), locale: Locales.indonesian)
        } else {
            let monthFormatter = DateFormatter()
            monthFormatter.dateFormat = "MMMM"
            let stringMonth = indonesianMonth(of: monthFormatter.string(from: self))
            qolloquialString = self.convertToString(withFormat: "d __ yyyy, hh.mm a").replacingOccurrences(of: "__", with: stringMonth)
            //                qolloquialString = "\(self.convertToString(withFormat: "d")) \(stringMonth) \(self.convertToString(withFormat: "yyyy, hh.mm a"))"
        }
        return qolloquialString
    }
    
    func indonesianFormat(shortMonth: Bool = false, showDay: Bool = true) -> String {
        let dayFormatter = DateFormatter()
        dayFormatter.dateFormat = "EEEE"
        let stringDay = dayFormatter.string(from: self)
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "d __ yyyy"
        if shortMonth {
            dateFormatter.dateFormat = "dd/MM/yyyy"
        }
        let monthFormatter = DateFormatter()
        monthFormatter.dateFormat = "MMMM"
        let stringMonth = indonesianMonth(of: monthFormatter.string(from: self))
        if showDay {
            return "\(indonesianDay(of: stringDay)), \(dateFormatter.string(from: self).replacingOccurrences(of: "__", with: stringMonth))"
        } else {
            return "\(dateFormatter.string(from: self).replacingOccurrences(of: "__", with: stringMonth))"
        }
    }
    
    func scheduleDateFormat() -> String {
        let dayFormatter = DateFormatter()
        dayFormatter.dateFormat = "EEEE"
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "dd __ yyyy, HH.mm"
        let monthFormatter = DateFormatter()
        monthFormatter.dateFormat = "MMMM"
        let stringMonth = indonesianMonth(of: monthFormatter.string(from: self))
        return "\(dateFormatter.string(from: self).replacingOccurrences(of: "__", with: stringMonth))"
    }
    
    func getTimeOnly() -> String {
        let formatter = DateFormatter()
        formatter.dateFormat = "HH:mm"
        return formatter.string(from: self)
    }
    
    func kickOfFormat() -> String {
        let dayFormatter = DateFormatter()
        dayFormatter.dateFormat = "EEEE"
        let stringDay = dayFormatter.string(from: self)
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "dd __ yyyy"
        let timeFormatter = DateFormatter()
        timeFormatter.dateFormat = "HH:mm a"
        let monthFormatter = DateFormatter()
        monthFormatter.dateFormat = "MMMM"
        let stringMonth = indonesianMonth(of: monthFormatter.string(from: self))
        return "\(indonesianDay(of: stringDay)) \(dateFormatter.string(from: self)), Kick-off at \(timeFormatter.string(from: self).lowercased())".replacingOccurrences(of: "__", with: stringMonth)
    }
    
    private func indonesianDay(of day: String) -> String {
        switch day.lowercased() {
        case "monday":
            return "Senin"
        case "tuesday":
            return "Selasa"
        case "wednesday":
            return "Rabu"
        case "thursday":
            return "Kamis"
        case "friday":
            return "Jumat"
        case "saturday":
            return "Sabtu"
        case "sunday":
            return "Minggu"
        default:
            return ""
        }
    }
    
    private func indonesianMonth(of month: String) -> String {
        switch month.lowercased() {
        case "january":
            return "Januari"
        case "february":
            return "Februari"
        case "march":
            return "Maret"
        case "april":
            return "April"
        case "may":
            return "Mei"
        case "june":
            return "Juni"
        case "july":
            return "Juli"
        case "august":
            return "Agustus"
        case "september":
            return "September"
        case "october":
            return "Oktober"
        case "november":
            return "November"
        case "december":
            return "Desember"
        default:
            return month.lowercased()
        }
    }
    
}
