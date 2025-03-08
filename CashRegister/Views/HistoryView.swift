//
//  HistoryView.swift
//  CashRegister
//
//  Created by Rajat Sachdeva on 2025-03-04.
//

import SwiftUI

struct HistoryView: View {
    @ObservedObject var viewModel: CashRegisterViewModel
    
    var body: some View {
        List(viewModel.history) { purchase in
            VStack(alignment: .leading) {
                Text(purchase.name).bold()
                Text("Qty: \(purchase.quantity) | Total: $\(purchase.totalPrice, specifier: "%.2f")")
                Text("Date: \(purchase.date, formatter: DateFormatter.shortDate)")
            }
        }
        .navigationTitle("Purchase History")
    }
}
