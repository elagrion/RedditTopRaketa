//
//  DateSince.swift
//  RedditTopRaketa
//
//  Created by Oleg Agapov on 24.03.2020.
//  Copyright © 2020 Oleg Agapov. All rights reserved.
//

import Foundation

extension Date {
    
    func daysPassed(since: Date = Date()) -> Int? {
        guard since > self else { return nil }
        
        let calendar = Calendar.current
        
        let date1 = calendar.startOfDay(for: self)
        let date2 = calendar.startOfDay(for: since)
          
        let components = calendar.dateComponents([.day], from: date1, to: date2)
        return components.day
    }
    
    func hoursPassed(since: Date = Date()) -> Int? {
        guard since > self else { return nil }
        let interval = timeIntervalSince(since)
        let hours = interval / 60.0 / 60.0
        return Int(hours)
    }
    
    func minutesPassed(since: Date = Date()) -> Int? {
        guard since > self else { return nil }
        let interval = timeIntervalSince(since)
        let minutes = interval / 60.0
        return Int(minutes)
    }
    
    func sinceString() -> String {
        let days = daysPassed() ?? 0
        let hours = hoursPassed() ?? 0
        let minutes = minutesPassed() ?? 0
        
        if days > 0 {
            return String.daysAgo(days)
        } else if hours > 0 {
            return String.hoursAgo(hours)
        } else {
            return String.minutesAgo(minutes)
        }
    }
}

extension String {
    static func daysAgo(_ days: Int) -> String {
        switch days {
        case 0: return "Today"
        case 1: return "Yesterday"
        default: return "\(days) days ago"
        }
    }
    
    static func hoursAgo(_ hours: Int) -> String {
        switch hours {
        case 0: return "Recently"
        case 1: return "\(hours) hour ago"
        default: return "\(hours) hours ago"
        }
    }
    
    static func minutesAgo(_ minutes: Int) -> String {
        switch minutes {
        case 0: return "Recently"
        case 1: return "\(minutes) minute ago"
        default: return "\(minutes) minutes ago"
        }
    }
}
