//
//  Purchase.swift
//  CashRegister
//
//  Created by Rajat Sachdeva on 2025-03-04.
//

import Foundation

struct Purchase: Identifiable {
    let id = UUID()
    var name: String
    var quantity: Int
    var totalPrice: Double
    var date: Date
}
