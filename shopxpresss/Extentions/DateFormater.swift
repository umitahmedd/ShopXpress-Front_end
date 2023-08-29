//
//  DateFormater.swift
//  shopxpresss
//
//  Created by mac on 30.08.2023.
//

import Foundation

func relativeTimeDescription(timestamp: Int) -> String {
    let now = Date()
    let pastDate = Date(timeIntervalSince1970: TimeInterval(timestamp))
    let calendar = Calendar.current
    
    if let second = calendar.dateComponents([.second], from: pastDate, to: now).second, second < 60 {
        return "\(second) saniye önce"
    }
    
    if let minute = calendar.dateComponents([.minute], from: pastDate, to: now).minute, minute < 60 {
        return "\(minute) dakika önce"
    }
    
    if let hour = calendar.dateComponents([.hour], from: pastDate, to: now).hour, hour < 24 {
        return "\(hour) saat önce"
    }
    
    if let day = calendar.dateComponents([.day], from: pastDate, to: now).day, day < 30 {
        return "\(day) gün önce"
    }
    
    if let month = calendar.dateComponents([.month], from: pastDate, to: now).month, month < 12 {
        return "\(month) ay önce"
    }
    
    let dateFormatter = DateFormatter()
    dateFormatter.locale = Locale(identifier: "tr_TR")
    dateFormatter.dateFormat = "dd.MM.yyyy"
    return dateFormatter.string(from: pastDate)
}
