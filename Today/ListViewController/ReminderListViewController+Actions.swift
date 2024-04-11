//
//  ReminderListViewController+Actions.swift
//  Today
//
//  Created by eternal on 2024/4/11.
//

import UIKit

extension ReminderListViewController {
    @objc func didPressDoneButton(_ sender: ReminderDoneButton) {
        guard let id = sender.id else {
            return
        }
        completeReminder(withId: id)
    }
}
