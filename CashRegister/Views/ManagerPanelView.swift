//
//  ManagerPanelView.swift
//  CashRegister
//
//  Created by Rajat Sachdeva on 2025-03-04.
//

import SwiftUI

struct ManagerPanelView: View {
    @ObservedObject var viewModel: CashRegisterViewModel
    
    var body: some View {
        VStack {
            NavigationLink("Purchase History", destination: HistoryView(viewModel: viewModel))
            NavigationLink("Restock", destination: RestockView(viewModel: viewModel))
        }
        .navigationTitle("Manager Panel")
    }
}
