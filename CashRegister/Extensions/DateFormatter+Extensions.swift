//
//  DateFormatter+Extensions.swift
//  CashRegister
//
//  Created by Rajat Sachdeva on 2025-03-04.
//

import Foundation

extension DateFormatter {
    static var shortDate: DateFormatter {
        let formatter = DateFormatter()
        formatter.dateStyle = .short
        return formatter
    }
}
