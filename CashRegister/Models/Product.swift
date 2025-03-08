//
//  Product.swift
//  CashRegister
//
//  Created by Rajat Sachdeva on 2025-03-04.
//

import Foundation

struct Product: Identifiable, Hashable {
    let id = UUID()
    var name: String
    var price: Double
    var quantity: Int
}
