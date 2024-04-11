//
//  ReminderViewController+Row.swift
//  Today
//
//  Created by eternal on 2024/4/11.
//

import UIKit

extension ReminderViewController {
    enum Row: Hashable {
        case header(String)
        case date, notes, time, title

        var imageName: String? {
            switch self {
            case .date: "calendar.circle"
            case .notes: "square.and.pencil"
            case .time: "clock"
            default: nil
            }
        }

        var image: UIImage? {
            guard let imageName = imageName else { return nil }
            let configuration = UIImage.SymbolConfiguration(textStyle: .headline)
            return UIImage(systemName: imageName, withConfiguration: configuration)
        }

        var textStyle: UIFont.TextStyle {
            switch self {
            case .title: return .headline
            default: return .subheadline
            }
        }
    }
}
