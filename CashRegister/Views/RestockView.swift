//
//  RestockView.swift
//  CashRegister
//
//  Created by Rajat Sachdeva on 2025-03-04.
//

import SwiftUI

struct RestockView: View {
    @ObservedObject var viewModel: CashRegisterViewModel
    @State private var selectedProduct: Product? = nil
    @State private var restockAmount: String = ""
    
    var body: some View {
        VStack {
            Picker("Select Product", selection: $selectedProduct) {
                ForEach(viewModel.products, id: \.self) { product in
                    Text(product.name).tag(product as Product?)
                }
            }
            .pickerStyle(MenuPickerStyle())
            
            TextField("Enter Quantity", text: $restockAmount)
                .keyboardType(.numberPad)
                .padding()
                
            Button("Restock") {
                if let product = selectedProduct, let amount = Int(restockAmount) {
                    viewModel.restockProduct(product: product, amount: amount)
                    restockAmount = ""
                }
            }
        }
        .navigationTitle("Restock")
    }
}
