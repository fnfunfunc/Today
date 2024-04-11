//
//  ReminderViewController+Section.swift
//  Today
//
//  Created by eternal on 2024/4/11.
//

import Foundation

extension ReminderViewController {
    enum Section: Int, Hashable {
        case view, title, date, notes
        
        var name: String {
            switch self {
            case .view: ""
            case .title: NSLocalizedString("Title", comment: "Title section name")
            case .date: NSLocalizedString("Date", comment: "Date section name")
            case .notes: NSLocalizedString("Notes", comment: "Notes section name")
            }
        }
    }
}
