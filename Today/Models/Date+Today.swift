//
//  Date+Today.swift
//  Today
//
//  Created by eternal on 2024/4/10.
//

import Foundation

extension Date {
    var dayAndTimeText: String {
        let timeText = formatted(date: .omitted, time: .shortened)
        if Locale.current.calendar.isDateInToday(self) {
            let timeFormat = NSLocalizedString("Today at %@", comment: "Today at time format string")
            return String(format: timeFormat, timeText)
        } else {
            let dateText = formatted(.dateTime.month(.abbreviated).day())
            let timeFormat = NSLocalizedString("%@ at %@", comment: "Date and time format string")
            return String(format: timeFormat, dateText, timeText)
        }
    }
    
    var dayText: String {
        if Locale.current.calendar.isDateInToday(self) {
            NSLocalizedString("Today", comment: "Today due date description")
        } else {
            formatted(.dateTime.month().day().weekday(.wide))
        }
    }
}
