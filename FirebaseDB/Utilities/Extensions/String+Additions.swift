//
//  NSDate+Additions.swift
//
//
//  Copyright © 2016 Suitmedia. All rights reserved.
//

import Foundation

extension String {

    var decodeEmoji: String{
        let data = self.data(using: String.Encoding.utf8);
        let decodedStr = NSString(data: data!, encoding: String.Encoding.nonLossyASCII.rawValue)
        if let str = decodedStr{
            return str as String
        }
        return self
    }
    
    var encodeEmoji: String{
        if let encodeStr = NSString(cString: self.cString(using: .nonLossyASCII)!, encoding: String.Encoding.utf8.rawValue){
            return encodeStr as String
        }
        return self
    }
    
    func padLeft(totalWidth: Int,byString:String) -> String {
        let toPad = totalWidth - self.count
        if toPad < 1 {
            return self
        }
        return "".padding(toLength: toPad, withPad: byString, startingAt: 0) + self
    }
    
    func duration() -> String {
//        var durationStr = self
//        durationStr = durationStr.replacingOccurrences(of: "PT", with: "")
//        durationStr = durationStr.replacingOccurrences(of: "M", with: ":")
//        durationStr = durationStr.replacingOccurrences(of: "S", with: "")
//        let durations = durationStr.components(separatedBy: ":")
//        if durations.count == 1 {
//            return "00:" + durations[0].padLeft(totalWidth: 2, byString: "0")
//        } else if durations.count == 2 {
//            return durations[0].padLeft(totalWidth: 2, byString: "0") + ":" + durations[1].padLeft(totalWidth: 2, byString: "0")
//        } else {
//            return "-"
//        }
        return self
    }
    
    func changeDateFormat(from: String, to: String) -> String {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = from
        let date = dateFormatter.date(from: self)
        var dateWithNewFormat = ""
        if let dateConverted = date {
            dateWithNewFormat = dateConverted.convertToString(withFormat: to)
        }
        return dateWithNewFormat
    }
    
    func convertHtml() -> NSAttributedString {
        guard let data = data(using: .utf8) else { return NSAttributedString() }
        do {
            return try NSAttributedString(data: data, options: [.documentType: NSAttributedString.DocumentType.html, .characterEncoding: String.Encoding.utf8.rawValue], documentAttributes: nil)
        } catch {
            return NSAttributedString()
        }
    }
    
}
