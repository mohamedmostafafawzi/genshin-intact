//
//  Date+Extensions.swift
//  Genshin Intact
//
//  Created by Mohamed Fawzi on 11/17/23.
//

import Foundation

extension Date {
    /// Converts date to time interval since 1970
    public var millisecondsSince1970:Int64 {
        return Int64((self.timeIntervalSince1970 * 1000.0).rounded())
    }
    /// Converts date to elapsed interval (Ex: 3d ago)
    public func getElapsedInterval() -> String {
        let secondsAgo = Int(Date().timeIntervalSince(self))
        let minute = 60
        let hour = 60 * minute
        let day = 24 * hour
        let week = 7 * day
        let month = 4 * week
        let quotient: Int
        let unit: String
        if secondsAgo < minute {
            quotient = 0
            unit = "s"
        } else if secondsAgo < hour {
            quotient = secondsAgo / minute
            unit = "m"
        } else if secondsAgo < day {
            quotient = secondsAgo / hour
            unit = "h"
        } else if secondsAgo < week {
            quotient = secondsAgo / day
            unit = "d"
        } else if secondsAgo < month {
            quotient = secondsAgo / week
            unit = "w"
        } else {
            quotient = secondsAgo / month
            unit = "m"
        }
        return quotient == 0 ? "Now" : "\(quotient)\(unit) ago"
    }
    /// Converts date to string
    public func toString(dateFormat: String) -> String {
        let df = DateFormatter()
        df.dateFormat = dateFormat
        let now = df.string(from: self)
        return now
    }
    /// Returns a string formatted date. Ex. "2022-12-26T01:00"
    public var formattedDate: String {
        let dateFormatter = DateFormatter()
        dateFormatter.locale = Locale(identifier: "en_US")
        dateFormatter.dateFormat = "yyyy-MM-dd'T'HH:mm"
        return dateFormatter.string(from: self)
    }
}
