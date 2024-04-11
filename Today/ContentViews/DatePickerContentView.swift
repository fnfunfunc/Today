//
//  DatePickerContentView.swift
//  Today
//
//  Created by eternal on 2024/4/11.
//

import UIKit

class DatePickerContentView: UIView, UIContentView {
    struct Configuration: UIContentConfiguration {
        var date = Date.now
        var onChange: (Date) -> Void = { _ in }
        
        func makeContentView() -> UIView & UIContentView {
            return DatePickerContentView(self)
        }
    }
    
    let datePicker = UIDatePicker()
    var configuration: UIContentConfiguration {
        didSet {
            configure(configuration: configuration)
        }
    }
    
    init(_ configuration: Configuration) {
        self.configuration = configuration
        super.init(frame: .zero)
        addPinnedSubView(datePicker)
        datePicker.addTarget(self, action: #selector(didPick(_:)), for: .valueChanged)
        datePicker.preferredDatePickerStyle = .inline
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func configure(configuration: UIContentConfiguration) {
        guard let configuration = configuration as? Configuration else { return }
        datePicker.date = configuration.date
    }
    
    @objc private func didPick(_ sender: UIDatePicker) {
        guard let configuration = configuration as? Configuration else { return }
        configuration.onChange(sender.date)
    }
}

extension UICollectionViewListCell {
    func datePickerConfiguration() -> DatePickerContentView.Configuration {
        .init()
    }
}
