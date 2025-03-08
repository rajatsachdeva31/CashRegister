//
//  CashRegisterView.swift
//  CashRegister
//
//  Created by Rajat Sachdeva on 2025-03-04.
//

import SwiftUI

struct CashRegisterView: View {
    @StateObject private var viewModel = CashRegisterViewModel()
    
    var body: some View {
        NavigationView {
            VStack {
                // Product Table
                List(viewModel.products) { product in
                    HStack {
                        Text(product.name)
                            .font(.headline)
                        Spacer()
                        Text("Qty: \(product.quantity)")
                        Text("$\(product.price, specifier: "%.2f")")
                    }
                    .onTapGesture {
                        viewModel.selectedProduct = product
                    }
                }
                
                // Selected Product & Quantity
                VStack {
                    Text("Selected: \(viewModel.selectedProduct?.name ?? "None")")
                        .font(.title2)
                    Text("Quantity: \(viewModel.selectedQuantity)")
                        .font(.title)
                }
                .padding()
                
                // Custom Number Pad
                CustomNumberPad(enteredValue: $viewModel.selectedQuantity)
                
                // Buy Button
                Button("Buy") {
                    viewModel.buyProduct()
                }
                .disabled(viewModel.selectedProduct == nil || viewModel.selectedQuantity.isEmpty)
                .padding()
                .background(Color.blue)
                .foregroundColor(.white)
                .cornerRadius(10)
                
                // Manager Panel
                NavigationLink("Manager Panel", destination: ManagerPanelView(viewModel: viewModel))
                    .padding()
            }
            .navigationTitle("Cash Register")
        }
    }
}
