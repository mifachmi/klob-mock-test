//
//  TimeFormatter.swift
//  KlobAssessment
//
//  Created by Fachmi Dimas Ardhana on 09/12/24.
//

import Foundation

func timeAgo(from dateString: String, format: String = "yyyy-MM-dd") -> String {
    let dateFormatter = DateFormatter()
    dateFormatter.dateFormat = format
    dateFormatter.locale = Locale.current
    
    guard let date = dateFormatter.date(from: dateString) else {
        return "unknown date"
    }
    
    let now = Date()
    let calendar = Calendar.current
    
    let components = calendar.dateComponents([.year, .month, .weekOfYear, .day, .hour, .minute, .second], from: date, to: now)
    
    if let year = components.year, year > 0 {
        return year == 1 ? "a year ago" : "\(year) years ago"
    } else if let month = components.month, month > 0 {
        return month == 1 ? "a month ago" : "\(month) months ago"
    } else if let week = components.weekOfYear, week > 0 {
        return week == 1 ? "a week ago" : "\(week) weeks ago"
    } else if let day = components.day, day > 0 {
        return day == 1 ? "a day ago" : "\(day) days ago"
    } else if let hour = components.hour, hour > 0 {
        return hour == 1 ? "an hour ago" : "\(hour) hours ago"
    } else if let minute = components.minute, minute > 0 {
        return minute == 1 ? "a minute ago" : "\(minute) minutes ago"
    } else {
        return "just now"
    }
}
