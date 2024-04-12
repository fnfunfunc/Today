//
//  ReminderListStyle.swift
//  Today
//
//  Created by eternal on 2024/4/12.
//

import Foundation

enum ReminderListStyle: Int {
    case today, future, all
    
    var name: String {
            switch self {
            case .today:
                NSLocalizedString("Today", comment: "Today style name")
            case .future:
                NSLocalizedString("Future", comment: "Future style name")
            case .all:
                NSLocalizedString("All", comment: "All style name")
            }
        }
    
    func shouldInclude(date: Date) -> Bool {
        let isInToday = Locale.current.calendar.isDateInToday(date)
        return switch self {
        case .today:
            isInToday
        case .future:
            date > Date.now && !isInToday
        case .all:
            true
        }
    }
}
